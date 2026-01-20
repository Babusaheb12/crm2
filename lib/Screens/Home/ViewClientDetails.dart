
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/appColor.dart';

class ViewClientDetails extends StatefulWidget {
  const ViewClientDetails({super.key});

  @override
  State<ViewClientDetails> createState() => _ViewClientDetailsState();
}

class _ViewClientDetailsState extends State<ViewClientDetails> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController mob1 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController Skype = TextEditingController();
  TextEditingController Comment = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("View Client Details",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
          ),
          leading:InkWell(
              onTap: (){
                _scaffoldKey.currentState!.openDrawer();

              },
              child: Icon(Icons.menu,color: Colors.white,size: 30,)),
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
                          Text("Name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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

                                  hintText: "Enter Name",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Mobile Number",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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

                                  hintText: "Enter Mobile Number",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Email",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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

                                  hintText: "E-mail",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Location(City)",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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

                                  hintText: "Enter Location",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Source",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : source,
                              cursorColor:AppColor.AuthhintColor,
                              readOnly: true,

                              //obscureText: isVisible,
                              style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),

                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:  BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color : AppColor.White,

                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color :AppColor.White,
                                      )
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

                                  //prefixIcon:Icon(Icons.lock,color: Colors.white, size: 20,),
                                  hintText:"Ex.(Whatsapp,skype,email)",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")



                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: Container(
                                width: double.infinity,
                                height: 46,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(AppColor.ButtonColor2),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )
                                      )
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },

                                  child: Text("Back",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
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