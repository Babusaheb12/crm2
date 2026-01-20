
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/appColor.dart';
import '../../util/appImage.dart';
import 'CallLogs.dart';
import 'Fillter1.dart';


class CallHistory extends StatefulWidget {
  final Id;
  const CallHistory({super.key, this.Id});

  @override
  State<CallHistory> createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  @override
  String? clientId;
  bool isClientIdShown = false;
  @override
  void initState() {
    super.initState();

    _saveClientId(widget.Id.toString());
    _loadClientId();
    _handleClientId();
  }
  void _saveClientId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('clientId', id);
    print("✅ Saved clientId: $id");
  }
  void _loadClientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadedId = prefs.getString('clientId');

    if (!isClientIdShown && loadedId != null) {
      setState(() {
        clientId = loadedId;
        isClientIdShown = true;
      });

      // 👇 Show only once (Snackbar / print / Dialog etc.)
      print("📦 Showing clientId one time only: $clientId");

      /*ScaffoldMessenger.of(context).showSnackBar(
        //SnackBar(content: Text("Client ID: $clientId")),
      );*/
    }
  }
  void _handleClientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Pehli baar ID save karo
    if (widget.Id != null && widget.Id.toString() != 'null') {
      await prefs.setString('client_id', widget.Id.toString());
      print("✅ Saved client_id: ${widget.Id}");
    }

    // Har baar load karo
    setState(() {
      clientId = prefs.getString('client_id') ?? '0';
      print("📦 Using client_id: $clientId");
    });
  }

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
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text("Call History",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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

      body:  authController.isLoading16 ?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
      authController.callHistoryResponse == null || authController.callHistoryResponse!.data == null?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
        ),
      ):
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
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
                        controller : Search,
                        cursorColor:AppColor.AuthhintColor,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),
                        onChanged: (value) async {

                            Search.text!= "" ?
                            await authController.GetCallHistory(
                              name: '',
                              mobile: '',
                              email: '',
                              from_date: '',
                              to_date: '',
                              client_id: widget.Id.toString(),
                              calling_platform: '',
                              calling_type: '',
                              search: Search.text,


                            ):SizedBox();
                            Search.text.isEmpty ?
                            await authController.GetCallHistory(
                              name: '',
                              mobile: '',
                              email: '',
                              from_date: '',
                              to_date: '',
                              client_id: widget.Id.toString(),
                              calling_platform: '',
                              calling_type: '',
                              search: "",
                            ):SizedBox();
                            setState(() {

                            });


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
                    onTap: () async {
                      /* showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(100, 145, 20, 100),
                        color: AppColor.White,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        items: [
                          PopupMenuItem<String>(
                            value: 'Fillter',
                            child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return Column(
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
                                              *//*if (age < 18) {
                                                                              showCustomSnackBar("You must be at least 18 years old.", getXSnackBar: false, isError: true);
                                                                              Sdate.clear();



                                                                            }*//*}
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
                                    SizedBox(height: 10,),
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
                                              *//*if (age < 18) {
                                                                              showCustomSnackBar("You must be at least 18 years old.", getXSnackBar: false, isError: true);
                                                                              Sdate.clear();



                                                                            }*//*}
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
                                    SizedBox(height: 10,),
                                    Text("Calling Platform",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: double.infinity,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        *//* border: Border.all(
                                                    color: Colors.black
                                                ),*//*
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
                                          *//*== 'Select' ? null : selectSource*//* // Handle null value for the hint
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
                                    SizedBox(height: 10,),
                                    Text("Calling Type",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: double.infinity,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        *//* border: Border.all(
                                                    color: Colors.black
                                                ),*//*
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
                                          *//*== 'Select' ? null : selectSource*//* // Handle null value for the hint
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedGender2 = value;
                                              selectSource2 = value ?? 'Select'; //
                                            });
                                          },
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.ButtonColor2,
                                          minimumSize:  Size(80, 36),
                                        ),
                                        onPressed: () async {
                                          await authController.GetCallHistory(
                                            name:  "",
                                            mobile: "",
                                            email: "",
                                            from_date: Fdate.text,
                                            to_date: Sdate.text,
                                            client_id: widget.Id.toString(),
                                            calling_platform: selectSource1,
                                            calling_type: selectSource2,
                                            search: "",


                                          );
                                          Get.back();

                                        },
                                        child:  Text(
                                          'Show Results',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ) ;
                              },
                            ),
                          ),
                        ],
                        elevation: 8.0,
                      ).then((value) {
                        // Handle menu selection if needed
                      });*/
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      String? clientId = prefs.getString('client_id') ?? '0';

                      Get.to(FillterPage1(ID: clientId),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));                    },
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
          ),
          SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
              itemCount: authController.callHistoryResponse!.data!= null ?authController.callHistoryResponse!.data!.length:0,
              itemBuilder: (context, index) {
                int durationInSec = int.tryParse(authController.callHistoryResponse!.data![index].callDurationInSecond ?? '0') ?? 0;
                int minutes = durationInSec ~/ 60;
                int seconds = durationInSec % 60;
                return Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
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
                                    authController.callHistoryResponse!.data![index].clientName!.toString()!=null && authController.callHistoryResponse!.data![index].clientName!.isNotEmpty?
                                    Text(authController.callHistoryResponse!.data![index].clientName.toString(),style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),):SizedBox.shrink(),
                                    Text(authController.callHistoryResponse!.data![index].clientMobile.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),),
                                    authController.callHistoryResponse!.data![index].clientEmail !=null && authController.callHistoryResponse!.data![index].clientEmail!.isNotEmpty?
                                    Text(authController.callHistoryResponse!.data![index].clientEmail.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),
                                    authController.callHistoryResponse!.data![index].callDurationInSecond !=null && authController.callHistoryResponse!.data![index].callDurationInSecond!.isNotEmpty?
                                    Text("Duration: ${minutes} min ${seconds} sec",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                    authController.callHistoryResponse!.data![index].callingType !=null && authController.callHistoryResponse!.data![index].callingType!.isNotEmpty?
                                    Row(
                                      children: [
                                        Text("Calling Type: ",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                        if(authController.callHistoryResponse!.data![index].callingType.toString()=="Missed")
                                        Text("Missed",style:TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                     if(authController.callHistoryResponse!.data![index].callingType.toString()=="Outgoing")
                                        Text("Outgoing",style:TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                     if(authController.callHistoryResponse!.data![index].callingType.toString()=="Incoming")
                                        Text("Incoming",style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                      ],
                                    ):SizedBox.shrink(),
                                    Row(
                                      children: [
                                        Text("Date & Time: ${authController.callHistoryResponse!.data![index].callingDate.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                        Text(" ${authController.callHistoryResponse!.data![index].callingTime.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              if(authController.callHistoryResponse!.data![index].callingPlatform.toString()== "call")
                                Image.asset(AppImage.telephone,fit: BoxFit.fill,height:25,)
                              else if(authController.callHistoryResponse!.data![index].callingPlatform.toString()== "whatsapp")
                                Image.asset(AppImage.Whatsapp,fit: BoxFit.fill,height:25,)
                              else if(authController.callHistoryResponse!.data![index].callingPlatform.toString()== "gmail")
                                  Image.asset(AppImage.gmail,fit: BoxFit.fill,height:25,)

                            ],
                          ),
                          SizedBox(height: 0,),


                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
