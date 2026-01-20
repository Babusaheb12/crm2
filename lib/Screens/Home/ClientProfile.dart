/*
import 'package:call_log/call_log.dart';
import 'package:crmtd/Controller/AgentController/Authcontroller.dart';
import 'package:crmtd/Controller/DashboardController.dart';
import 'package:crmtd/Screens/Home/CallLogs.dart';
import 'package:crmtd/Screens/Home/UpdateClientDetails.dart';
import 'package:crmtd/Screens/Home/ViewClientDetails.dart';
import 'package:crmtd/util/appColor.dart';
import 'package:crmtd/util/appImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';

class ClientProfile extends StatefulWidget {
  final ID;
  const ClientProfile({super.key, this.ID});

  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF223e6d),
            title: Text("Client Profile",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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

          body: GetBuilder<DashController>(builder: (dashController) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.Background

              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 5,),
                    Container(
                      color: AppColor.Background,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: AppColor.ButtonColor2,
                        padding: EdgeInsets.all(0),
                        labelPadding: EdgeInsets.zero,
                        labelStyle: TextStyle(fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat"),
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.black,
                        */
/*indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: AppColor.ButtonColor
                          ),
                          color: AppColor.Button2Color,

                        ),*//*

                        tabs: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: Tab(text: 'Details'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: Tab(text: 'Comments'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: Tab(text: 'Call History',),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      // Expanded to take the remaining space
                      child: TabBarView(
                        children: [
                          CustomWovenGridView1(
                            id:widget.ID.toString()
                          ),
                          CustomWovenGridView2(
                              id:widget.ID.toString()
                          ),
                          CustomWovenGridView3(),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            );
          })
      ),
    );
  }
}

  class CustomWovenGridView1 extends StatefulWidget {
    final id;
  const CustomWovenGridView1({super.key, this.id});

  @override
  State<CustomWovenGridView1> createState() => _CustomWovenGridView1State();
  }

  class _CustomWovenGridView1State extends State<CustomWovenGridView1> {
  @override
  final AuthController authController = Get.find<AuthController>();

  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {


      setState(() {
        */
/*authController.GetClientDetails(
          client_id: widget.id.toString(),
        );*//*

      });
    });
  }

  TextEditingController Sdate = TextEditingController();
  String selectSource2 = 'Select';
  List<String>sourceList2 = ["Partner", "Corporation"];
  String? selectedGender2;
  final Map<String, String> genderMapping = {
    "Partner": "1",
    "Corporation": "2",
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
  Widget build(BuildContext context) {
    return  Scaffold(
      body:

      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.Background
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: SingleChildScrollView(
            child:
             authController.isLoading8 ?
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
      ):
            authController.clientDetailsResponse == null || authController.clientDetailsResponse!.data == null ?
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
            ):
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name:",style:TextStyle(color: AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                Text(authController.clientDetailsResponse!.data!.name.toString(),style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                Divider(thickness: 1,),
                Text("Assign To:",style:TextStyle(color: AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text(authController.clientDetailsResponse!.data!.assignTo.toString(),style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                Divider(thickness: 1,),
                Text("Status:",style:TextStyle(color: AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                if(authController.clientDetailsResponse!.data!.status.toString()== "1")
                Text("Warm",style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                else if(authController.clientDetailsResponse!.data!.status.toString()== "2")
                  Text("Cold",style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                else if(authController.clientDetailsResponse!.data!.status.toString()== "3")
                    Text("Dead",style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                  else if(authController.clientDetailsResponse!.data!.status.toString()== "4")
                      Text("Speed",style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),)
                    else if (authController.clientDetailsResponse!.data!.status.toString()== "5")
                Text("Important",style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),

                Divider(thickness: 1,),
            
                Text("Email:",style:TextStyle(color: AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text(authController.clientDetailsResponse!.data!.email.toString(),style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                Divider(thickness: 1,),
            
                Text("Location:",style:TextStyle(color:  AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text(authController.clientDetailsResponse!.data!.location.toString(),style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                Divider(thickness: 1,),
            
                Text("Source:",style:TextStyle(color: AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text(authController.clientDetailsResponse!.data!.source.toString(),style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                Divider(thickness: 1,),
            
                Text("Start Date:",style:TextStyle(color:  AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text(authController.clientDetailsResponse!.data!.created.toString(),style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                Divider(thickness: 1,),
            
                Text("Modify Date:",style:TextStyle(color:  AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text(authController.clientDetailsResponse!.data!.updated.toString(),style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                Divider(thickness: 1,),
            
                Text("Remainder Date:",style:TextStyle(color: AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text(authController.clientDetailsResponse!.data!.setReminderDate.toString(),style:TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
               // Divider(thickness: 1,),
            
                SizedBox(height: 10,),
               */
