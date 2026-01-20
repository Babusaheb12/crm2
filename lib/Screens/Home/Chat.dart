import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import '../../Controller/AgentController/Authcontroller.dart';
import '../../Response/AgentResponse/ChatHistoryResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../../services/socket_service.dart';

class Chat extends StatefulWidget {
  final String? chatName;
  final String? chatRole;
  final String? chatImage;
  final int? otherUserId;
  final int? currentUserRoomId;
  final int? chatUserRoomId;
  
  const Chat({super.key, this.chatName, this.chatRole, this.chatImage, this.otherUserId, this.currentUserRoomId, this.chatUserRoomId});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Map<String, dynamic>> messages = [];
  bool _isLoading = true;
  final AuthController _authController = Get.find();
  int? _currentUserId;
  int? _otherUserId;
  SocketService? _socketService;
  final ScrollController _scrollController = ScrollController();
  Set<String> _sentMessageSet = Set<String>(); // Track sent messages to avoid duplicates;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }
  
  Future<void> _initializeChat() async {
    await _getCurrentUserId();
    _connectWebSocket();
    _loadChatHistory();
  }

  Future<void> _getCurrentUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Try to get user ID from shared preferences
    _currentUserId = prefs.getInt('user_id');
    
    print('Current user ID from preferences: $_currentUserId');
    
    // Use the other user ID passed through widget
    _otherUserId = widget.otherUserId;
    print('Other user ID: $_otherUserId');

