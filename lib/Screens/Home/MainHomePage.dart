import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/DashboardController.dart';
import '../../util/appColor.dart';
import '../../util/appImage.dart';
import 'AddClient.dart';
import 'AllClient.dart';
import 'ColdClient.dart';
import 'DeadClient.dart';
import 'FollowUp.dart';
import 'HomePage.dart';
import 'ImportmentClient.dart';
import 'WarmClient.dart';



class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  DashController dashController = Get.find<DashController>();
  List<Widget>_widgetOptions=[];
  void _onItemTapped(int index) {
    // Update the selected index when a bottom navigation bar item is tapped
    dashController.updateIndex(index);
    setState(() {

    });
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomePage(),
      AddClient(),
      ImportmentClient(),
      FollowUp(),
      DeadClient(),
      ColdClient(),
      AllClient(),
      WarmClient(),

    ];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {


      setState(() {

      });
    });
  }
  Widget build(BuildContext context) {
    return GetBuilder<DashController>(builder: (dashController) {
      return   Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        drawer: Container(
          width: 250,
          child: Drawer(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
            ),
            backgroundColor: AppColor.Background,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Image.asset(AppImage.splashLogo1,height: 100,),
                    SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: (){

                              setState(() {
                                dashController.updateIndex(2);
                                Get.back();

                              });

                            },
                            child: Text("Add Client",style: TextStyle(color:Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),

                        InkWell(
                            onTap: (){
                              setState(() {
                                dashController.updateIndex(3);
                                Get.back();

                              });

                            },
                            child: Text("Followup Client",style: TextStyle(color: Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),

                        InkWell(
                            onTap: (){
                              setState(() {
                                dashController.updateIndex(5);
                                Get.back();

                              });

                            },
                            child: Text("All Client List",style: TextStyle(color: Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),

                        InkWell(
                            onTap: (){
                              setState(() {
                                dashController.updateIndex(6);
                                Get.back();

                              });

                            },
                            child: Text("Warm Client List",style: TextStyle(color:Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),

                        InkWell(
                            onTap: (){
                              setState(() {
                                dashController.updateIndex(5);
                                Get.back();

                              });

                            },
                            child: Text("Cold Client List",style: TextStyle(color:Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),

                        InkWell(
                            onTap: (){
                              setState(() {
                                dashController.updateIndex(4);
                                Get.back();

                              });

                            },
                            child: Text("Dead Client List",style: TextStyle(color:Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),

                        InkWell(
                            onTap: (){
                              setState(() {
                                dashController.updateIndex(2);
                                Get.back();

                              });

                            },
                            child: Text("Important Client List",style: TextStyle(color:Color(0xff233f6e),fontSize: 18,fontWeight: FontWeight.w500),)),
                        SizedBox(height: 15,),

                      ],
                    ),

                    SizedBox(height: 25,),
                    Center(
                      child: Container(
                          width: 169,
                          height: 39,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(AppColor.ButtonColor2),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )
                                )
                            ),
                            onPressed: () {
                              setState(() {
                                //dashController.updateIndex(14);
                              });
                              Get.back();

                            },
                            child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),
                          )
                      ),
                    ),






                  ],
                ),
              ),
            ),
          ),
        ),
        body: _widgetOptions.elementAt(dashController.currentIndex),

      );});
  }
}
