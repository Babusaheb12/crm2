import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import 'WarmClient.dart';

class FittersPages extends StatefulWidget {
  const FittersPages({super.key});

  @override
  State<FittersPages> createState() => _FittersPagesState();
}

class _FittersPagesState extends State<FittersPages> {
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
  List<String>sourceList2 = ["Warm","Cold", "Dead","Sleep","Important"];
  String? selectedGender2;
  final Map<String, String> genderMapping = {
    "Warm": "1",
    "Cold": "2",
    "Dead": "3",
    "Sleep": "4",
    "Important": "5",
  };
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("Fillter Client",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
                                  Text("Location(City)",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(10),
                                      color: AppColor.White,

                                    ),
                                    child: TextField(
                                      controller : location,
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

                                          hintText: "Enter Location",
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
                                  Text("Source",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(10),
                                      color: AppColor.White,

                                    ),
                                    child: TextField(
                                      controller : source,
                                      cursorColor:AppColor.AuthhintColor,

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
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remainder Date	",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      controller: Ldate,
                                      readOnly: true,
                                      onTap: () async {
                                        await showDatePicker(
                                          context: context,
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: ColorScheme.light(
                                                  // primary:  primary, // <-- SEE HERE
                                                  onPrimary: AppColor.White,// <-- SEE HERE
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
                                            Ldate.text =
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
                          ],
                        ),
                        SizedBox(height: 10,),
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

                        SizedBox(height: 60,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.ButtonColor2,
                            minimumSize:  Size(double.infinity, 50),
                          ),
                          onPressed: () async {
                            await authController.GetAllClient(
                              name: '',
                              fname: name.text,
                              mobile: mob.text,
                              email: email.text,
                              from_date: Fdate.text,
                              to_date: Sdate.text,
                              last_date: Ldate.text,
                              search:  "",
                              status: "1",
                              location: location.text,
                              source: source.text,
                              limit: '50000', // fetch all for pagination
                              offset: '0',
                              agent_id: "",
                            );
                            Get.to(WarmClient(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

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

