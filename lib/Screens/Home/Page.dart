
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import '../../util/appImage.dart';
import 'UpdateClientDetails.dart';

class PaginationDemo extends StatefulWidget {
  @override
  _PaginationDemoState createState() => _PaginationDemoState();
}

class _PaginationDemoState extends State<PaginationDemo> {
  final AuthController authController = Get.find<AuthController>();
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
  List<String>sourceLists= ["Warm","Cold", "Dead","Sleep","Important"];
  String? selectedGenders;
  final Map<String, String> genderMapping1 = {
    "Warm": "1",
    "Cold": "2",
    "Dead": "3",
    "Sleep": "4",
    "Important": "5",
  };
  int _currentPage = 0;
  int itemsPerPage = 20;
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  final String phoneNumber = "6377525200";
  TextEditingController Sdate = TextEditingController();
  TextEditingController Comment = TextEditingController();
  TextEditingController Search = TextEditingController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await authController.GetAllClient(
        name: '',
        fname: '',
        mobile: '',
        email: '',
        from_date: '',
        to_date: '',
        last_date: '',
        search: '',
        status: '',
        location: '',
        source: '',
        limit: '10000', // fetch all for pagination
        offset: '0',
        agent_id: '',

      );

      setState(() {}); // refresh UI after data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    final list = authController.allClientResponse?.data ?? [];

