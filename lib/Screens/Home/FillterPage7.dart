
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';

class FillterPage7 extends StatefulWidget {
  final Id;
  const FillterPage7({super.key, this.Id});

  @override
  State<FillterPage7> createState() => _FillterPage7State();
}

class _FillterPage7State extends State<FillterPage7> {
  @override
  final AuthController authController = Get.find<AuthController>();

  TextEditingController Sdate = TextEditingController();
  TextEditingController Fdate = TextEditingController();
  TextEditingController Search = TextEditingController();
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("Fillter Activity",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("From Date",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                    SizedBox(height: 5,),
                    Container (
                      width: double.infinity,
                      height: 36,
                      child: TextField(
                        controller: Sdate,
                        //readOnly: true,
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    // primary:  primary, // <-- SEE HERE
                                    onPrimary: Colors
                                        .grey, // <-- SEE HERE
                                    //onSurface: primary, // <-- SEE HERE
                                  ),
                                ), child: child!,
                              );
                            },

                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
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
                            }
                          },);},
                        //maxLength: 10,
                        cursorColor: AppColor.AuthhintColor,
                        style: TextStyle(color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Montserrat"),

                        decoration: InputDecoration(
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                //color: AppColor.AuthBoderColor,


                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
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
                    SizedBox(height: 10,),
                    Text("To Date",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                    SizedBox(height: 5,),
                    Container (
                      width: double.infinity,
                      height: 36,
                      child: TextField(
                        controller: Fdate,
                        //readOnly: true,
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    // primary:  primary, // <-- SEE HERE
                                    onPrimary: Colors
                                        .grey, // <-- SEE HERE
                                    //onSurface: primary, // <-- SEE HERE
                                  ),
                                ), child: child!,
                              );
                            },

                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
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
                            }
                          },);},
                        //maxLength: 10,
                        cursorColor: AppColor.AuthhintColor,
                        style: TextStyle(color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Montserrat"),

                        decoration: InputDecoration(
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                //color: AppColor.AuthBoderColor,


                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
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
                    SizedBox(height: 50,),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.ButtonColor2,
                        minimumSize:  Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        String finalDate = Fdate.text.isEmpty
                            ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                            : Fdate.text;
                       await authController.GetAllActivity(
                          agent_id:widget.Id.toString(),
                          to_date:finalDate,
                          from_date:Sdate.text,
                        );

                        Fdate.clear();
                        Sdate.clear();


                      },
                      child:  Text(
                        'Show Results',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