/* Row(
                  children: [
                    Text("Action:",style:TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(width: 20,),
                    InkWell(
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
                                                *//*
*/
/*if (age < 18) {
                                                                                showCustomSnackBar("You must be at least 18 years old.", getXSnackBar: false, isError: true);
                                                                                Sdate.clear();
            
            
            
                                                                              }*//*
*/
/*}
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
                          maxRadius: 15,
                          backgroundColor: AppColor.ButtonColor2,
                          child: Icon(Icons.calendar_month_sharp,color: Colors.white,size: 18,)),
                    ),
            
                    SizedBox(width: 15,),
                    InkWell(
                      onTap: (){
                        Get.to(UpdateClientDetails());
                      },
                      child: CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: AppColor.ButtonColor2,
                          child: Icon(Icons.edit,color: Colors.white,size: 18,)),
                    ),
            
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Connect:",style:TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                    // SizedBox(width: 10,),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 7, vertical: 2),),
                      ),
                      onPressed: () => _makePhoneCall(phoneNumber),
                      child:  Image.asset(AppImage.Call,fit: BoxFit.cover,color: AppColor.ButtonColor2,height:35,),
                    ),
                    // SizedBox(width: 10,),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal:8, vertical: 2),),
                      ),
                      onPressed: () => _launchURL('https://wa.me/918769949579'),
                      child: Image.asset(AppImage.Whatsapp,fit: BoxFit.fill,height:35,),
            
                    ),
                  ],
                ),*//*

            
            
              ],
            ),
          ),
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

  class CustomWovenGridView2 extends StatefulWidget {
    final id;
  const CustomWovenGridView2({super.key, this.id});

  @override
  State<CustomWovenGridView2> createState() => _CustomWovenGridView2State();
  }

  class _CustomWovenGridView2State extends State<CustomWovenGridView2> {
  @override
  final AuthController authController = Get.find<AuthController>();
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {


      setState(() {
     */
