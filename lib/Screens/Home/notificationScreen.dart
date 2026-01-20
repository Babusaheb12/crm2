import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/appColor.dart';
import '../../Response/AgentResponse/NotificationResponse.dart';
import '../../Controller/AgentController/Authcontroller.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  AuthController authController = Get.find<AuthController>();
  List<NotificationData> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNotifications();
    _markAllNotificationsAsRead();
  }

  // API call to fetch notifications
  Future<void> fetchNotifications() async {
    setState(() {
      isLoading = true;
    });
    
    try {

      
      await authController.getNotifications();
      
      if (authController.notificationResponse?.data != null) {
        notifications = authController.notificationResponse!.data!;
      }
      
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to load notifications");
      setState(() {
        isLoading = false;
      });
    }
  }
  
  // API call to mark all notifications as read
  Future<void> _markAllNotificationsAsRead() async {
    try {
      await authController.markAllNotificationRead();
    } catch (e) {
      print('Error marking notifications as read: $e');
    }
  }

  void deleteNotification(String notificationId) {
    setState(() {
      notifications.removeWhere((n) => n.id == notificationId);
    });
    Get.snackbar("Success", "Notification deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : notifications.isEmpty
              ? _buildEmptyState()
              : RefreshIndicator(
                  onRefresh: fetchNotifications,
                  child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return _buildNotificationItem(notification, index);
                    },
                  ),
                ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20),
          Text(
            "No Notifications",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "You're all caught up!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(NotificationData notification, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        // leading: Container(
        //   width: 45,
        //   height: 45,
        //   decoration: BoxDecoration(
        //     color: Color(0xFF223e6d),
        //     shape: BoxShape.circle,
        //   ),
        //   child: Icon(Icons.notifications, color: Colors.white, size: 22),
        // ),
        title: Text(
          notification.title ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              notification.message ?? '',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _formatTimestamp(notification.notificationDate),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
          ],
        ),
        // trailing: PopupMenuButton<String>(
        //   icon: Icon(Icons.more_vert, color: Colors.grey[600]),
        //   onSelected: (value) {
        //     if (value == 'delete') {
        //       deleteNotification(notification.id ?? '');
        //     }
        //   },
        //   itemBuilder: (BuildContext context) => [
        //     PopupMenuItem(
        //       value: 'delete',
        //       child: Row(
        //         children: [
        //           Icon(Icons.delete, size: 20, color: Colors.red),
        //           SizedBox(width: 10),
        //           Text('Delete', style: TextStyle(color: Colors.red)),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        onTap: () {
          // Navigate to relevant screen based on notification
          _handleNotificationTap(notification);
        },
      ),
    );
  }

  String _formatTimestamp(String? timestampStr) {
    if (timestampStr == null || timestampStr.isEmpty) {
      return 'Just now';
    }
    
    try {
      DateTime timestamp = DateTime.parse(timestampStr.split(' ')[0]);
      final now = DateTime.now();
      final difference = now.difference(timestamp);

      if (difference.inMinutes < 1) {
        return 'Just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} min ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hr ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      } else {
        return DateFormat('MMM dd, yyyy').format(timestamp);
      }
    } catch (e) {
      return 'Just now';
    }
  }

  void _handleNotificationTap(NotificationData notification) {
    // Handle navigation based on notification
    Get.snackbar("Info", "Notification: ${notification.title}");
  }
}
