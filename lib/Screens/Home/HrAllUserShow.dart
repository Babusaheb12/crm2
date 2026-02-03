import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import 'RoleDashboard/manager/hrDashboard.dart';

class hrUserLists extends StatefulWidget {
  hrUserLists({super.key});

  @override
  State<hrUserLists> createState() => _hrUserListsState();
}

class _hrUserListsState extends State<hrUserLists> {
  // Controllers for search or date filters if needed later
  TextEditingController searchController = TextEditingController();

  // AuthController instance
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    // Load users when the screen initializes
    _loadUsers();
  }

  void _loadUsers() {
    print('Loading HR users from API...');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.GetAllHrUser(
        fname: '',
        mobile: '',
        email: '',
        keyword: '',
        limit: '100',
        offset: '0',
        status: '', // Empty status to get all users
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        elevation: 0,
        title: Text(
          "All User",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: InkWell(
          onTap: () => Get.offAll(() => HomePageHr()),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          _buildHeaderSection(),
          SizedBox(height: 10),
          GetBuilder<AuthController>(
            builder: (authController) {
              bool isLoading = authController.isLoading4;
              bool hasData =
                  authController.allHrUserResponse?.data != null &&
                  authController.allHrUserResponse!.data!.isNotEmpty;

              return Expanded(
                child:
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : hasData
                        ? _buildUserList()
                        : _buildNoRecordFound(),
              );
            },
          ),
        ],
      ),
    );
  }

  // Header showing total count and filter icon
  Widget _buildHeaderSection() {
    return GetBuilder<AuthController>(
      builder: (authController) {
        int recordCount = authController.allHrUserResponse?.data?.length ?? 0;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Records: " + recordCount.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigation to Filter Logic would go here
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.ButtonColor2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.filter_list_alt, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // The actual ListView
  Widget _buildUserList() {
    return GetBuilder<AuthController>(
      builder: (authController) {
        var userData = authController.allHrUserResponse?.data ?? [];
        return ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            final user = userData[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.05),
                ),
                // child: ListTile(
                //   contentPadding:  EdgeInsets.all(15),
                //   title: Text(
                //     // user.fname ?? "",
                //     "Name : ${user.fname ?? ""}",
                //     style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                //   ),
                //   subtitle: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //           // user.email ?? ""
                //         "Email : ${user.email ?? ""}",
                //       ),
                //       Text(
                //           // user.mobile ?? ""
                //         "Mobile : ${user.mobile ?? ""}",
                //       ),
                //        SizedBox(height: 4),
                //       _buildStatusBadge(user.status ?? "0"),
                //       Text("Password: " + (user.password ?? "")),
                //       // Text("Created on: \${user.created ?? ""}"),
                //     ],
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                //   onTap: () {
                //     // Navigate to detail or activity view
                //   },
                // ),

                // _buildUserList के अंदर ListTile को ऐसे बदलें:
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  title: Text(
                    "Name : ${user.fname ?? ""}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email : ${user.email ?? ""}"),
                      Text("Mobile : ${user.mobile ?? ""}"),
                      SizedBox(height: 4),
                      _buildStatusBadge(user.status ?? "0"),
                      Text("Password: ${user.password ?? ""}"),
                    ],
                  ),
                  // यहाँ बदलाव करें: Chevron Icon की जगह Menu Button लगाएं
                  trailing: PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Color(0xFF223e6d)),
                    onSelected: (value) {
                      if (value == 'edit') {
                        _showUpdateStatusDialog(user); // स्टेटस अपडेट फंक्शन
                      } else if (value == 'delete') {
                        _showDeleteDialog(user); // डिलीट फंक्शन
                      }
                    },
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.blue, size: 20),
                                SizedBox(width: 8),
                                Text("Update Status"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red, size: 20),
                                SizedBox(width: 8),
                                Text("Delete User"),
                              ],
                            ),
                          ),
                        ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Helper for Status (Active/Deactive)
  Widget _buildStatusBadge(String status) {
    bool isActive = status == "1";

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Status : ",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: isActive ? "Active" : "Unactive",
            style: TextStyle(
              color: isActive ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildStatusBadge(String status) {
  //   bool isActive = status == "1";
  //   return Text(
  //     // isActive ? "Active" : "Deactive",
  //     "Status : ${isActive ? "Active" : "Unactive"}",
  //     style: TextStyle(
  //       color: isActive ? Colors.green : Colors.red,
  //       fontWeight: FontWeight.bold,
  //       fontSize: 12,
  //     ),
  //   );
  // }

  // 1. Status Update Dialog
  void _showUpdateStatusDialog(var user) {
    String currentStatus = user.status ?? "0";
    String newStatus = currentStatus == "1" ? "0" : "1";
    String actionText = currentStatus == "1" ? "Deactivate" : "Activate";

    Get.defaultDialog(
      title: "Update Status",
      content: Text("Do you want to $actionText ${user.fname}?"),
      textConfirm: "Confirm",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      buttonColor: AppColor.ButtonColor2,
      onConfirm: () async {
        Get.back();
        // authController.updateStatus(user.id);
        bool success = await authController.UpdateHrUserStatus(
          user_id: user.id.toString(),
          status: newStatus,
        );
        if (success) {
          Get.snackbar(
            "Success",
            "Status updated successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      },
    );
  }

  // 2. Delete Confirmation Dialog
  void _showDeleteDialog(var user) {
    Get.defaultDialog(
      title: "Delete User",
      middleText: "Are you sure you want to delete ${user.fname}?",
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.red),
      textConfirm: "Delete",
      textCancel: "No",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        Get.back();
        // authController.deleteUser(user.id);
        bool success = await authController.DeleteHrUser(
          user_id: user.id.toString(),
        );
        if (success) {
          Get.snackbar(
            "Deleted",
            "User has been removed",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
    );
  }

  // UI for empty state
  Widget _buildNoRecordFound() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff686666)),
        ),
        child: Text(
          "No Record Found......",
          style: TextStyle(fontSize: 16, color: Color(0xff686666)),
        ),
      ),
    );
  }
}
