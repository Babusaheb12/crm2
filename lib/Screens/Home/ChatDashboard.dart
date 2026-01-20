import 'package:flutter/material.dart';
import 'Chat.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Controller/AgentController/Authcontroller.dart';
import '../../Response/AgentResponse/ChatUsersResponse.dart';
import '../../services/socket_service.dart';
import '../../api/api.dart';

// Import the response class

class ChatDashboard extends StatefulWidget {
  const ChatDashboard({super.key});

  @override
  State<ChatDashboard> createState() => _ChatDashboardState();
}

class _ChatDashboardState extends State<ChatDashboard> {
  List<Map<String, dynamic>> chats = [];
  List<Map<String, dynamic>> filteredChats = [];
  bool _isSearching = false;
  bool _isLoading = true; // Add loading state
  Map<String, dynamic> roomIds = {}; // Store room IDs mapping
  final TextEditingController _searchController = TextEditingController();
  final AuthController _authController = Get.find(); // Get the AuthController instance

  @override
  void initState() {
    super.initState();
    _loadChatUsers();
  }

  void _loadChatUsers() async {
    _isLoading = true;
    setState(() {}); // Show loading indicator
    
    print('ChatDashboard: Starting to load chat users');
    try {
      // Get user ID from local storage
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('user_id');
      
      if (userId == null) {
        print('ChatDashboard: User ID not found in local storage');
        chats = []; // Initialize as empty list if no user ID found
      } else {
        print('ChatDashboard: Using user ID: \$userId');
        var response = await _authController.getAllChatUsers(userId);
        print('ChatDashboard: Received response with status \${response.statusCode}');
        
        if (response.statusCode == 200 && response.body['result'] == 'success') {
          // Store room IDs mapping from the response
          if (response.body['room_ids'] != null) {
            roomIds = Map<String, dynamic>.from(response.body['room_ids']);
            
            print('ChatDashboard: Raw response body: \${response.body}');
            print('ChatDashboard: Stored room IDs mapping: \${roomIds.length} entries');
            print('ChatDashboard: Sample room IDs - key 40: \${roomIds["40"]}, key 39: \${roomIds["39"]}');
          } else {
            print('ChatDashboard: No room_ids found in response');
          }
          
          ChatUsersResponse chatUsersResponse = ChatUsersResponse.fromJson(response.body);
          print('ChatDashboard: Successfully parsed \${chatUsersResponse.data?.length ?? 0} users from API');
          
          // Convert API response to the format expected by the UI
          chats = chatUsersResponse.data!.map((user) {
            print('ChatDashboard: Processing user - Name: \${user.name}, Role: \${user.role}, Image: \${user.profileImage}, Unread Count: \${user.unreadCount}');
            return {
              "id": user.id ?? 0,
              "name": user.name ?? "",
              "role": user.role ?? "",
              "message": "",
              "time": "",
              "image": user.profileImage ?? "https://png.pngtree.com/png-vector/20190223/ourmid/pngtree-profile-glyph-black-icon-png-image_691589.jpg", // Default image if not provided
              "unread": user.unreadCount ?? 0,
              "missedCall": false,
            };
          }).toList();
        } else {
          print('ChatDashboard: API call failed or returned non-success result');
          chats = []; // Initialize as empty list if API call fails
        }
      }
    } catch (e) {
      print('ChatDashboard: Error loading chat users: \$e');
      chats = []; // Initialize as empty list if there's an exception
    }
    print('ChatDashboard: Loaded \${chats.length} chat items');
    filteredChats = List.from(chats);
    _isLoading = false;
    setState(() {}); // Update UI after loading data
    print('ChatDashboard: UI updated with chat data');
  }

  void _filterChats(String query) {
    if (query.isEmpty) {
      filteredChats = List.from(chats);
    } else {
      filteredChats = chats
          .where((chat) =>
              chat["name"].toLowerCase().contains(query.toLowerCase()) ||
              (chat["role"] != null && chat["role"].toLowerCase().contains(query.toLowerCase())) ||
              (chat["message"] != null && chat["message"].toLowerCase().contains(query.toLowerCase())))
          .toList();
    }
    setState(() {});
  }

