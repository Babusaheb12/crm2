import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/view/Home.dart';
import 'package:crm/view/customer/ManageCustomer.dart';
import 'package:crm/view/proposal/ManageProposalView.dart';
import 'package:crm/view/task/manageTask.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

import 'calllogs.dart';
import 'invoice/manageInvoice.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin{
  // TabController? _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Lead",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["Lead",  "Task","CallLog","Proposal"],
        icons: const [Icons.home,  Icons.task,Icons.call_split_rounded,Icons.file_present],




        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: primary.withOpacity(0.7),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: primary,
        tabIconSelectedColor: Colors.white,
        tabBarColor: const Color(0xFFAFAFAF),
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: Stack(
        children: [
          headerContainer(),

          TabBarView(
            physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
            controller: _motionTabBarController,
            children: <Widget>[

              HomeView(),

              ManageTaskView(),
              CallLogs(),
              ManageProposalView(),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerContainer()
  {
    return  Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/logo.png",height: 30,),

          Icon(Icons.logout,color: Colors.white,)
        ],
      ),
    );
  }
}


