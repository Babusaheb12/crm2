
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import 'CallHistory.dart';

class FillterPage1 extends StatefulWidget {
  final ID;
  const FillterPage1({super.key, this.ID});

  @override
  State<FillterPage1> createState() => _FillterPage1State();
}

class _FillterPage1State extends State<FillterPage1> {
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
  List<String>sourceList2 = ["Missed","Incoming", "outgoing"];
  String? selectedGender2;
  final Map<String, String> genderMapping = {
    "Missed": "1",
    "Incoming": "2",
    "outgoing": "3",
  };
  String selectSource1 = '';
  List<String>sourceList1 = ["call","whatsapp", "gmail"];
  String? selectedGender1;
  final Map<String, String> genderMapping1 = {
    "call": "1",
    "whatsapp": "2",
    "gmail": "3",
  };
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final String clientId = widget.ID.toString();

    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("Fillter Call History",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
                                  Text("From Date",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      controller: Fdate,
                                      readOnly: true,
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(

                                                colorScheme: ColorScheme.light(
                                                  background: Colors.white,
                                                  // primary:  primary, // <-- SEE HERE
                                                  onPrimary: Colors
                                                      .white, // <-- SEE HERE
                                                  //onSurface: primary, // <-- SEE HERE
                                                ),
                                              ), child: child!,
                                            );
                                          },

                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2025),
                                          lastDate: DateTime(2030),
                                        ).then((selectedDate) {
                                          if (selectedDate != null) {
                                            Fdate.text =
                                                DateFormat('yyyy-MM-dd').format(
                                                    selectedDate);
                                            DateTime today = DateTime.now();
                                            int age = today.year - selectedDate.year;
                                            if (today.month < selectedDate.month ||
                                                (today.month == selectedDate.month && today.day < selectedDate.day)) {
                                              age--;}
                                            /*if (age < 18) {
                                                                              showCustomSnackBar("You must be at least 18 years old.", getXSnackBar: false, isError: true);
                                                                              Sdate.clear();



                                                                            }*/}
                                        },);},
                                      //maxLength: 10,
                                      cursorColor: AppColor.AuthhintColor,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Montserrat"),

                                      decoration: InputDecoration(
                                          counterText: '',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
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
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          hintText: "YYYY-MM-DD",
                                          hintStyle: TextStyle(fontSize: 14,
                                              color: AppColor.AuthhintColor,
                                              fontFamily: "Montserrat")


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
                                  Text("To Date",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      controller: Sdate,
                                      readOnly: true,
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                  // primary:  primary, // <-- SEE HERE
                                                  onPrimary: Colors
                                                      .white, // <-- SEE HERE
                                                  //onSurface: primary, // <-- SEE HERE
                                                ),
                                              ), child: child!,
                                            );
                                          },

                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2025),
                                          lastDate: DateTime(2030),
                                        ).then((selectedDate) {
                                          if (selectedDate != null) {
                                            Sdate.text =
                                                DateFormat('yyyy-MM-dd').format(
                                                    selectedDate);
                                            DateTime today = DateTime.now();
                                            int age = today.year - selectedDate.year;
                                            if (today.month < selectedDate.month ||
                                                (today.month == selectedDate.month && today.day < selectedDate.day)) {
                                              age--;}
                                            /*if (age < 18) {
                                                                              showCustomSnackBar("You must be at least 18 years old.", getXSnackBar: false, isError: true);
                                                                              Sdate.clear();



                                                                            }*/}
                                        },);},
                                      //maxLength: 10,
                                      cursorColor: AppColor.AuthhintColor,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Montserrat"),

                                      decoration: InputDecoration(
                                          counterText: '',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: AppColor.White,
                                              //color: AppColor.AuthBoderColor,


                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: AppColor.White,
                                                //color: AppColor.AuthBoderColor,
                                              )
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          hintText: "YYYY-MM-DD",
                                          hintStyle: TextStyle(fontSize: 14,
                                              color: AppColor.AuthhintColor,
                                              fontFamily: "Montserrat")


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
                                  Text("Calling Platform",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    width: double.infinity,
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
                                        icon: Icon(Icons.arrow_drop_down,color: AppColor.AuthhintColor,size: 25,),
                                        iconSize: 15,
                                        isExpanded: true,
                                        style: TextStyle(fontSize: 14, color: Colors.black,fontFamily:"Montserrat"),
                                        items: sourceList1.map((String gender) {
                                          return DropdownMenuItem<String>(
                                            child: Text(gender),
                                            value: gender,
                                          );
                                        }).toList(),
                                        value: selectSource1 == 'Select' ? null : selectedGender1,
                                        /*== 'Select' ? null : selectSource*/ // Handle null value for the hint
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedGender1 = value;
                                            selectSource1 = value ?? 'Select'; //
                                            //selectSource = value ?? 'Select'; // Update state and handle null value
                                          });
                                        },
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
                                  Text("Calling Type",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    width: double.infinity,
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
                                        icon: Icon(Icons.arrow_drop_down,color: AppColor.AuthhintColor,size: 25,),
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
                                            selectSource2 = value ?? 'Select'; //
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
                        SizedBox(height: 10,),

                        SizedBox(height: 30,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.ButtonColor2,
                            minimumSize:  Size(double.infinity, 50),
                          ),
                          onPressed: () async {
                            await authController.GetCallHistory(
                              name:  "",
                              mobile: "",
                              email: "",
                              from_date: Fdate.text,
                              to_date: Sdate.text,
                              client_id: clientId,
                              calling_platform: selectSource1,
                              calling_type: selectSource2,
                              search: "",


                            );
                            Get.to(CallHistory(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

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

