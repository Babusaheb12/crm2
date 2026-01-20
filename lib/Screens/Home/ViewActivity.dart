
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import '../../util/appImage.dart';
import 'ActivityDetails.dart';
import 'FillterPage7.dart';
import 'UserList.dart';

class ViewActivity extends StatefulWidget {
  const ViewActivity({super.key});

  @override
  State<ViewActivity> createState() => _ViewActivityState();
}

class _ViewActivityState extends State<ViewActivity> {
  @override
  TextEditingController Fdate = TextEditingController();
  TextEditingController Fdate1 = TextEditingController();
  TextEditingController Fdate2 = TextEditingController();
  TextEditingController Fdate3 = TextEditingController();
  TextEditingController Fdate4 = TextEditingController();
  TextEditingController Sdate = TextEditingController();
  TextEditingController Sdate1 = TextEditingController();
  TextEditingController Sdate2 = TextEditingController();
  TextEditingController Sdate3 = TextEditingController();
  TextEditingController Sdate4 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("All Activity",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
          ),
          leading:InkWell(
              onTap: (){
                Get.to(UserLists());
              },
              child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 22,)),
          actions: [


            SizedBox(width: 10,),


          ],
        ),
        body: GetBuilder<AuthController>(builder: (authController) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.Background
            ),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5,),
                              Expanded(
                                flex: 5,
                                child:Row(
                                  children: [

                                    Icon(Icons.calendar_month,color: AppColor.ButtonColor2,),
                                    SizedBox(width: 10,),
                                    authController.activityResponse!.data!.fromDate.toString().isNotEmpty && authController.activityResponse!.data!.fromDate != null && authController.activityResponse!.data!.toDate.toString().isNotEmpty && authController.activityResponse!.data!.toDate !=null?
                                    Row(
                                      children: [
                                        Text(
                                          "${DateFormat('dd MMMM yyyy').format(DateTime.parse(authController.activityResponse!.data!.fromDate!))}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(" - ",style:TextStyle(color: Colors.black,fontSize:  13,fontWeight: FontWeight.w400),),
                                        Text(
                                          "${DateFormat('dd MMMM yyyy').format(DateTime.parse(authController.activityResponse!.data!.toDate!))}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ):
                                    Text("All Date Activity", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ],
                                )

                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){

                                    Get.to(FillterPage7(
                                      Id:authController.activityResponse!.data!.agentId.toString(),
                                    ),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
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

                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.White,

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: InkWell(
                                      onTap: (){
                                        showDialog(
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
                                                        child: Text("Details Activity",
                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.ButtonColor2)),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Text("From Date",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                                                      SizedBox(height: 5,),
                                                      Container (
                                                        width: double.infinity,
                                                        height: 36,
                                                        child: TextField(
                                                          controller: Sdate4,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Sdate4.text =
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
                                                          controller: Fdate4,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Fdate4.text =
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
                                                            onPressed: ()  async {
                                                              await authController.GetDetailsActivity(
                                                                from_date: Sdate4.text,
                                                                to_date: Fdate4.text,
                                                                agent_id: authController.activityResponse!.data!.agentId.toString(),
                                                                calling_type: 'Total',
                                                              );
                                                              Get.to(ActivityDetails(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

                                                            },
                                                            child: Text("Submit",
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
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Image.asset(AppImage.allcall,fit: BoxFit.fill,height:25,),
                                              SizedBox(width: 10,),
                                              Text("Total Call",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,fontFamily:"Montserrat")),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,

                                            children: [
                                              Icon(Icons.call,color: Colors.black,),
                                              SizedBox(width: 10,),

                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalPhoneCall.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.timer_sharp,color: Colors.black,),
                                              SizedBox(width: 10,),
                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalPhoneCallDuration.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(width: 20,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.White,

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: InkWell(
                                      onTap: (){
                                        showDialog(
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
                                                        child: Text("Details Activity",
                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.ButtonColor2)),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Text("From Date",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                                                      SizedBox(height: 5,),
                                                      Container (
                                                        width: double.infinity,
                                                        height: 36,
                                                        child: TextField(
                                                          controller: Sdate3,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Sdate3.text =
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
                                                          controller: Fdate3,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Fdate3.text =
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
                                                            onPressed: ()  async {
                                                              await authController.GetDetailsActivity(
                                                                from_date: Sdate3.text,
                                                                to_date: Fdate3.text,
                                                                agent_id: authController.activityResponse!.data!.agentId.toString(),
                                                                calling_type: 'Incoming',
                                                              );
                                                              Get.to(ActivityDetails(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

                                                            },
                                                            child: Text("Submit",
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
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Image.asset(AppImage.incomingcall,fit: BoxFit.fill,height:25,),
                                              SizedBox(width: 10,),
                                              Text("Incoming Call",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,fontFamily:"Montserrat")),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,

                                            children: [
                                              Icon(Icons.call,color: Colors.black,),
                                              SizedBox(width: 10,),

                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalIncommingPhoneCall.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.timer_sharp,color: Colors.black,),
                                              SizedBox(width: 10,),
                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalIncommingCallDuration.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(width: 20,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.White,

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: InkWell(
                                      onTap: (){
                                        showDialog(
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
                                                        child: Text("Details Activity",
                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.ButtonColor2)),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Text("From Date",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                                                      SizedBox(height: 5,),
                                                      Container (
                                                        width: double.infinity,
                                                        height: 36,
                                                        child: TextField(
                                                          controller: Sdate2,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Sdate2.text =
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
                                                          controller: Fdate2,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Fdate2.text =
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
                                                            onPressed: ()  async {
                                                              await authController.GetDetailsActivity(
                                                                from_date: Sdate2.text,
                                                                to_date: Fdate2.text,
                                                                agent_id: authController.activityResponse!.data!.agentId.toString(),
                                                                calling_type: 'Outgoing',
                                                              );
                                                              Get.to(ActivityDetails(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

                                                            },
                                                            child: Text("Submit",
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
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Image.asset(AppImage.outgoingcall,fit: BoxFit.fill,height:25,),
                                              SizedBox(width: 10,),
                                              Text("Outgoing Call",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,fontFamily:"Montserrat")),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,

                                            children: [
                                              Icon(Icons.call,color: Colors.black,),
                                              SizedBox(width: 10,),

                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalOutgoingPhoneCall.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.timer_sharp,color: Colors.black,),
                                              SizedBox(width: 10,),
                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalOutgoingCallDuration.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(width: 20,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.White,

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: InkWell(
                                      onTap: (){
                                        showDialog(
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
                                                        child: Text("Details Activity",
                                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.ButtonColor2)),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Text("From Date",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                                                      SizedBox(height: 5,),
                                                      Container (
                                                        width: double.infinity,
                                                        height: 36,
                                                        child: TextField(
                                                          controller: Sdate1,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Sdate1.text =
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
                                                          controller: Fdate1,
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
                                                              firstDate: DateTime(2020),
                                                              lastDate: DateTime(2030),
                                                            ).then((selectedDate) {
                                                              if (selectedDate != null) {
                                                                Fdate1.text =
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
                                                            onPressed: ()  async {
                                                              await authController.GetDetailsActivity(
                                                                from_date: Sdate1.text,
                                                                to_date: Fdate1.text,
                                                                agent_id: authController.activityResponse!.data!.agentId.toString(),
                                                                calling_type: 'Missed',
                                                              );
                                                              Get.to(ActivityDetails(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

                                                            },
                                                            child: Text("Submit",
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
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Image.asset(AppImage.missedcall,fit: BoxFit.fill,height:25,),
                                              SizedBox(width: 10,),
                                              Text("Missed Call",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,fontFamily:"Montserrat")),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,

                                            children: [
                                              Icon(Icons.call,color: Colors.black,),
                                              SizedBox(width: 10,),

                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalMissedPhoneCall.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.timer_sharp,color: Colors.black,),
                                              SizedBox(width: 10,),
                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalMissedCallDuration.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(width: 20,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.White,
                                
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: InkWell(
                                      onTap: (){
                                        showDialog(
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
                                                        child: Text("Details Activity",
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
                                                              firstDate: DateTime(2020),
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
                                                              firstDate: DateTime(2020),
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
                                                            onPressed: ()  async {
                                                              await authController.GetDetailsActivity(
                                                                from_date: Sdate.text,
                                                                to_date: Fdate.text,
                                                                agent_id: authController.activityResponse!.data!.agentId.toString(),
                                                                calling_type: 'Rejected',
                                                              );
                                                              Get.to(ActivityDetails(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));

                                                            },
                                                            child: Text("Submit",
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
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Image.asset(AppImage.Rejected,fit: BoxFit.fill,height:25,),
                                              SizedBox(width: 10,),
                                              Text("Rejected Call",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,fontFamily:"Montserrat")),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,

                                            children: [
                                              Icon(Icons.call,color: Colors.black,),
                                              SizedBox(width: 10,),

                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalRejectedPhoneCall.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.timer_sharp,color: Colors.black,),
                                              SizedBox(width: 10,),
                                              Text("${authController.activityResponse!.data!= null?authController.activityResponse!.data!.totalRejectedCallDuration.toString():"0"}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                                            ],
                                          ),
                                          SizedBox(width: 20,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          );})
    );
  }
}