  Future<void> _callMarkReadAPI(int? fromUser, int? toUser, int chatIndex) async {
    try {
      // Get the API client instance from the repo
      final response = await _authController.Repo.apiClient.postDataOther(
        "${ApiUrls.markRead}",
        {
          "from_user": fromUser,
          "to_user": toUser,
        },
      );
        
      print('markRead API response: \${response.statusCode}, \${response.body}');
        
      if (response.statusCode == 200) {
        print('markRead API call successful');
        // Update the UI to reflect that messages are now read
        if (chatIndex >= 0 && chatIndex < chats.length) {
          setState(() {
            chats[chatIndex]["unread"] = 0; // Set unread count to 0
            filteredChats[chatIndex]["unread"] = 0; // Update filtered list as well
          });
        }
      } else {
        print('markRead API call failed with status: \${response.statusCode}');
      }
    } catch (e) {
      print('Error calling markRead API: \$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 22,),
          onPressed: () {
            Navigator.pop(context); // or Get.back()
          },
        ),
        title: _isSearching
          ? TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search chats...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                _filterChats(value);
              },
            )
          : Text("Dashboard",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _isSearching = false;
                  _searchController.clear();
                  filteredChats = List.from(chats);
                } else {
                  _isSearching = true;
                }
              });
            },
          ),
          // SizedBox(width: 12),
          // Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 8),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : ListView.separated(
        itemCount: filteredChats.length,
        separatorBuilder: (_, __) => Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = filteredChats[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(chat["image"]),
            ),
            title: Text(
              chat["name"],
              style:  TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: chat["missedCall"]
                ? Row(
              children: [
                Text(
                  "Missed video call",
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(width: 6),
                Icon(Icons.videocam, size: 16, color: Colors.red),
              ],
            )
                : chat["role"] != ""
                ? Text(
              chat["role"],
              style: const TextStyle(color: Colors.grey),
            )
                : Text(
              chat["message"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat["time"],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                if (chat["unread"] > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat["unread"].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () async {
              // Get the current user's ID from shared preferences
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              int? currentUserId = prefs.getInt('user_id');
                          
              // 🔽 DEBUG PRINTS - Print the entire roomIds map
              print("========== ROOM IDS MAP ==========");
              print("Full roomIds map: $roomIds");
              print("================================");
                          
              // Both current user and chat user should use the same room ID string for their chat
              // The room ID is determined by the combination of both user IDs
              // Look for a common room ID that involves both users
              String? commonRoomId = null;
                            
              if (currentUserId != null) {
                // Find the room ID that includes both current user and the chat user
                String currentUserKey = currentUserId.toString();
                String chatUserKey = chat["id"].toString();
                              
                // Check if there's a room ID associated with the current user that also involves the chat user
                String? currentUserRoomIdString = roomIds[currentUserKey];
                String? chatUserRoomIdString = roomIds[chatUserKey];
                              
                // If both users share the same room ID string, use it
                if (currentUserRoomIdString != null && chatUserRoomIdString != null) {
                  // The room ID string should be the same for both users in the same chat
                  // e.g., both user 40 and user 38 would have "chat_38_40" as their room ID for their conversation
                  if (currentUserRoomIdString == chatUserRoomIdString) {
                    commonRoomId = currentUserRoomIdString;
                  } else {
                    // If they don't match, we need to determine the correct room ID
                    // Check if the room ID contains both user IDs
                    List<String> currentUserParts = currentUserRoomIdString.split('_');
                    List<String> chatUserParts = chatUserRoomIdString.split('_');
                                  
                    bool currentUserRoomContainsBoth = currentUserParts.length >= 3 &&
                        (currentUserParts[1] == chatUserKey || currentUserParts[2] == chatUserKey);
                    bool chatUserRoomContainsBoth = chatUserParts.length >= 3 &&
                        (chatUserParts[1] == currentUserKey || chatUserParts[2] == currentUserKey);
                                  
                    if (currentUserRoomContainsBoth) {
                      commonRoomId = currentUserRoomIdString;
                    } else if (chatUserRoomContainsBoth) {
                      commonRoomId = chatUserRoomIdString;
                    }
                  }
                } else if (currentUserRoomIdString != null) {
                  // Fallback: check if current user's room ID contains the chat user
                  List<String> parts = currentUserRoomIdString.split('_');
                  if (parts.length >= 3 &&
                      (parts[1] == chatUserKey || parts[2] == chatUserKey)) {
                    commonRoomId = currentUserRoomIdString;
                  }
                } else if (chatUserRoomIdString != null) {
                  // Fallback: check if chat user's room ID contains the current user
                  List<String> parts = chatUserRoomIdString.split('_');
                  if (parts.length >= 3 &&
                      (parts[1] == currentUserKey || parts[2] == currentUserKey)) {
                    commonRoomId = chatUserRoomIdString;
                  }
                }
              }
                            
              // Now convert the room ID string to an integer
              int? currentUserRoomId = null;
              int? chatUserRoomId = null;
                            
              if (commonRoomId != null) {
                // Since the Chat widget expects int?, we need to convert the string room ID to an integer
                // Method 1: Try to extract a numeric value from the room ID string
                String numericPart = commonRoomId.replaceAll(RegExp(r'[^0-9_]'), '');
                List<String> numericValues = numericPart.split('_').where((part) => part.isNotEmpty).toList();
                
                // If we have multiple numeric values, we can combine them or use the largest one
                if (numericValues.isNotEmpty) {
                  // For room ID like "chat_38_40", we get "38_40", so we can use a combination
                  // Create a unique number from both user IDs
                  List<int> numbers = [];
                  for (String numStr in numericValues) {
                    int? num = int.tryParse(numStr);
                    if (num != null) {
                      numbers.add(num);
                    }
                  }
                  
                  if (numbers.length >= 2) {
                    // Create a unique ID based on both user IDs
                    // Sort the numbers to ensure consistent room ID regardless of order
                    numbers.sort();
                    currentUserRoomId = int.parse('${numbers[0]}${numbers[1]}'); // Combine both IDs
                  } else if (numbers.length == 1) {
                    currentUserRoomId = numbers[0];
                  }
                }
                
                // Fallback: Use hash code if numeric extraction fails
                if (currentUserRoomId == null) {
                  currentUserRoomId = commonRoomId.hashCode.abs();
                }
                
                chatUserRoomId = currentUserRoomId; // Both users should use the same room ID
              }
                          
              // 🔽 DEBUG PRINTS
              print("========== CHAT DEBUG ==========");
              print("Current User ID       : $currentUserId");
              print("Current User Room ID  : $currentUserRoomId");
              print("Chat User ID          : ${chat["id"]}");
              print("Chat User Room ID     : $chatUserRoomId");
              print("Common Room ID        : ${commonRoomId}");
              print("================================");
                            
              // Emit chat_open socket event
              if (currentUserId != null && chat["id"] != null) {
                // Create a temporary socket instance to emit the event
                SocketService tempSocket = SocketService();
                tempSocket.initialize(
                  currentUserId: currentUserId!,
                  otherUserId: chat["id"],
                  currentUserRoomId: currentUserRoomId,
                  chatUserRoomId: chatUserRoomId,
                );
                
                tempSocket.connect();
                
                // Listen for connection event before emitting chat_open
                tempSocket.socket?.on('connect', (_) async {
                  print('Temporary socket connected: ${tempSocket.socket?.id}');
                  tempSocket.socket?.emit("chat_open", {
                    "from_user": currentUserId,
                    "to_user": chat["id"]
                  });
                  print("Emitted chat_open event: from_user: $currentUserId, to_user: ${chat["id"]}");
                  
                  // Call the API after emitting the socket event
                  await _callMarkReadAPI(currentUserId, chat["id"], index);
                  
                  // Disconnect the temporary socket after a short delay
                  Future.delayed(Duration(seconds: 1), () {
                    tempSocket.disconnect();
                  });
                });
                
                // Also listen for connection errors
                tempSocket.socket?.on('connect_error', (error) {
                  print('Temporary socket connect error: $error');
                });
              }
                            
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chat(
                  chatName: chat["name"],
                  chatRole: chat["role"],
                  chatImage: chat["image"],
                  otherUserId: chat["id"],
                  currentUserRoomId: currentUserRoomId,
                  chatUserRoomId: chatUserRoomId,
                )),
              );
            },
          );
        },
      ),
    );
  }
}
