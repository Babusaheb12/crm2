import 'package:call_log/call_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Controller/AgentController/Authcontroller.dart';
import '../../../../Controller/DashboardController.dart';
import '../../../../util/appColor.dart';
import '../../../../util/appImage.dart';
import '../../../../util/route_helper.dart';
import '../../AddClient.dart';
import '../../AddCondidate.dart';
import '../../Addusers.dart';
import '../../AllClient.dart';
import '../../ChatDashboard.dart';
import '../../ColdClient.dart';
import '../../DeadClient.dart';
import '../../FollowUp.dart';
import '../../HrAllUserShow.dart';
import '../../ImportmentClient.dart';
import '../../Profile.dart';
import '../../UserList.dart';
import '../../WarmClient.dart';
import '../../condidateList.dart';
import '../../notificationScreen.dart';


class HomePageHrUser extends StatefulWidget {
  const HomePageHrUser({super.key});

  @override
  State<HomePageHrUser> createState() => _HomePageHrUserState();
}

class _HomePageHrUserState extends State<HomePageHrUser> with WidgetsBindingObserver {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController referenceno = TextEditingController();

  DashController dashController = Get.find<DashController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AuthController authController = Get.find<AuthController>();

  void initState() {
    super.initState();
    sendCallLogsToAPI();
    _maybeSaveClientType();
    _loadClientId();
    _handleClientId();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<AuthController>().getProfile();
      Get.find<AuthController>().getNotificationCount(); // Load notification count

      // Refresh dashboard data when page loads
      if (clientType != null && clientType != '') {
        Get.find<AuthController>().GetDashboard(clientType.toString());
      }

      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh dashboard data when dependencies change
    if (clientType != null && clientType != '') {
      Get.find<AuthController>().GetDashboard(clientType.toString());
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // When the app comes back to focus/resume, refresh notification count
    if (state == AppLifecycleState.resumed) {
      _refreshNotificationCount();
    }
  }

  // Method to refresh notification count silently
  Future<void> _refreshNotificationCount() async {
    try {
      await Get.find<AuthController>().getNotificationCount();
    } catch (e) {
      print('Error refreshing notification count: \$e');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<Iterable<CallLogEntry>> fetchAllCallLogs() async {
    final Iterable<CallLogEntry> entries = await CallLog.query();
    return entries;
  }

  List<Map<String, dynamic>> convertCallLogsForApi(
      Iterable<CallLogEntry> entries,
      ) {
    return entries.map((entry) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(
        entry.timestamp ?? 0,
      );
      final callType = _getCallType(entry.callType);

      return {
        "calling_count": "1",
        "calling_date": DateFormat("yyyy-MM-dd").format(dateTime),
        "calling_time": DateFormat("HH:mm").format(dateTime),
        "client_mobile": entry.number ?? '',
        "calling_platform": "call",
        "calling_type": callType,
        "call_duration_in_second": "${entry.duration ?? 0}",
      };
    }).toList();
  }

  String _getCallType(CallType? type) {
    switch (type) {
      case CallType.incoming:
        return "Incoming";
      case CallType.outgoing:
        return "Outgoing";
      case CallType.missed:
        return "Missed";
      case CallType.rejected:
        return "Rejected";
      default:
        return "Unknown";
    }
  }

  Future<void> sendCallLogsToAPI() async {
    final Iterable<CallLogEntry> logs = await fetchAllCallLogs();
    final data = convertCallLogsForApi(logs);

    await Get.find<AuthController>().getCallMultiPle(multiplecallData: data);
  }

  String? clientType;
  bool isClientIdShown = false;
  int get notificationCount {
    if (authController.notificationCounterResponse?.totalCount != null) {
      return authController.notificationCounterResponse!.totalCount!.toInt();
    }
    return 0;
  }

  @override
  /// Save only if not already saved
  void _maybeSaveClientType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? existingType = prefs.getString('client_type');
    String? currentType = authController.loginResponse?.data?.type?.toString();

    if ((existingType == null || existingType == 'null') &&
        currentType != null) {
      await prefs.setString('client_type', currentType);
      print("✅ First-time save: client_type = $currentType");
    } else {
      print("ℹ️ client_type already exists: $existingType");
    }
  }

  /// Show the ID once after loading
  void _loadClientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadedId = prefs.getString('client_type');

    if (!isClientIdShown && loadedId != null) {
      setState(() {
        clientType = loadedId;
        isClientIdShown = true;
      });
      Get.find<AuthController>().GetDashboard(clientType.toString());

      print("📦 Showing client_type one time only: $clientType");

      // Optional: Show dialog/snackbar only once
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Client Type: $clientType")),
      // );
    }
  }

