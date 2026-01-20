
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../util/appColor.dart';
import 'AllClient.dart';
import 'CallLogs.dart';
import 'FilterPage6.dart';
import 'HomePage.dart';

class UserLists extends StatefulWidget {
  const UserLists({super.key});

  @override
  State<UserLists> createState() => _UserListsState();
}

class _UserListsState extends State<UserLists> {
  @override
  TextEditingController Sdate = TextEditingController();
  TextEditingController Fdate = TextEditingController();
  TextEditingController Search = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text("All User",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
        ),
        leading:InkWell(
            onTap: (){
              Get.to(HomePage(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
            },
            child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 22,)),
        actions: [


          SizedBox(width: 10,),


        ],
      ),

      body:
      authController.isLoading13?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color:  Color(0xff686666))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text("Please Wait......", style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff686666),
                        fontFamily: "Montserrat")),
                  ),
                ),
              ),
            ),
          ],
        ),
      ):
      authController.allUserResponse!.data ==null?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color:  Color(0xff686666))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text("No Record Found......", style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff686666),
                        fontFamily: "Montserrat")),
                  ),
                ),
              ),
            ),
          ],
        ),
      ):
      Column(
        children: [
          SizedBox(height: 5,),
          Row(
            children: [
              SizedBox(width: 15,),
              Expanded(
                flex: 5,
                child:
                Text("Total Record ${authController.allUserResponse!.totalCount.toString()}",style:TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),),

    ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){

                    Get.to(FilterPage6(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10,vertical: 0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.ButtonColor2,
                            borderRadius: BorderRadius.circular(10)

                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(Icons.filter_list_alt,color: AppColor.White,),
                        )

                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: authController.allUserResponse!.data!.length??0,
              itemBuilder: (context, index) {
                return Column(
                  children: [

                    InkWell(
                      onTap: (){
                        int UserId = int.tryParse(authController.allUserResponse!.data![index].id!) ?? 0;
                        
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: InkWell(
                              onTap:() async {
                                await authController.GetAllClient(
                                  name: '',
                                  fname: '',
                                  mobile: '',
                                  email: '',
                                  from_date: '',
                                  to_date: '',
                                  last_date: '',
                                  search:  "",
                                  status: '',
                                  location: '',
                                  source: '',
                                  limit: '50000', // fetch all for pagination
                                  offset: '0',
                                  agent_id: authController.allUserResponse!.data![index].id.toString(),
                                );
                                Get.to(AllClient(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
                                },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                authController.allUserResponse!.data![index].fname!.toString()!=null && authController.allUserResponse!.data![index].fname!.isNotEmpty?
                                                Text(authController.allUserResponse!.data![index].fname.toString(),style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),):SizedBox.shrink(),
                                                authController.allUserResponse!.data![index].email!.toString()!=null && authController.allUserResponse!.data![index].email!.isNotEmpty?
                                                Text(authController.allUserResponse!.data![index].email.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),
                                                authController.allUserResponse!.data![index].mobile!.toString()!=null && authController.allUserResponse!.data![index].mobile!.isNotEmpty?
                                                Text(authController.allUserResponse!.data![index].mobile.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),
                                                if(authController.allUserResponse!.data![index].status.toString()== "1")
                                                  Text("Active",style:TextStyle(color: Colors.green,fontSize:  12,fontWeight: FontWeight.w400),)
                                                else if(authController.allUserResponse!.data![index].status.toString()== "2")
                                                  Text("Deactive",style:TextStyle(color: Colors.red,fontSize:  12,fontWeight: FontWeight.w400),),
                                               /*  authController.allUserResponse!.data![index].type!.toString()!=null && authController.allUserResponse!.data![index].type!.isNotEmpty?
                                                Text("Type: ${authController.allUserResponse!.data![index].type.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                                */authController.allUserResponse!.data![index].password!.toString()!=null && authController.allUserResponse!.data![index].password!.isNotEmpty?
                                                Text("Password: ${authController.allUserResponse!.data![index].password.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                                authController.allUserResponse!.data![index].created!.toString()!=null && authController.allUserResponse!.data![index].created!.isNotEmpty?
                                                Text("Crate on: ${authController.allUserResponse!.data![index].created.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),

                                              ],
                                            ),
                                          ),
                                          /*InkWell(
                                              onTap: (){
                                                authController.GetAllActivity(
                                                  agent_id:authController.allUserResponse!.data![index].id.toString(),
                                                  to_date:"",
                                                  from_date:"",
                                                );

                                                *//*showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return StatefulBuilder(
                                                      builder: (context, setState) {  // <-- Use StatefulBuilder for setState
                                                        return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          title: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Center(
                                                                child: Text("Activity",
                                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.ButtonColor2)),
                                                              ),
                                                              SizedBox(height: 20,),
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
                                                                        *//**//*if (age < 18) {
                                                                                    showCustomSnackBar("You must be at least 18 years old.", getXSnackBar: false, isError: true);
                                                                                    Sdate.clear();



                                                                                  }*//**//*}
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
                                                                        *//**//*if (age < 18) {
                                                                                    showCustomSnackBar("You must be at least 18 years old.", getXSnackBar: false, isError: true);
                                                                                    Sdate.clear();



                                                                                  }*//**//*}
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


                                                              Row(
                                                                children: [
                                                                  TextButton(
                                                                    onPressed: () => Navigator.pop(context),
                                                                    child: Text("Cancel",
                                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.Black)),
                                                                  ),
                                                                  Spacer(),
                                                                  ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor: AppColor.ButtonColor2,
                                                                    ),
                                                                    onPressed: () {
                                                                      String finalDate = Fdate.text.isEmpty
                                                                          ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                                                                          : Fdate.text;
                                                                      authController.GetAllActivity(
                                                                        agent_id:authController.allUserResponse!.data![index].id.toString(),
                                                                        to_date:finalDate,
                                                                        from_date:Sdate.text,
                                                                      );
                                                                      Get.back();


                                                                    },
                                                                    child: Text("View Activity",
                                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.White)),
                                                                  ),
                                                                ],
                                                              ),

                                                            ],
                                                          ),


                                                        );
                                                      },
                                                    );
                                                  },
                                                );*//*
                                              },
                                              child: Icon(Icons.remove_red_eye_outlined,color: AppColor.ButtonColor2,))*/


                                        ],
                                      ),
                                      SizedBox(height: 5,),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                ;
              },
            ),
          ),

        ],
      ),
    );
  }
}
