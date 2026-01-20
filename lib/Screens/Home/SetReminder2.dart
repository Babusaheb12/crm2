
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import 'ColdClient.dart';

class SetReminder2 extends StatefulWidget {
  final Id;

  const SetReminder2({super.key, this.Id});

  @override
  State<SetReminder2> createState() => _SetReminder2State();
}

class _SetReminder2State extends State<SetReminder2> {
  @override
  final AuthController authController = Get.find<AuthController>();

  TextEditingController Sdate = TextEditingController();
  TextEditingController Fdate = TextEditingController();
  TextEditingController Search = TextEditingController();
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("Set Reminder",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
                    Text("Set Reminder",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                    SizedBox(height: 5,),
                    Container (
                      width: double.infinity,
                      height: 36,
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
                                        .grey, // <-- SEE HERE
                                    //onSurface: primary, // <-- SEE HERE
                                  ),
                                ), child: child!,
                              );
                            },

                            initialDate: DateTime.now(),
                            firstDate:  DateTime.now(),
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
                    SizedBox(height: 30,),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.ButtonColor2,
                        ),
                        onPressed: ()  async {

                          await authController.GetSetReminder(
                            client_id: widget.Id.toString(),
                            reminder_date: Sdate.text,
                          );
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
                            limit: '10000', // fetch all for pagination
                            offset: '0',
                            agent_id: '',
                          );
                          Get.to(ColdClient(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));


                        },
                        child: Text("Add Reminder",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.White)),
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