    if (_otherUserId == null || _otherUserId == 0) {
      _otherUserId = 0;
    }
  }

  Future<void> _loadChatHistory() async {
    await Future.delayed(Duration(milliseconds: 100));
    bool isCurrentUserIdValid = _currentUserId != null && _currentUserId! > 0;
    bool isOtherUserIdValid = _otherUserId != null && _otherUserId! > 0;
    
    if (isCurrentUserIdValid && isOtherUserIdValid) {
      print('Loading chat history for user2: $_otherUserId, id: $_currentUserId');
      try {
        var response = await _authController.getChatHistory(
          user2: _otherUserId!,
          id: _currentUserId!,
        );
        
        if (response.statusCode == 200 && response.body['result'] == 'success') {
          ChatHistoryResponse chatHistoryResponse = ChatHistoryResponse.fromJson(response.body);
          List<Map<String, dynamic>> apiMessages = [];
          for (var message in chatHistoryResponse.data ?? []) {
            bool isMe = message.fromUser == _currentUserId.toString();
            Map<String, dynamic> messageEntry = {
              "msg": message.text ?? "",
              "time": message.timeAt ?? _getCurrentTime(),
              "isMe": isMe,
              "date": message.createdAt ?? "",
            };
            if (message.image != null &&
                message.image!.isNotEmpty && 
                message.image != "undefined") {
              messageEntry["type"] = "image";
              // Construct the full image URL using the base URL
              // messageEntry["path"] = "https://crm.technoderivation.com/test-api/assets/images/" + message.image!;
              messageEntry["path"] =
                  ApiUrls.BASE_URL.replaceAll("App/", "assets/images/") +
                      message.image!;

            }
            
            apiMessages.add(messageEntry);
          }
          
          setState(() {
            messages = apiMessages;
            _isLoading = false;
          });
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
          _cleanupSentMessages();
          
          print('Loaded ${apiMessages.length} messages from API');
        } else {
          print('Failed to load chat history: ${response.body}');
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        print('Error loading chat history: $e');
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      print('User IDs not available: current=$_currentUserId (valid: $isCurrentUserIdValid), other=$_otherUserId (valid: $isOtherUserIdValid)');
      if (!isCurrentUserIdValid) {
        print('Current user ID is invalid. User may need to log in first.');
      }
      if (!isOtherUserIdValid) {
        print('Other user ID is invalid. Chat may not be properly initialized.');
      }
      
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  void _connectWebSocket() {
    // Initialize and connect to the socket service
    // Only proceed if user IDs are valid
    if (_currentUserId != null && _otherUserId != null && _currentUserId! > 0 && _otherUserId! > 0) {
      _socketService = SocketService();
      _socketService!.initialize(
        currentUserId: _currentUserId!, // Safe to use ! here since we verified not null in condition
        otherUserId: _otherUserId!,   // Safe to use ! here since we verified not null in condition
        currentUserRoomId: widget.currentUserRoomId,
        chatUserRoomId: widget.chatUserRoomId,
      );
      
      _socketService!.connect();
      
      // Listen for incoming messages
      _socketService!.listenForMessages(_handleReceivedMessage);
    } else {
      print('Cannot initialize socket service: Invalid user IDs - current: $_currentUserId, other: $_otherUserId');
    }
  }
  
  void _handleReceivedMessage(Map<String, dynamic> data) {
    // Extract message information from the new message event
    String? user = data['user'] ?? data['from_user']?.toString(); // Use from_user if user field is not available
    String? message = data['message'];
    String? image = data['image']; // Check if it's an image message
    String? time = data['time_at'] ?? _getCurrentTime();
    String? createdAt = data['created_at'];
    int? timestamp = data['timestamp'];
    
    // Determine if this message is from the current user
    // Check if _currentUserId is not null before comparing
    bool isMe = false;
    if (_currentUserId != null && user != null) {
      isMe = user == _currentUserId.toString();
    }
    
    // Create a unique key for deduplication - match the format used when sending
    String messageKey;
    if (image != null && image.isNotEmpty) {
      // For image messages, use the image and time format
      messageKey = "_${image}_${time}_";
    } else {
      // For text messages, use the message text and time format
      messageKey = "${message ?? ''}_${time}_";
    }
    
    // Check if this is a duplicate of a message we just sent
    if (_sentMessageSet.contains(messageKey)) {
      // This is a duplicate, handle appropriately based on message type
      if (image != null && image.isNotEmpty) {
        // For image messages, we need to either:
        // 1. Update the temporary image with server URL (if still uploading)
        // 2. Skip if this is the echo of an already updated message
        bool updatedExisting = false;
        
        // First, try to find and update any uploading temporary images
        for (int i = 0; i < messages.length; i++) {
          if (messages[i]['type'] == 'image' && 
              messages[i]['uploading'] == true) {
            // Found the temporary image, update it with the server URL
            String serverImageUrl = ApiUrls.BASE_URL.replaceAll("App/", "assets/images/") + image;
            setState(() {
              messages[i]['path'] = serverImageUrl;
              messages[i]['uploading'] = false;
              messages[i]['image_filename'] = image; // Store the filename separately
            });
            print('Updated image path with server URL: $serverImageUrl');
            updatedExisting = true;
            break; // Only update the first matching uploading image
          }
        }
        
        // If we didn't find any uploading images, this might be an echo of an already processed message
        // Check if we already have this exact image message
        if (!updatedExisting) {
          for (int i = 0; i < messages.length; i++) {
            if (messages[i]['type'] == 'image' && 
                messages[i]['path'] != null &&
                messages[i]['path'].toString().endsWith('/$image')) {
              // We already have this image, skip adding duplicate
              print('Skipping duplicate image message: $image');
              return;
            }
          }
        }
        
        // If we updated an existing message, we're done
        if (updatedExisting) {
          return;
        }
      } else {
        // For text messages, skip adding duplicate
        print('Skipping duplicate message: $message');
        return;
      }
    }
    
    if (mounted) {
      setState(() {
        // Check if we already have a similar local message to avoid duplication
        bool alreadyExists = false;
        if (isMe && (message != null || image != null) && (message?.isNotEmpty == true || image?.isNotEmpty == true)) {
          // Look for messages with the same content sent by current user recently
          for (var msg in messages.reversed) { // Check in reverse chronological order
            if ((msg['msg'] == message || msg['path'] == image) && 
                msg['isMe'] == true) {
              // If timestamp is available, check for exact match
              if (timestamp != null && msg['timestamp'] != null) {
                if (msg['timestamp'] == timestamp) {
                  alreadyExists = true;
                  break;
                }
              } else {
                // Fallback to time check if no timestamp
                if (msg['time'] == time) {
                  alreadyExists = true;
                  break;
                }
              }
            }
          }
        }
        
        // Only add the message if it doesn't already exist
        if (!alreadyExists) {
          if (image != null && image.isNotEmpty) {
            // This is an image message, construct the full URL
            String fullImageUrl =
                ApiUrls.BASE_URL.replaceAll("App/", "assets/images/") + image;

            messages.add({
              "msg": "", // No text message for images
              "time": time,
              "isMe": isMe,
              "date": _getCurrentDateString(), // Add current date for new messages
              "created_at": createdAt, // Store created_at if available
              "timestamp": timestamp, // Store timestamp if available
              "type": "image",
              "path": fullImageUrl,
            });
          } else {
            // Regular text message
            messages.add({
              "msg": message ?? "",
              "time": time,
              "isMe": isMe,
              "date": _getCurrentDateString(), // Add current date for new messages
              "created_at": createdAt, // Store created_at if available
              "timestamp": timestamp, // Store timestamp if available
            });
          }
        }
      });
      
      // Auto-scroll to the bottom after receiving a new message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
      
      // Cleanup sent messages periodically
      _cleanupSentMessages();
    }
    
    if (image != null) {
      print('Received image message from $user: $image');
    } else {
      print('Received message from $user: $message');
    }
  }
  // New function to send message with enhanced data structure
  void sendMessage(String messageText, {String? image}) {
    if (_socketService != null && _socketService!.isConnected) {
      _socketService?.sendMessage(messageText: messageText, image: image);
    } else {
      print('Cannot send message - Socket is not connected');
    }
  }
  
// Function to listen for incoming messages is now handled by SocketService

  @override
  void dispose() {
    _emitChatCloseEvent();
    _socketService?.disconnect(); 
    _scrollController.dispose(); 
    super.dispose();
  }
  
  void _cleanupSentMessages() {
    if (_sentMessageSet.length > 100) {
      List<String> messageList = _sentMessageSet.toList();
      int startIdx = messageList.length > 50 ? messageList.length - 50 : 0;
      _sentMessageSet = Set.from(messageList.sublist(startIdx));
    }
  }
  
  void _emitChatCloseEvent() {
    if (_currentUserId != null) {
      _socketService?.socket?.emit("chat_close", {
        "from_user": _currentUserId
      });
      print("Emitted chat_close event: from_user: $_currentUserId");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE5DD),
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  widget.chatImage ?? "https://i.pravatar.cc/150?img=1"),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatName ?? "Unknown",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                Text(widget.chatRole ?? "",
                    style:
                    TextStyle(fontSize: 12, color: Colors.white70)),
              ],
            ),
          ],
        ),
        // actions: const [
        //   Icon(Icons.videocam, color: Colors.white),
        //   SizedBox(width: 18),
        //   Icon(Icons.call, color: Colors.white),
        //   SizedBox(width: 18),
        //   // Icon(Icons.more_vert, color: Colors.white),
        //   // SizedBox(width: 8),
        // ],

      ),

      /// CHAT BODY
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: _getMessageWidgets().length,
              itemBuilder: (context, index) {
                return _getMessageWidgets()[index];
              },
            ),
          ),

          /// MESSAGE INPUT
          _messageInput(),
        ],
      ),
    );
  }

  Widget _chatBubble(String text, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(time,
                    style: const TextStyle(
                        fontSize: 11, color: Colors.grey)),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.done_all,
                      size: 16, color: Colors.blue),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageBubble(String imagePath, String time, bool isMe, {bool isUploading = false}) {
    // Check if the image path is valid
    if (imagePath == null || imagePath.isEmpty) {
      return Container(); // Return empty container if path is invalid
    }
    
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isUploading)
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 8),
                    Text(
                      'Uploading...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imagePath.startsWith('http') // If it's a URL
                    ? Image.network(
                        imagePath,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey[300],
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                      )
                    : Image.file(
                        File(imagePath),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey[300],
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(time,
                      style: const TextStyle(
                          fontSize: 11, color: Colors.grey)),
                  if (isMe) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.done_all,
                        size: 16, color: Colors.blue),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _dateChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  TextEditingController _messageController = TextEditingController();

  Widget _messageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: Colors.white,
      child: Row(
        children: [
          // const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
          // const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Message",
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFF0F0F0),
              ),
            ),
          ),
          const SizedBox(width: 6),
          IconButton(
            onPressed: _showAttachmentOptions,
            icon: Icon(Icons.attach_file, color: Color(0xFF0F6D5C)),
          ),
          const SizedBox(width: 6),
          IconButton(
            onPressed: _sendMessage,
            icon: Icon(Icons.send, color: Color(0xFF223e6d)),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      String currentTime = _getCurrentTime();
      String currentDate = _getCurrentDateString();
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      
      // Create a temporary message ID to track this message
      String tempMessageId = timestamp.toString();
      
      // Add the message to the UI immediately
      setState(() {
        messages.add({
          "id": tempMessageId, // Add temporary ID to track this message
          "msg": messageText,
          "time": currentTime,
          "isMe": true, // Current user's message should always be on right
          "date": currentDate, // Add current date
          "timestamp": timestamp, // Add timestamp for duplicate detection
        });
        
        // Add to tracking set to prevent duplicates - use the same key format that will be used when receiving
        String messageKey = "${messageText}_${currentTime}_";
        _sentMessageSet.add(messageKey);
      });
      
      // Send the message via WebSocket using the new function
      sendMessage(messageText);
      
      _messageController.clear();
      
      // Auto-scroll to the bottom after adding the message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    String hour = now.hour.toString();
    String minute = now.minute.toString().padLeft(2, '0');
    String period = now.hour >= 12 ? 'PM' : 'AM';
    int displayHour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
    return "${displayHour}:${minute} $period";
  }
  
  String _getCurrentDateString() {
    DateTime now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }
  
  List<Widget> _getMessageWidgets() {
    List<Widget> widgets = [];
    String previousDate = "";
    
    for (int i = 0; i < messages.length; i++) {
      Map<String, dynamic> message = messages[i];
      
      // Extract date from date field
      String currentDate = _getDateFromTimeString(message["date"] ?? "");
      
      // Add date chip if it's a new date
      if (currentDate != previousDate) {
        widgets.add(Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: _dateChip(currentDate),
        ));
        previousDate = currentDate;
      }
      
      // Add message bubble
      if (message.containsKey('type') && message['type'] == 'image') {
        String imagePath = message["path"] ?? "";
        bool isUploading = message["uploading"] ?? false;
        if (imagePath.isNotEmpty) {
          widgets.add(_imageBubble(
            imagePath,
            message["time"] ?? "",
            message["isMe"] ?? false,
            isUploading: isUploading,
          ));
        } else {
          // If image path is empty, return a text bubble instead
          widgets.add(_chatBubble(
            message["msg"] ?? "Failed to load image",
            message["time"] ?? "",
            message["isMe"] ?? false,
          ));
        }
      } else {
        widgets.add(_chatBubble(
          message["msg"] ?? "",
          message["time"] ?? "",
          message["isMe"] ?? false,
        ));
      }
    }
    
    return widgets;
  }
  
  String _getDateFromTimeString(String dateString) {
    // Use the date field that's stored with the message
    try {
      if (dateString.isNotEmpty) {
        DateTime messageDate = DateTime.parse(dateString);
        DateTime now = DateTime.now();
        
        // Compare dates
        if (messageDate.year == now.year && 
            messageDate.month == now.month && 
            messageDate.day == now.day) {
          return "Today";
        } else if (messageDate.year == now.year && 
                   messageDate.month == now.month && 
                   messageDate.day == now.day - 1) {
          return "Yesterday";
        } else {
          // Format the date as "Jan 7, 2026" or similar
          return "${messageDate.month}/${messageDate.day}/${messageDate.year}";
        }
      } else {
        return "Today";
      }
    } catch (e) {
      // If parsing fails, default to Today
      return "Today";
    }
  }
  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.image, color: Color(0xFF0F6D5C)),
                title: Text('Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      
      if (pickedFile != null) {
        String imagePath = pickedFile.path;
        
        // Show temporary image message with uploading status
        int timestamp = DateTime.now().millisecondsSinceEpoch;
        String tempId = timestamp.toString();
        
        setState(() {
          messages.add({
            "id": tempId,
            "msg": "",
            "time": _getCurrentTime(),
            "isMe": true,
            "type": "image",
            "path": imagePath,
            "uploading": true, // Mark as uploading
            "timestamp": timestamp,
          });
        });
        
        // Auto-scroll to the bottom after adding the message
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
        
        try {
          // Upload image to server
          var response = await _authController.uploadChatImage(imagePath);
          
          if (response.statusCode == 200) {
            // Parse the response to extract the image filename
            Map<String, dynamic> responseBody = response.body is String ? json.decode(response.body) : response.body;
            String imageFilename = responseBody['data']['image'];
            
            // Construct the full image URL using the base URL
            String imageUrl = ApiUrls.BASE_URL.replaceAll("App/", "assets/images/") + imageFilename;
            
            // Update the message with the constructed image URL
            setState(() {
              int index = messages.indexWhere((msg) => msg["id"] == tempId);
              if (index != -1) {
                messages[index]["path"] = imageUrl;
                messages[index]["uploading"] = false;
              }
            });
            
            // Send only the image filename via WebSocket
            sendMessage("", image: imageFilename);
            
            // Add to tracking set to prevent duplicates - use the same key format that will be used when receiving
            String messageKey = "_${imageFilename}_${_getCurrentTime()}_";
            _sentMessageSet.add(messageKey);
          } else {
            print('Image upload failed: ${response.statusText}');
            
            // Update the message to show error
            setState(() {
              int index = messages.indexWhere((msg) => msg["id"] == tempId);
              if (index != -1) {
                messages[index]["msg"] = "Failed to upload image";
                messages[index]["uploading"] = false;
              }
            });
          }
        } catch (e) {
          print('Error uploading image: $e');
          
          // Update the message to show error
          setState(() {
            int index = messages.indexWhere((msg) => msg["id"] == tempId);
            if (index != -1) {
              messages[index]["msg"] = "Failed to upload image";
              messages[index]["uploading"] = false;
            }
          });
        }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}