/*   authController.GetAllcomments(
          client_id: widget.id.toString(),
        );*//*

      });
    });
  }

  TextEditingController Comment = TextEditingController();
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:AppColor.Background
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:   authController.isLoading7 ?
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
            ):
            authController.allCommentResponse == null || authController.allCommentResponse!.data == null ?
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
            ):
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:authController.allCommentResponse!.data!.length??0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(ClientProfile());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                
                                  children: [
                                    RichText(
                                      text: new TextSpan(
                                          text: 'by ',
                                          style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                          children: <TextSpan>[
                                      new TextSpan(
                                      text: authController.allCommentResponse!.data![index].commentAgentName.toString(),
                                        style: TextStyle(color: AppColor.ButtonColor2,fontSize: 16,fontWeight: FontWeight.w500),
                                      )]
                                      ),),
                                    SizedBox(height: 3,),
                                    Text(authController.allCommentResponse!.data![index].comment.toString(),style:TextStyle(color: AppColor.Black,fontSize: 14,fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),),
                                    SizedBox(height: 3,),
                                    Text(authController.allCommentResponse!.data![index].commentDate.toString(),style:TextStyle(color: AppColor.Black,fontSize: 10,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                                    //Text("09:12 PM",style:TextStyle(color: AppColor.Black,fontSize: 10,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                                
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                );
              },
            ),
          
          ),
        )
      ),


      floatingActionButton: Container(
        height: 70,
        color: AppColor.Background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(10),
                    color: AppColor.White,

                  ),
                  child: TextField(
                    controller : Comment,
                    cursorColor:AppColor.AuthhintColor,

                    //maxLength: 10,
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),

                    decoration: InputDecoration(
                      counterText:'',
                      focusedBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color : AppColor.TextfeildColor,

                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color : AppColor.TextfeildColor,
                          )
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      hintText: "Enter Comment",
                      hintStyle: TextStyle(fontSize:14,color: AppColor.AuthhintColor,fontFamily:"Poppins",fontWeight: FontWeight.w400),


                    ),
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Expanded(child: InkWell(
                  onTap: (){
                    Comment.clear();
                  },
                  child: Icon(Icons.send,color:AppColor.ButtonColor2,size: 30,)))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  class CustomWovenGridView3 extends StatefulWidget {
  const CustomWovenGridView3({super.key});

  @override
  State<CustomWovenGridView3> createState() => _CustomWovenGridView3State();
  }

  class _CustomWovenGridView3State extends State<CustomWovenGridView3> {


    Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];

    @override
    void initState() {
      super.initState();
      setState(() {
        _sendCallLogToAPI();

      });
    }
    Map<String, dynamic> _callEntryToJson(CallLogEntry entry) {
      return {
        "name": entry.name ?? "Unknown",
        "number": entry.number,
        "timestamp": DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0).toIso8601String(),
        "duration": entry.duration,
        "callType": entry.callType.toString(), // Optional
      };
    }
    List<Map<String, dynamic>> convertCallLogsForApi(Iterable<CallLogEntry> entries) {
      return entries.map((entry) {
        final dateTime = DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0);
        final callType = _getCallType(entry.callType);

        return {
          "client_id": "3418", // use dynamic if needed
          "calling_count": "1",
          "calling_date": DateFormat("yyyy-MM-dd").format(dateTime),
          "calling_time": DateFormat("HH:mm").format(dateTime),
          "client_mobile": entry.number ?? '',
          "client_name": entry.name?.isNotEmpty == true ? entry.name : "Unknown",
          "calling_platform": "call",
          "calling_type": callType,
          "call_duration_in_second": "${entry.duration ?? 0}",
        };
      }).toList();
    }
    String _getCallType(CallType? type) {
      switch (type) {
        case CallType.incoming:
          return "Incoming";
        case CallType.outgoing:
          return "Outgoing";
        case CallType.missed:
          return "Missed";
        case CallType.rejected:
          return "Rejected";
        default:
          return "Unknown";
      }
    }
    Future<void> _sendCallLogToAPI() async {
      final Iterable<CallLogEntry> logs = await CallLog.query();
      final filtered = logs.where((e) => e.number == "+918854842806");
      final data = convertCallLogsForApi(filtered);

      await Get.find<AuthController>().getCallMultiPle(multiplecallData: data);
    }
    @override
    Widget build(BuildContext context) {

      const TextStyle mono = TextStyle(fontFamily: 'monospace');
      final List<Widget> children = <Widget>[];

      for (CallLogEntry entry in _callLogEntries) {
        children.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.White,

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //const Divider(),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${entry.name?.isNotEmpty == true ? entry.name : "Unknown"}', style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 14, // Change this value as needed
                            fontWeight: FontWeight.bold, // Optional: Make text bold
                            color: AppColor.Black,)),
                          Text('${entry.number}', style: TextStyle(
                                      fontFamily: 'monospace',
                                      fontSize: 10, // Change this value as needed
                                      fontWeight: FontWeight.w400, // Optional: Make text bold
                                      color: Colors.black,)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0).toLocal().toString().split(' ')[0]}',
                            style: TextStyle(
                              //fontFamily: 'monospace',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.Black,
                            ),
                          ),
                          Text(
                            '${DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0))}',
                            style: TextStyle(
                              //fontFamily: 'monospace',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.Black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(' ${entry.duration} Sec', style: TextStyle(
                        //fontFamily: 'monospace',
                        fontSize: 12,  // Change this value as needed
                        fontWeight: FontWeight.w400, // Optional: Make text bold
                        color: Colors.black,)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            color: AppColor.Background,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  */
/*Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: _fetchCallLog, // Button se bhi manually fetch kar sakte hain
                        child: const Text('Refresh Call Log'),
                      ),
                    ),
                  ),*//*

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: children),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

*/
