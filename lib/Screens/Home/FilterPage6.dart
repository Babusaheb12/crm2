
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import 'UserList.dart';

class FilterPage6 extends StatefulWidget {
  const FilterPage6({super.key});

  @override
  State<FilterPage6> createState() => _FilterPage6State();
}

class _FilterPage6State extends State<FilterPage6> {
  @override
  TextEditingController Search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController mob1 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController Skype = TextEditingController();
  TextEditingController Ldate = TextEditingController();
  TextEditingController Sdate = TextEditingController();
  TextEditingController Fdate = TextEditingController();
  String selectSource2 = '';
  List<String>sourceList2 = ["Active","Deactive"];
  String? selectedGender2;
  final Map<String, String> genderMapping = {
    "Active": "1",
    "Deactive": "2",

  };
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("Fillter User",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
          ),
          leading:InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 22,)),
          actions: [


            SizedBox(width: 10,),


          ],
        ),
        body:Container(
          height: double.infinity,
          color: AppColor.Background,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text("Name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(10),
                                      color: AppColor.White,

                                    ),
                                    child: TextField(
                                      controller : name,
                                      cursorColor:AppColor.AuthhintColor,

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
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Mobile Number",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(10),
                                      color: AppColor.White,

                                    ),
                                    child: TextField(
                                      controller : mob,
                                      cursorColor:AppColor.AuthhintColor,

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
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(10),
                                      color: AppColor.White,

                                    ),
                                    child: TextField(
                                      controller : email,
                                      cursorColor:AppColor.AuthhintColor,

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
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      /* border: Border.all(
                                                  color: Colors.black
                                              ),*/
                                      color: AppColor.White,
                                      // border: Border.all(width: 1, color: AppColor.AuthhintColor),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          "Select",
                                          style: TextStyle(fontSize: 14, color: AppColor.AuthhintColor,fontFamily:"Montserrat",fontWeight: FontWeight.w500),
                                        ),
                                        dropdownColor: AppColor.White,
                                        icon: Icon(Icons.settings,color: AppColor.Black,),
                                        iconSize: 15,
                                        isExpanded: true,
                                        style: TextStyle(fontSize: 14, color: Colors.black,fontFamily:"Montserrat"),
                                        items: sourceList2.map((String gender) {
                                          return DropdownMenuItem<String>(
                                            child: Text(gender),
                                            value: gender,
                                          );
                                        }).toList(),
                                        value: selectSource2 == 'Select' ? null : selectedGender2,
                                        /*== 'Select' ? null : selectSource*/ // Handle null value for the hint
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedGender2 = value;
                                            selectSource2 = genderMapping[value!] ?? 'Select';
                                            //selectSource = value ?? 'Select'; // Update state and handle null value
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.ButtonColor2,
                            minimumSize:  Size(double.infinity, 50),
                          ),
                          onPressed: () async {
                            await
                            authController.GetAllUser(
                                name: name.text,
                                mobile: mob.text,
                                email: email.text,
                                status: selectSource2,
                                limit: '10000', // fetch all for pagination
                                offset: '0',
                            );
                            Get.to(UserLists(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

                          },
                          child:  Text(
                            'Show Results',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}