    if (list.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Profile Pagination")),
        body: Center(child: CircularProgressIndicator()),
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
        title: Text("All Client",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
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
                        controller : Search,
                        cursorColor:AppColor.AuthhintColor,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),
                        onChanged: (value) {
                          setState(() async {
                            Search.text!= "" ?
                            authController.GetAllClient(
                              name: '',
                              fname: '',
                              mobile: '',
                              email: '',
                              from_date: '',
                              to_date: '',
                              last_date: '',
                              search:  Search.text,
                              status: '',
                              location: '',
                              source: '',
                              limit: '10000', // fetch all for pagination
                              offset: '0',
                              agent_id: '',

                            ):SizedBox();
                            Search.text.isEmpty ?
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
                              limit: '10000', // fetch all for pagination
                              offset: '0',
                              agent_id: '',

                            ):SizedBox();
                            setState(() {});
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
                    onTap: (){
                      showMenu(
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
                                    // Text("Name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
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
                                    SizedBox(height: 10,),
                                    //Text("Mobile Number",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
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
                                    SizedBox(height: 10,),
                                    //Text("Email",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
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
                                    SizedBox(height: 10,),
                                    //Text("Location(City)",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
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
                                    SizedBox(height: 10,),
                                    // Text("Source",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    // SizedBox(height: 5,),
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
                                    SizedBox(height: 10,),
                                    //Text("Status",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
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
                                            style: TextStyle(fontSize: 14, color: AppColor.AuthhintColor,fontFamily:"Poppins",fontWeight: FontWeight.w500),
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
                                    SizedBox(height: 10,),
                                    //Text("From Date",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
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
                                            hintText: "From Date",
                                            hintStyle: TextStyle(fontSize: 14,
                                                color: AppColor.AuthhintColor,
                                                fontFamily: "Montserrat")


                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    //Text("To Date",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
                                    Container(
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
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
                                            hintText: "To Date",
                                            hintStyle: TextStyle(fontSize: 14,
                                                color: AppColor.AuthhintColor,
                                                fontFamily: "Montserrat")


                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    // Text("Last Date	",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                                    //SizedBox(height: 5,),
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
                                            hintText: "Last Date",
                                            hintStyle: TextStyle(fontSize: 14,
                                                color: AppColor.AuthhintColor,
                                                fontFamily: "Montserrat")


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
                                        onPressed: ()  async {
                                          await authController.GetAllClient(
                                            name: "",
                                            fname: name.text,
                                            mobile: mob.text,
                                            email: email.text,
                                            from_date: Fdate.text,
                                            to_date: Sdate1.text,
                                            last_date: Ldate.text,
                                            search:  "",
                                            status: selectSource2,
                                            location: location.text,
                                            source: source.text,
                                            limit: '10000', // fetch all for pagination
                                            offset: '0',
                                            agent_id: '',

                                          );
                                          name.clear();
                                          mob.clear();
                                          email.clear();
                                          location.clear();
                                          source.clear();
                                          Fdate.clear();
                                          Sdate1.clear();
                                          Ldate.clear();

                                          // Optionally reset the dropdown selection
                                          setState(() {
                                            selectedGender2 = null; // or whatever default value you want
                                            selectSource2 = 'Select'; // Reset to default
                                          });

                                          // Close the menu
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
                      });
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
                itemCount: pageItems.length,
                itemBuilder: (context, index) {
                  var item = pageItems[index];
                  return InkWell(
                      onTap: (){
                        int UserId = int.tryParse(pageItems[index].id!) ?? 0;


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
                                      children: [
                                        Expanded(

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                             // Text(authController.allClientResponse!.data![index].name.toString(),style:TextStyle(color: AppColor.AuthhintColor,fontSize: 13,fontWeight: FontWeight.w400),),
                                              pageItems[index].name!.toString()!=null && pageItems[index].name!.isNotEmpty?
                                              Text(pageItems[index].name.toString(),style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),):SizedBox.shrink(),
                                              pageItems[index].email!.toString()!=null && pageItems[index].email!.isNotEmpty?
                                              Text(pageItems[index].email.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),
                                              pageItems[index].mobile!.toString()!=null && pageItems[index].mobile!.isNotEmpty?
                                              Text(pageItems[index].mobile.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),
                                              pageItems[index].location!.toString()!=null && pageItems[index].location!.isNotEmpty?
                                              Text(pageItems[index].location.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),
                                              Text("Assign: ${pageItems[index].assignTo.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                              pageItems[index].source!.toString()!=null && pageItems[index].source!.isNotEmpty?
                                              Text("Source: ${pageItems[index].source.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                              pageItems[index].created!.toString()!=null && pageItems[index].created!.isNotEmpty?
                                              Text("Crate on: ${pageItems[index].created.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                              pageItems[index].updated!.toString()!=null && pageItems[index].updated!.isNotEmpty?
                                              Text("Last Update: ${pageItems[index].updated.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                              pageItems[index].setReminderDate!.toString()!=null && pageItems[index].setReminderDate!.isNotEmpty?
                                              Text("Reminder: ${pageItems[index].setReminderDate.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                              pageItems[index].clientComment!.toString()!=null && pageItems[index].clientComment!.isNotEmpty?
                                              Row(
                                                children: [
                                                  Expanded(child: Text("Comment: ${pageItems[index].clientComment.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,)),
                                                  SizedBox(width: 5,),
                                                  Icon(Icons.add_circle_outline,color: AppColor.ButtonColor2,size: 20,),
                                                  //SizedBox(width: 10,),

                                                ],
                                              ):SizedBox.shrink(),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: double.infinity,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.Background,
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          hint: Text(
                                            "Warm",
                                            style: TextStyle(fontSize: 14, color: AppColor.Black, fontFamily: "Montserrat"),
                                          ),
                                          dropdownColor: AppColor.White,
                                          icon: Icon(Icons.settings, color: AppColor.Black),
                                          iconSize: 15,
                                          isExpanded: true,
                                          style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Montserrat"),
                                          items: sourceList2.map((String gender) {
                                            return DropdownMenuItem<String>(
                                              value: gender,
                                              child: Text(gender),
                                            );
                                          }).toList(),

                                          /// 👇 Auto select based on created value from pageItems
                                          value: selectedValues[index] ??
                                              reverseGenderMapping[pageItems[index].status!.toString()],

                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedValues[index] = value;
                                            });
                                          },
                                        ),
                                      )

                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [

                                        Expanded(child:
                                        InkWell(
                                            onTap:(){
                                              Get.to(UpdateClientDetails(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
                                            },
                                            child: Icon(Icons.edit,color: AppColor.ButtonColor2,size: 20))),
                                        Expanded(
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
                                                              child: Text("Set Reminder Date",
                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.ButtonColor2)),
                                                            ),
                                                            SizedBox(height: 20,),
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

                                                                  },
                                                                  child: Text("Add Reminder",
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
                                            child: CircleAvatar(
                                                maxRadius: 12,
                                                backgroundColor: AppColor.ButtonColor2,
                                                child: Icon(Icons.calendar_month_sharp,color: Colors.white,size: 13,)),
                                          ),
                                        ),
                                        Expanded(
                                          child: TextButton(
                                            style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(
                                                EdgeInsets.symmetric(horizontal: 7, vertical: 2),),
                                            ),
                                            onPressed: () => _makePhoneCall(phoneNumber),
                                            child:  Image.asset(AppImage.Call,fit: BoxFit.cover,color: AppColor.ButtonColor2,height:25,),
                                          ),
                                        ),
                                        Expanded(
                                          child: TextButton(
                                            style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(
                                                EdgeInsets.symmetric(horizontal:8, vertical: 2),),
                                            ),
                                            onPressed: () => _launchURL('https://wa.me/918769949579'),
                                            child: Image.asset(AppImage.Whatsapp,fit: BoxFit.fill,height:25,),

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
      ),
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