  /// Always get current value for use
  void _handleClientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      clientType = prefs.getString('client_type') ?? '0';
      print("📦 Using client_type: $clientType");
    });
  }

  void clearClientType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('client_type');
    print("🗑️ Cleared client_type from storage");
  }

  /*List<Map<String, dynamic>> convertCallLogsForApi(Iterable<CallLogEntry> entries) {
    return entries.map((entry) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0);
      final callType = _getCallType(entry.callType);

      return {
        "client_id": authController.profileResponse!.data!.id.toString(), // use dynamic if needed
        "calling_count": "1",
        "calling_date": DateFormat("yyyy-MM-dd").format(dateTime),
        "calling_time": DateFormat("HH:mm").format(dateTime),
        "client_mobile": entry.number ?? '',
        "client_name": authController.profileResponse!.data!.fname.toString(),
      */
  /*entry.name?.isNotEmpty == true ? entry.name : "Unknown",*/
  /*
        "calling_platform": "call",
        "calling_type": callType,
        "call_duration_in_second": "${entry.duration ?? 0}",
      };
    }).toList();
  }
  String _getCallType(CallType? type) {
    switch (type) {
      case CallType.incoming:
        return "Incoming";
      case CallType.outgoing:
        return "Outgoing";
      case CallType.missed:
        return "Missed";
      case CallType.rejected:
        return "Rejected";
      default:
        return "Unknown";
    }
  }
  Future<void> _sendCallLogToAPI() async {
    final Iterable<CallLogEntry> logs = await CallLog.query();
    final filtered = logs.where((e) => e.number == "+918854842806");
    final data = convertCallLogsForApi(filtered);

    await Get.find<AuthController>().getCallMultiPle(multiplecallData: data);
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,

      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(Icons.menu, color: Colors.white, size: 30),
        ),
        actions: [
          Text(
            clientType.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              Get.to(Pofileuser());
            },
            child: CircleAvatar(
              maxRadius: 18,
              backgroundColor: AppColor.White,
              child: Icon(Icons.person, color: AppColor.ButtonColor2, size: 22),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: AppColor.Drawercolor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Image.asset(
                    AppImage.splashLogo1,
                    height: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      clientType.toString() == "manager"
                          ? Row(
                        children: [
                          Icon(
                            CupertinoIcons.person,
                            color: Colors.brown,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              // Show a loading indicator if the API takes time
                              // Get.dialog(Center(child: CircularProgressIndicator()));

                              await authController.GetAllUser(
                                name: '',
                                mobile: '',
                                email: '',
                                status: '',
                                limit: '10000',
                                offset: '0',
                              );

                              // Corrected: Added () to create an instance of the class
                              Get.to(
                                hrUserLists(),
                                // hrUserLists(),
                                transition: Transition.fadeIn,
                                duration: const Duration(milliseconds: 100),
                              );
                            },
                            child: Text(
                              "User List",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      )
                          : SizedBox.shrink(),
                      clientType.toString() == "manager"
                          ? Divider(color: Colors.white, thickness: 1)
                          : SizedBox.shrink(),
                      clientType.toString() == "manager"
                          ? SizedBox(height: 5)
                          : SizedBox.shrink(),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.person,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              await authController.GetAllClient(
                                name: '',
                                fname: '',
                                mobile: '',
                                email: '',
                                from_date: '',
                                to_date: '',
                                last_date: '',
                                search: '',
                                status: '4',
                                location: '',
                                source: '',
                                limit: '10000',
                                // fetch all for pagination
                                offset: '0',
                                agent_id: '',
                              );
                              Get.to(
                                condidateList(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 100),
                              );

                              setState(() {});
                            },

                            child: Text(
                              "Candidate List",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Montserrat",
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.white, thickness: 1),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.person,
                            color: Colors.purple,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              await authController.GetFlowupClient(
                                name: '',
                                mobile: '',
                                email: '',
                                from_date: '',
                                to_date: '',
                                last_date: '',
                                search: '',
                                status: '',
                                location: '',
                                source: '',
                                limit: '10000',
                                // fetch all for pagination
                                offset: '0',
                                agent_id: '',
                              );
                              Get.to(
                                // FollowUp(),
                                AddCandidate(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 100),
                              );

                              setState(() {});
                            },
                            child: Text(
                              "Add Candidate",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.white, thickness: 1),
                      SizedBox(height: 5),

                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.chat_bubble_text,
                            color: Colors.blue,
                            size: 20,
                          ),
                          const SizedBox(width: 10),

                          InkWell(
                            onTap: () async {
                              // Optional: loader show karo
                              // Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);

                              await authController.GetAllClient(
                                name: '',
                                fname: '',
                                mobile: '',
                                email: '',
                                from_date: '',
                                to_date: '',
                                last_date: '',
                                search: '',
                                status: '2',
                                location: '',
                                source: '',
                                limit: '10000',
                                offset: '0',
                                agent_id: '',
                              );

                              // Optional: loader close
                              // Get.back();

                              Get.to(
                                const ChatDashboard(),
                                transition: Transition.fadeIn,
                                duration: const Duration(milliseconds: 200),
                              );
                            },
                            child: const Text(
                              "Chat",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.white, thickness: 1),
                      SizedBox(height: 5),

                      /*InkWell(
                            onTap: (){
                              setState(() {
                                Get.to(Leave());
                               // Get.back();

                              });

                            },
                            child: Text("Leave Employee ",style: TextStyle(color:Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),*/
                    ],
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Container(
                      width: 169,
                      height: 39,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColor.White,
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Get.offAllNamed(RouteHelper.getLoginRoute());
                            clearClientType();
                          });
                          Get.back();
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: AppColor.ButtonColor2,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: GetBuilder<AuthController>(
        builder: (authController) {
          // Recalculate notification count when authController changes
          int currentNotificationCount = 0;
          if (authController.notificationCounterResponse?.totalCount != null) {
            currentNotificationCount = authController.notificationCounterResponse!.totalCount!.toInt();
          }

          return Stack(
            clipBehavior: Clip.none,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Get.to(() => NotificationScreen());
                },
                backgroundColor: const Color(0xFF223e6d),
                child: const Icon(Icons.notifications, color: Colors.white),
              ),

              // 🔴 Notification Badge
              if (currentNotificationCount > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 22,
                      minHeight: 22,
                    ),
                    child: Center(
                      child: Text(
                        currentNotificationCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),

      body: GetBuilder<AuthController>(
        builder: (authController) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(color: AppColor.Background),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Display loading indicator while dashboard data is loading
                  if (authController.isLoading2)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          clientType.toString() == "manager" ? InkWell(
                            onTap: () async {
                              await authController.GetAllUser(
                                name: '',
                                mobile: '',
                                email: '',
                                status: '',
                                limit: '10000',
                                // fetch all for pagination
                                offset: '0',
                              );
                              Get.to(
                                hrUserLists(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 100),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.White,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.person,
                                      color: Colors.brown,
                                      size: 35,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Users",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Montserrat",
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "All users",
                                          style: TextStyle(
                                            color: AppColor.AuthhintColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Montserrat",
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      authController.Dashboardresponse?.data != null
                                          ? (authController.Dashboardresponse!.data!.role == "hr"
                                          ? (authController.Dashboardresponse!.data!.totalUsers?.toString() ?? "0")
                                          : (authController.Dashboardresponse!.data!.totalUsers?.toString() ?? "0"))
                                          : "0",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          )
                              : SizedBox.shrink(),
                          clientType.toString() == "manager"
                              ? SizedBox(height: 10)
                              : SizedBox.shrink(),
                          InkWell(
                            onTap: () {
                              // Get.to(PaginationDemo());
                              Get.to(condidateList());

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.White,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.person_2,
                                      color: Colors.blueGrey,
                                      size: 35,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Candidate",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Montserrat",
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Total Candidate",
                                          style: TextStyle(
                                            color: AppColor.AuthhintColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Montserrat",
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      authController.Dashboardresponse?.data != null
                                          ? (authController.Dashboardresponse!.data!.role == "hr"
                                          ? (authController.Dashboardresponse!.data!.totalCandidate?.toString() ?? "0")
                                          : (authController.Dashboardresponse!.data!.totalUsers?.toString() ?? "0"))
                                          : "0",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              // Get.to(PaginationDemo());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.White,
                              ),
                              child: Padding(
                                padding:EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.person_2,
                                      color: Colors.blueGrey,
                                      size: 35,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Current Month Candidate",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Montserrat",
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Monthly All Clients",
                                          style: TextStyle(
                                            color: AppColor.AuthhintColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Montserrat",
                                            fontStyle: FontStyle.italic,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      authController.Dashboardresponse?.data !=
                                          null
                                          ? (authController.Dashboardresponse!.data!.role == "hr"
                                          ? (authController.Dashboardresponse!.data!.currentMonthTotalCandidate?.toString() ?? "0")
                                          : (authController.Dashboardresponse!.data!.totalCurrentMonthClients?.toString() ?? "0"))
                                          : "0",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              await authController.GetAllClient(
                                name: '',
                                fname: '',
                                mobile: '',
                                email: '',
                                from_date: '',
                                to_date: '',
                                last_date: '',
                                search: '',
                                status: '1',
                                location: '',
                                source: '',
                                limit: '10000',
                                // fetch all for pagination
                                offset: '0',
                                agent_id: '',
                              );
                              Get.to(
                                WarmClient(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 100),
                              );

                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.White,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.person,
                                      color: Colors.cyanAccent,
                                      size: 35,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Shortlisted Candidate",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "All Shortlisted Candidate",
                                          style: TextStyle(
                                            color: AppColor.AuthhintColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Montserrat",
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      authController.Dashboardresponse?.data !=
                                          null
                                          ? (authController.Dashboardresponse!.data!.role == "hr"
                                          ? (authController.Dashboardresponse!.data!.shortlistedCandidate?.toString() ?? "0")
                                          : (authController.Dashboardresponse!.data!.totalWarmClients?.toString() ?? "0"))
                                          : "0",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              await authController.GetAllClient(
                                name: '',
                                fname: '',
                                mobile: '',
                                email: '',
                                from_date: '',
                                to_date: '',
                                last_date: '',
                                search: '',
                                status: '1',
                                location: '',
                                source: '',
                                limit: '10000',
                                // fetch all for pagination
                                offset: '0',
                                agent_id: '',
                              );
                              Get.to(
                                WarmClient(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 100),
                              );

                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.White,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.person,
                                      color: Colors.cyanAccent,
                                      size: 35,
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Interviewed Candidate",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "All Interviewed Candidate",
                                          style: TextStyle(
                                            color: AppColor.AuthhintColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Montserrat",
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      authController.Dashboardresponse?.data !=null
                                          ? (authController.Dashboardresponse!.data!.role == "hr"
                                          ? (authController.Dashboardresponse!.data!.interviewedCandidate?.toString() ?? "0")
                                          : (authController.Dashboardresponse!.data!.totalWarmClients?.toString() ?? "0"))
                                          : "0",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // HR Specific Dashboard Cards
                          authController.Dashboardresponse?.data?.role == "hr"
                              ? Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.White,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.checkmark_seal,
                                        color: Colors.green,
                                        size: 35,
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Selected Candidates",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                          Text(
                                            "Candidates who got selected",
                                            style: TextStyle(
                                              color: AppColor.AuthhintColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Montserrat",
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        authController.Dashboardresponse?.data !=
                                            null
                                            ? (authController.Dashboardresponse!.data!.selectedCandidate?.toString() ?? "0")
                                            : "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.White,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.xmark_circle,
                                        color: Colors.red,
                                        size: 35,
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Rejected Candidates",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                          Text(
                                            "Candidates who got rejected",
                                            style: TextStyle(
                                              color: AppColor.AuthhintColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Montserrat",
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        authController.Dashboardresponse?.data !=
                                            null
                                            ? (authController.Dashboardresponse!.data!.rejectedCandidate?.toString() ?? "0")
                                            : "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                              : SizedBox.shrink(),

                        ],
                      ),
                    ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}