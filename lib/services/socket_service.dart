import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../api/api.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  IO.Socket? _socket;
  bool _isConnected = false;
  int? _currentUserId;
  int? _otherUserId;
  int? _currentUserRoomId;
  int? _chatUserRoomId;
  
  bool get isConnected => _isConnected;
  IO.Socket? get socket => _socket;

  void initialize({
    required int currentUserId,
    required int otherUserId,
    int? currentUserRoomId,
    int? chatUserRoomId,
  }) {
    _currentUserId = currentUserId;
    _otherUserId = otherUserId;
    _currentUserRoomId = currentUserRoomId;
    _chatUserRoomId = chatUserRoomId;
  }

  void connect() {
    try {
      // Connect to the Socket.IO server with more specific options
      _socket = IO.io(ApiUrls.BASE_URL2, <String, dynamic>{
        'transports': ['websocket', 'polling'],
        'autoConnect': true,
        'forceNew': true,
        'reconnection': true,
        'reconnectionAttempts': 10,
        'reconnectionDelay': 2000,
        'timeout': 20000,
      });
        
      // Listen for connection
      _socket!.on('connect', (_) {
        print('Socket.IO connected: ${_socket!.id}');
          
        // Emit login event after connection is established
        if (_currentUserId != null && _currentUserId! > 0) {
          _socket!.emit('login', {
            'userId': _currentUserId.toString()
          });
          print('Sent login event with userId: $_currentUserId');
            
          // Join room after login
          _joinRoom();
            
          // Update connection status
          _isConnected = true;
        }
      });
        
      // Listen for disconnection
      _socket!.on('disconnect', (reason) {
        print('Socket.IO disconnected: $reason');
        _isConnected = false;
        
        // Attempt to reconnect automatically unless it was a manual disconnect
        if (reason != 'io client disconnect') {
          print('Attempting to reconnect to socket...');
          Future.delayed(Duration(seconds: 3), () {
            if (_isConnected == false) {  // Only reconnect if still disconnected
              connect();
            }
          });
        }
      });
        
      // Listen for connection errors
      _socket!.on('connect_error', (error) {
        print('Socket.IO connect error: $error');
        _isConnected = false;
      });
        
      // Listen for other errors
      _socket!.on('error', (error) {
        print('Socket.IO general error: $error');
        _isConnected = false;
      });
        
      print('Socket.IO connecting to ${ApiUrls.BASE_URL2} with options');
    } catch (e) {
      print('Error connecting to Socket.IO: $e');
      _isConnected = false;
    }
  }

  void _joinRoom() {
    if (_socket != null) {
      // Prepare room data - use a single room ID for both users
      Map<String, dynamic> roomData = {};
      
      // Use the common room ID that both users should join
      int? commonRoomId = _currentUserRoomId ?? _chatUserRoomId;
      
      if (commonRoomId != null) {
        // Both users should join the same room using the common room ID
        roomData = {
          'room': commonRoomId.toString(), // Using 'room' as the key to join the specific room
        };
        print('Joining room with common room ID: $commonRoomId');
      } else {
        // Fallback: create a room identifier based on user IDs
        if (_currentUserId != null && _otherUserId != null) {
          // Create a consistent room ID by sorting the user IDs
          List<int> userIds = [_currentUserId!, _otherUserId!];
          userIds.sort();
          String fallbackRoomId = 'chat_${userIds[0]}_${userIds[1]}';
          roomData = {
            'room': fallbackRoomId,
          };
          print('Joining room with fallback ID: $fallbackRoomId');
        } else {
          print('Cannot join room: Missing user IDs');
          return;
        }
      }
      
      // Join the room via Socket.IO
      _socket!.emit('join', roomData);
    }
  }

  void listenForMessages(void Function(Map<String, dynamic> messageData) onMessageReceived) {
    _socket!.on('new message', (data) {
      try {
        print('Received new message: $data');
        // Parse the received data
        Map<String, dynamic> messageData = data is String ? json.decode(data) : data;
        
        // Check if the message belongs to the current room
        if (_isValidMessageForCurrentRoom(messageData)) {
          onMessageReceived(messageData);
        }
      } catch (e) {
        print('Error processing WebSocket message: $e');
      }
    });
  }

  // Helper function to check if message is for current room
  bool _isValidMessageForCurrentRoom(Map<String, dynamic> messageData) {
    // Check if the message room matches our current room
    dynamic messageRoom = messageData['room'];
    int? currentRoomId = _currentUserRoomId ?? _chatUserRoomId;
    
    if (messageRoom != null && currentRoomId != null) {
      return messageRoom == currentRoomId ||
             messageRoom == currentRoomId.toString();
    }
    
    // If room is not specified, fall back to user-based check
    String? fromUser = messageData['from_user']?.toString();
    String? toUser = messageData['to_user']?.toString();
    
    // Make sure user IDs are not null before comparison
    if (_otherUserId != null && _currentUserId != null) {
      return (fromUser == _otherUserId.toString() && toUser == _currentUserId.toString()) ||
             (fromUser == _currentUserId.toString() && toUser == _otherUserId.toString());
    }
    
    // If user IDs are null, return false
    return false;
  }

  void sendMessage({
    required String messageText,
    String? image,
  }) {
    // Check if socket is connected and user IDs are valid
    if (_socket != null && _isConnected && _currentUserId != null && _otherUserId != null) {
      // Get the common room ID for both users
      int? commonRoomId = _currentUserRoomId ?? _chatUserRoomId;
      
      Map<String, dynamic> messageData = {
        'user': _currentUserId.toString(), // Using current user ID as username
        'room': commonRoomId?.toString() ?? 'default_room', // Using the common room ID
        'message': messageText,
        'from_user': _currentUserId.toString(),
        'to_user': _otherUserId.toString(),
        'created_at': DateTime.now().toIso8601String(),
        'timestamp': DateTime.now().millisecondsSinceEpoch, // Adding timestamp to help identify echo messages
      };

      // Add image if provided
      if (image != null) {
        messageData['image'] = image;
      }
      
      _socket!.emit('message', messageData);
      if (image != null) {
        print('Sent image message using new format to room ${messageData['room']}: $image');
      } else {
        print('Sent text message using new format to room ${messageData['room']}: $messageText');
      }
    } else {
      if (_currentUserId == null || _otherUserId == null) {
        print('Cannot send message - Missing user IDs');
      } else {
        print('Cannot send message - Socket.IO not connected');
      }
    }
  }

  void sendImageMessage(String imageUrl) {
    // Check if socket is connected and user IDs are valid
    if (_socket != null && _isConnected && _currentUserId != null && _otherUserId != null) {
      // Get the common room ID for both users
      int? commonRoomId = _currentUserRoomId ?? _chatUserRoomId;
      
      // Prepare the image message data according to backend expectations
      Map<String, dynamic> messageData = {
        'user': _currentUserId.toString(), // Using current user ID as username
        'room': commonRoomId?.toString() ?? 'default_room', // Using the common room ID
        'message': '', // Empty for image only
        'image': imageUrl,
        'from_user': _currentUserId.toString(),
        'to_user': _otherUserId.toString(),
        'created_at': DateTime.now().toIso8601String(),
        'timestamp': DateTime.now().millisecondsSinceEpoch, // Adding timestamp to help identify echo messages
      };
      
      // Send the image message via Socket.IO
      _socket!.emit('message', messageData);
      print('Sent image message via Socket.IO: $imageUrl to room: ${messageData['room']}');
    } else {
      if (_currentUserId == null || _otherUserId == null) {
        print('Cannot send image message - Missing user IDs');
      } else {
        print('Socket.IO is not ready yet. Cannot send image message: $imageUrl');
      }
    }
  }

  void disconnect() {
    // Disconnect functionality disabled to maintain persistent connection
    // _socket?.disconnect();
    // _isConnected = false;
  }
}