import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import '../../util/appImage.dart';
import 'AllComment.dart';
import 'CallHistory.dart';
import 'CallLogs.dart';
import 'FiltterPage2.dart';
import 'HomePage.dart';
import 'SetReminder2.dart';
import 'UpdateClientDetails.dart';
class ColdClient extends StatefulWidget {
  const ColdClient({super.key});

  @override
  State<ColdClient> createState() => _ColdClientState();
}

class _ColdClientState extends State<ColdClient> {
  @override
  TextEditingController Search1 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController mob1 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController Skype = TextEditingController();
  TextEditingController Ldate = TextEditingController();
  TextEditingController Sdate1 = TextEditingController();
  TextEditingController Fdate = TextEditingController();
  String selectSources = '';
  List<String>sourceLists= ["Warm","Cold", "Dead","Important"];
  String? selectedGenders;
  final Map<String, String> genderMapping1 = {
    "Warm": "1",
    "Cold": "2",
    "Dead": "3",
    "Important": "5",
  };
  int _currentPage = 0;
  int itemsPerPage = 20;
  String selectSource2 = '';
  List<String>sourceList2 = ["Warm","Cold", "Dead","Important"];
  String? selectedGender2;
  final Map<String, String> genderMapping = {
    "Warm": "1",
    "Cold": "2",
    "Dead": "3",
    "Important": "5",
  };
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _launchURL1(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  //final String phoneNumber = "6377525200";
  TextEditingController Sdate = TextEditingController();
  TextEditingController Comment = TextEditingController();
  TextEditingController Search = TextEditingController();
  @override
  bool isLoading = false;
  void initState() {
    super.initState();
    // fetchClients();
  }
  void openGmailApp(String toEmail, String subject, String body) async {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'android.intent.action.SENDTO',
        data: Uri.encodeFull('mailto:$toEmail?subject=$subject&body=$body'),
        package: 'com.google.android.gm', // Gmail app package name
      );

      try {
        await intent.launch();
      } catch (e) {
        print('Error launching Gmail: $e');
      }
    } else {
      // Fallback for iOS or other platforms
      final url = Uri.parse('mailto:$toEmail?subject=$subject&body=$body');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch email composer';
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final list = authController.allClientResponse?.data ?? [];

    if (list.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF223e6d),
            title: Text("Cold Client",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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

          body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10,vertical: 0),
                        child: Container(
                          width: double.infinity,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(10),
                            color: AppColor.White,

                          ),
                          child: TextField(
                            controller : Search1,
                            cursorColor:AppColor.AuthhintColor,
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),
                            onChanged: (value) async {

                              if (Search1.text.isNotEmpty) {
                                await authController.GetAllClient(
                                  name: '',
                                  fname: '',
                                  mobile: '',
                                  email: '',
                                  from_date: '',
                                  to_date: '',
                                  last_date: '',
                                  search:  Search1.text,
                                  status: '2',
                                  location: '',
                                  source: '',
                                  limit: '10000', // fetch all for pagination
                                  offset: '0',
                                  agent_id: '',
                                );
                              }
                              else {
                                await authController.GetAllClient(
                                  name: '',
                                  fname: '',
                                  mobile: '',
                                  email: '',
                                  from_date: '',
                                  to_date: '',
                                  last_date: '',
                                  search:  Search1.text,
                                  status: '2',
                                  location: '',
                                  source: '',
                                  limit: '10000', // fetch all for pagination
                                  offset: '0',
                                  agent_id: '',
                                );
                              }

                              setState(() {}); // Refresh UI with new data



                              print(value); // This will print the value typed in the text field
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color : AppColor.TextfeildColor,

                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color :AppColor.TextfeildColor,
                                  )
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

                              prefixIcon:Icon(Icons.search, size: 20,color: AppColor.AuthhintColor,),
                              hintText:"Search Leads",
                              hintStyle: TextStyle(fontSize:14,color: AppColor.AuthhintColor,fontFamily:"Poppins",fontWeight: FontWeight.w400),


                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){

                          Get.to(FiltterPage2(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                  child: Row(
                    children: [
                      authController.allClientResponse!.data!=null ?
                      Text("Total Record ${authController.allClientResponse!.data!.length.toString()}",style:TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),):
                      Text("Total Record 0",style:TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
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
          )
      );
    }

    int numPages = (list.length / itemsPerPage).ceil();

    int start = _currentPage * itemsPerPage;
    int end = (_currentPage + 1) * itemsPerPage;
    if (end > list.length) end = list.length;

    var pageItems = list.sublist(start, end);
    List<String?> selectedValues = List.generate(pageItems.length, (index) => null);
    final Map<String, String> reverseGenderMapping =
    genderMapping.map((key, value) => MapEntry(value, key));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text("Cold Client",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
    GetBuilder<AuthController>(builder: (authController) {
      final clients = authController.allClientResponse?.data ?? [];


      return
      /*authController.allClientResponse == null || authController.allClientResponse!.data == null ?
      Column(
        children: [
          SizedBox(height:20,),
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
      ):*/
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10,vertical: 0),
                    child: Container(
                      width: double.infinity,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(10),
                        color: AppColor.White,

                      ),
                      child: TextField(
                        controller : Search1,
                        cursorColor:AppColor.AuthhintColor,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),
                        onChanged: (value) async {
                          if (Search1.text.isNotEmpty) {
                            await authController.GetAllClient(
                              name: '',
                              mobile: '',
                              email: '',
                              from_date: '',
                              to_date: '',
                              last_date: '',
                              search: Search1.text,
                              status: '2',
                              location: '',
                              source: '',
                              limit: '10000',
                              offset: '0',
                              agent_id: '', fname: '',
                            );
                          } else {
                            // Clear the list or re-fetch the original unfiltered data
                            await authController.GetAllClient(
                              name: '',
                              mobile: '',
                              email: '',
                              from_date: '',
                              to_date: '',
                              last_date: '',
                              search: '',
                              status: '2',
                              location: '',
                              source: '',
                              limit: '10000',
                              offset: '0',
                              agent_id: ''
                              , fname: '',
                            );
                          }

                          setState(() {}); // Refresh UI with new data
                        },


                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color : AppColor.TextfeildColor,

                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color :AppColor.TextfeildColor,
                              )
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

                          prefixIcon:Icon(Icons.search, size: 20,color: AppColor.AuthhintColor,),
                          hintText:"Search Leads",
                          hintStyle: TextStyle(fontSize:14,color: AppColor.AuthhintColor,fontFamily:"Poppins",fontWeight: FontWeight.w400),


                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){

                      Get.to(FiltterPage2(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: Row(
                children: [
                  authController.allClientResponse!.data!=null ?
                  Text("Total Record ${authController.allClientResponse!.data!.length.toString()}",style:TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),):
                  Text("Total Record 0",style:TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pageItems.length,
                itemBuilder: (context, index) {
                  var item = pageItems[index];
                  Color textColor = pageItems[index].commentCount!.toString() == '1' ? Colors.red : AppColor.Black;
                  Color getReminderColor(String? reminderDate) {
                    if (reminderDate == null || reminderDate == '0' || reminderDate.isEmpty) {
                      return Colors.transparent; // 1. Default/empty
                    }

                    DateTime? reminder = DateTime.tryParse(reminderDate);
                    if (reminder == null) return Colors.grey;

                    if (reminder.isAfter(DateTime.now()) || reminder.isAtSameMomentAs(DateTime.now())) {
                      return Colors.green; // 2. Future or now
                    } else if(reminder.isBefore(DateTime.now()) ) {
                      return Colors.purple ; // 3. Past
                    }else{
                      return Colors.red;
                    }
                  }
                  return Column(
                    children: [

                      InkWell(
                        onTap: (){
                          int UserId = int.tryParse(pageItems[index].id!) ?? 0;
                          authController.GetClientDetails(
                            client_id: UserId.toString(),
                          );
                          /* Get.to(ClientProfile(
                            ID:UserId,
                          ));*/
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                // Text(authController.allClientResponse!.data![index].name.toString(),style:TextStyle(color: AppColor.AuthhintColor,fontSize: 13,fontWeight: FontWeight.w400),),
                                                pageItems[index].name!.toString()!=null && pageItems[index].name!.isNotEmpty?
                                                Text(pageItems[index].name.toString(),style:TextStyle(color: textColor,fontSize: 16,fontWeight: FontWeight.w600),):SizedBox.shrink(),
                                                Row(
                                                  children: [
                                                    Icon(Icons.settings,size: 12,color: AppColor.ButtonColor2,),
                                                    SizedBox(width: 5,),
                                                    Container(
                                                        width: 100,
                                                        height: 20,

                                                        //padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                        child: DropdownButtonHideUnderline(
                                                          child: DropdownButton<String>(
                                                              hint: Text(
                                                                selectedValues[index] ?? pageItems[index].status.toString(),
                                                                style: TextStyle(fontSize: 13, color: AppColor.Black, fontFamily: "Montserrat",fontWeight: FontWeight.w500),
                                                              ),
                                                              dropdownColor: AppColor.White,
                                                              icon: Icon(Icons.arrow_drop_down, color: AppColor.Black),
                                                              iconSize: 18,
                                                              //isExpanded: true,
                                                              style: TextStyle(fontSize: 13, color: textColor, fontFamily: "Montserrat",fontWeight: FontWeight.w500),
                                                              items: sourceList2.map((String gender) {
                                                                return DropdownMenuItem<String>(
                                                                  value: gender,
                                                                  child: Text(gender),
                                                                );
                                                              }).toList(),
                                                              value: selectedValues[index] ??
                                                                  reverseGenderMapping[pageItems[index].status!.toString()],
                                                              onChanged: (String? value) async {
                                                                setState(() {
                                                                  selectedValues[index] = value;
                                                                });

                                                                int userId = int.tryParse(pageItems[index].id ?? '') ?? 0;
                                                                String statusCode = genderMapping[value ?? ""] ?? "";

                                                                // 1. Status change
                                                                await authController.GetChangeStatus(
                                                                  client_id: userId.toString(),
                                                                  status: statusCode ?? '',
                                                                );

                                                                // 2. Client list refresh
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
                                                                  limit: '10000',
                                                                  offset: '0',
                                                                  agent_id: '',

                                                                );
                                                                setState(() {});
                                                              }

                                                          ),
                                                        )

                                                    ),
                                                  ],
                                                ),
                                                pageItems[index].email!.toString()!=null && pageItems[index].email!.isNotEmpty?
                                                Row(
                                                  children: [
                                                    Icon(Icons.mail_outline_outlined,size: 12,color: AppColor.ButtonColor2,),
                                                    SizedBox(width: 5,),
                                                    Text(pageItems[index].email.toString(),style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),),
                                                  ],
                                                ):SizedBox.shrink(),
                                                pageItems[index].newEmail!.toString()!=null && pageItems[index].newEmail!.isNotEmpty?
                                                Row(
                                                  children: [
                                                    Icon(Icons.mail_outline_outlined,size: 12,color: AppColor.ButtonColor2,),
                                                    SizedBox(width: 5,),
                                                    Text(pageItems[index].newEmail.toString(),style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),),
                                                  ],
                                                ):SizedBox.shrink(),
                                                pageItems[index].mobile!.toString()!=null && pageItems[index].mobile!.isNotEmpty?
                                                Row(
                                                  children: [
                                                    Icon(Icons.call,size: 12,color: AppColor.ButtonColor2,),
                                                    SizedBox(width: 5,),
                                                    Text(pageItems[index].mobile.toString(),style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),),
                                                  ],
                                                ):SizedBox.shrink(),
                                                pageItems[index].newMobile!.toString()!=null && pageItems[index].newMobile!.isNotEmpty?
                                                Row(
                                                  children: [
                                                    Icon(Icons.call,size: 12,color: AppColor.ButtonColor2,),
                                                    SizedBox(width: 5,),
                                                    Text(pageItems[index].newMobile.toString(),style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),),
                                                  ],
                                                ):SizedBox.shrink(),
                                                pageItems[index].location!.toString()!=null && pageItems[index].location!.isNotEmpty?
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on,size: 13,color: AppColor.ButtonColor2,),
                                                    SizedBox(width: 5,),
                                                    Expanded(child: Text(pageItems[index].location.toString(),style:TextStyle(color: textColor,fontSize: 13,fontWeight: FontWeight.w600),)),
                                                  ],
                                                ):SizedBox.shrink(),
                                                pageItems[index].clientComment!.toString()!=null && pageItems[index].clientComment!.isNotEmpty?
                                                Row(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: [
                                                    Icon(Icons.comment,size: 13,color: AppColor.ButtonColor2,),
                                                    SizedBox(width: 5,),
                                                    Expanded(child: Text("${pageItems[index].clientComment.toString()}",style:TextStyle(color: textColor,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 1,),),


                                                  ],
                                                ):SizedBox.shrink(),
                                                authController.profileResponse!.data!.type.toString() == "manager"?
                                                Text("Assign: ${pageItems[index].assignTo.toString()}",style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                                pageItems[index].source!.toString()!=null && pageItems[index].source!.isNotEmpty?
                                                Text("Source: ${pageItems[index].source.toString()}",style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                                pageItems[index].created!.toString()!=null && pageItems[index].created!.isNotEmpty?
                                                Text("Crate on: ${pageItems[index].created.toString()}",style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                                pageItems[index].updated!.toString()!=null && pageItems[index].updated!.isNotEmpty?
                                                Text("Last Update: ${pageItems[index].updated.toString()}",style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                                pageItems[index].setReminderDate!.toString()!=null && pageItems[index].setReminderDate!.isNotEmpty?
                                                Text("Reminder: ${pageItems[index].setReminderDate.toString()}",style:TextStyle(color: textColor,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),

                                              ],
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Icon(
                                                Icons.notifications,
                                                color: getReminderColor(pageItems[index].setReminderDate),
                                                size: 28,
                                              ),

                                            ],
                                          ),


                                        ],
                                      ),

                                      SizedBox(height: 5,),
                                      Row(
                                        children: [


                                          Expanded(
                                            child: InkWell(
                                                onTap: () async {
                                                  int UserId = int.tryParse(pageItems[index].id!) ?? 0;
                                                  int StatusId = int.tryParse(pageItems[index].status!) ?? 0;
                                                  await authController.GetAllcomments(client_id: UserId.toString());

                                                  Get.to(AllComment(
                                                    Id:UserId.toString(),
                                                    Status:StatusId.toString(),
                                                  ),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
                                                },
                                                child: Image.asset(AppImage.comments,fit: BoxFit.contain,height:25)
                                            ),
                                          ),
                                          pageItems[index].email!.toString()!=null && pageItems[index].email!.isNotEmpty?
                                          Expanded(
                                            child: InkWell(
                                                onTap: (){
                                                  DateTime now = DateTime.now();
                                                  String calling_date = DateFormat('yyyy-MM-dd').format(now);
                                                  String calling_time = DateFormat('hh:mm:ss a').format(now);
                                                  //String phone = pageItems[index].email.toString();
                                                  String receiverEmail =  pageItems[index].email.toString();
                                                  String senderEmail = authController.profileResponse!.data!.email.toString();

                                                  String subject = "";
                                                  String body = "";

                                                  openGmailApp(receiverEmail, subject, body);

                                                  authController.GetAddGmails(
                                                    client_id: pageItems[index].id.toString(),
                                                    gmail_count: "1",
                                                    calling_date: calling_date,
                                                    calling_time: calling_time,
                                                    client_mobile: pageItems[index].mobile.toString()??"",
                                                    client_name: pageItems[index].name.toString()??"",
                                                    calling_platform: "gmail",
                                                    client_email: pageItems[index].email.toString()??"",
                                                  );
                                                },
                                                child: Image.asset(AppImage.gmail,fit: BoxFit.contain,height:25)
                                            ),
                                          ):SizedBox.shrink(),
                                          pageItems[index].mobile!.toString()!=null && pageItems[index].mobile!.isNotEmpty?
                                          Expanded(
                                            child: TextButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<EdgeInsets>(
                                                  EdgeInsets.symmetric(horizontal: 7, vertical: 2),),
                                              ),
                                              onPressed: () {
                                                DateTime now = DateTime.now();
                                                String calling_date = DateFormat('yyyy-MM-dd').format(now);
                                                String calling_time = DateFormat('hh:mm:ss a').format(now);
                                                String phone = pageItems[index].mobile.toString();
                                                _makePhoneCall(phone);
                                                /*    authController.GetAddCall(
                                                    client_id: pageItems[index].id.toString(),
                                                    calling_count: "1",
                                                    calling_date: calling_date,
                                                    calling_time: calling_time,
                                                    client_mobile: pageItems[index].mobile.toString(),
                                                    client_name: pageItems[index].name.toString(),
                                                    calling_platform: "call", calling_type: '', call_duration_in_second: ''
                                                );*/
                                              },

                                              child:  Image.asset(AppImage.telephone,fit: BoxFit.cover,height:25,),
                                            ),
                                          ):SizedBox.shrink(),
                                          pageItems[index].mobile!.toString()!=null && pageItems[index].mobile!.isNotEmpty?
                                          Expanded(
                                            child: TextButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<EdgeInsets>(
                                                  EdgeInsets.symmetric(horizontal:8, vertical: 2),),
                                              ),
                                              onPressed: () {
                                                DateTime now = DateTime.now();
                                                String calling_date = DateFormat('yyyy-MM-dd').format(now);
                                                String calling_time = DateFormat('hh:mm:ss a').format(now);
                                                String phone = pageItems[index].mobile.toString();
                                                String whatsappUrl = 'https://wa.me/91$phone'; // Assuming Indian number with country code +91

                                                _launchURL(whatsappUrl);
                                                authController.GetAddWhatapps(
                                                    client_id: pageItems[index].id.toString(),
                                                    whatsapp_count: "1",
                                                    calling_date: calling_date,
                                                    calling_time: calling_time,
                                                    client_mobile: pageItems[index].mobile.toString(),
                                                    client_name: pageItems[index].name.toString(),
                                                    calling_platform: "whatsapp"
                                                );
                                              },
                                              child: Image.asset(AppImage.Whatsapp,fit: BoxFit.fill,height:25,),

                                            ),
                                          ):SizedBox.shrink(),
                                         // authController.profileResponse!.data!.type.toString() == "manager"?
                                          Expanded(
                                            child: InkWell(
                                                onTap: () async {
                                                  int UserId = int.tryParse(pageItems[index].id!) ?? 0;
                                                  await  authController.GetCallHistory(
                                                    calling_type: "",
                                                    email: "",
                                                    from_date: "",
                                                    mobile: "",
                                                    name: "",
                                                    to_date: "",
                                                    client_id: pageItems[index].id.toString(),
                                                    calling_platform: "",
                                                    search: '',

                                                  );
                                                  Get.to(CallHistory(
                                                    Id:pageItems[index].id.toString(),
                                                  ),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
                                                },
                                                child: Image.asset(AppImage.History,fit: BoxFit.contain,height:25)
                                            ),
                                          ),
                                          Expanded(child:
                                          InkWell(
                                              onTap:(){
                                                int UserId = int.tryParse(pageItems[index].id!) ?? 0;
                                                Get.to(UpdateClientDetails(
                                                  ID:UserId,
                                                  name:pageItems[index].name.toString(),
                                                  email:pageItems[index].email.toString(),
                                                  new_email:pageItems[index].newEmail.toString(),
                                                  mobile:pageItems[index].mobile.toString(),
                                                  new_mobile:pageItems[index].newMobile.toString(),
                                                  location:pageItems[index].location.toString(),
                                                  source:pageItems[index].source.toString(),
                                                  skype:pageItems[index].skype.toString(),

                                                ),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
                                              },
                                              child: Image.asset(AppImage.edit,fit: BoxFit.contain,height:25)),),
                                          Expanded(
                                            child: InkWell(
                                                onTap: (){
                                                  int UserId = int.tryParse(pageItems[index].id!) ?? 0;

                                                  Get.to(SetReminder2(
                                                    Id:UserId,
                                                  ));
                                                },
                                                child: Image.asset(AppImage.reminder,fit: BoxFit.contain,height:25)
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NumberPaginator(
                numberPages: numPages,
                onPageChange: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
          ],
        ),
      );})
    );
  }
  void _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: "tel", path: phoneNumber);

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw "Could not launch $callUri";
    }
  }
}