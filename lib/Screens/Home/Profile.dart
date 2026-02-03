
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import '../../util/route_helper.dart';

class Pofileuser extends StatefulWidget {
  const Pofileuser({super.key});

  @override
  State<Pofileuser> createState() => _PofileuserState();
}

class _PofileuserState extends State<Pofileuser> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  AuthController authController = Get.find<AuthController>();
  void clearClientType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('client_type');
    print("🗑️ Cleared client_type from storage");
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("My Profile",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
          ),
          leading:InkWell(
              onTap: (){
                // Get.back();
                Navigator.pop(context); // 👈 pop this screen

              },
              child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 22,)),
          actions: [


            SizedBox(width: 10,),


          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.Background
          ),

          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(" Type",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : location,
                              cursorColor:AppColor.AuthhintColor,

                              //maxLength: 10,
                              readOnly: true,
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),

                              decoration: InputDecoration(
                                  counterText:'',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:  BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColor.White,

                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColor.White,
                                      )
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                  hintText:  location.text= authController.profileResponse!.data!=null ?authController.profileResponse!.data!.type!.toString():"",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(" Name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : name,
                              cursorColor:AppColor.AuthhintColor,
                              readOnly: true,

                              //maxLength: 10,
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),

                              decoration: InputDecoration(
                                  counterText:'',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:  BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColor.White,

                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColor.White,
                                      )
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                  hintText:  name.text= authController.profileResponse!.data!=null ?authController.profileResponse!.data!.fname!.toString():"Name",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(" Mobile Number",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : mob,
                              cursorColor:AppColor.AuthhintColor,
                              readOnly: true,

                              //maxLength: 10,
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),

                              decoration: InputDecoration(
                                  counterText:'',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:  BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColor.White,

                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColor.White,
                                      )
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                  hintText:  mob.text= authController.profileResponse!.data!=null ?authController.profileResponse!.data!.mobile!.toString():"Enter Mobile Number",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(" Email",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : email,
                              cursorColor:AppColor.AuthhintColor,
                              readOnly: true,

                              //maxLength: 10,
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),

                              decoration: InputDecoration(
                                  counterText:'',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:  BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColor.White,

                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColor.White,
                                      )
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

                                  hintText:  email.text= authController.profileResponse!.data!=null ?authController.profileResponse!.data!.email!.toString():"Enter E-mail",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
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
                                      Get.offAllNamed(RouteHelper.getLoginRoute());
                                      clearClientType();


                                    });
                                    Get.back();

                                  },
                                  child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500)),
                                )
                            ),
                          ),

                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        )


    );
  }
}