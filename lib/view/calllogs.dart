import 'dart:convert';

// import 'package:call_log/call_log.dart';  // Temporarily commented out due to compatibility issues
import 'package:crm/view/Lead/AddLeadView.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../appcomman/AppColor.dart';
import '../appcomman/AppFont.dart';
import '../appcomman/AppRoute.dart';
import '../appcomman/AppUtil.dart';

class CallLogs extends StatefulWidget {
  const CallLogs({super.key});

  @override
  State<CallLogs> createState() => _CallLogsState();
}

class _CallLogsState extends State<CallLogs> {

  final List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    // Add more colors as needed
  ];

  Color getRandomColor(String text) {
    // Convert the first letter to uppercase
    String firstLetter = text.isNotEmpty ? text[0].toUpperCase() : 'A';

    // Get the ASCII value of the first letter
    int asciiValue = firstLetter.codeUnitAt(0);

    // Calculate the index based on the ASCII value
    int index = (asciiValue - 65) % colorList.length;

    // Return the corresponding color
    return colorList[index];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermissionUser();

    setState(() {

    });

  }

  void getPermissionUser() async {
    if (await Permission.phone.request().isGranted) {
      getCallLogs();
    } else {
      await Permission.phone.request();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leadingWidth: 0,
        titleSpacing: 8,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("images/logo.png",height: 30,),

            Icon(Icons.logout,color: Colors.white,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(

            children: [

              Container(
                height: AppUtil.fullHeight(context)*0.2,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35))
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // headerContainer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Call Logs",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: primaryFont,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: AppUtil.fullHeight(context)*0.06,),
                    getCustomerData()



                    /* Container(
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(

                          aspectRatio: 1.0,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: [
                          _buildChart(),
                          estimateContainer(),
                          proposalContainer()
                        ],
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        activeColor: primary
                      ),

                      position: currentIndex,
                    ),*/

                  ],
                ),
              ),

            ],
          ),
        ),
      ),


    );
  }
  Widget getCustomerData()
  {
    return /*ListView.builder(
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 60),
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: primary.withOpacity(0.6),width: 0.2)
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 16,
                              color: primary),
                        ),

                        SizedBox(height: 2,),
                        Text(
                          "Company Name",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(

                              fontSize: 14,
                              color: primary),
                        ),



                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },)*/
      FutureBuilder(

        future: getCallLogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<dynamic> callLogs = snapshot.data as List<dynamic>; // Using dynamic due to compatibility issues
            return ListView.builder(
              itemCount: callLogs.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var callLog = callLogs[index];
                // Extract values from mock data
                String? name = callLog['name'];
                String? formattedNumber = callLog['number'];
                int? timestamp = callLog['timestamp'];
                int? callType = callLog['callType']; // 0 for incoming, 1 for outgoing, 2 for missed
                return formattedNumber != null ?
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: primary.withOpacity(0.6),width: 0.2)
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: name != null ? getRandomColor(name):primary,
                            child: Center(
                              child: name != null ?
                              Text(
                                name != null ? name[0] : 'U',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              ):formattedNumber != null ?Icon(Icons.person,color: Colors.white,):
                              Text(
                                'U',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),


                          ),
                        ),

                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name != null ? name : formattedNumber != null ?
                                        formattedNumber : 'Unknown',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: primary),
                                      ),

                                      SizedBox(height: 2,),
                                      Row(
                                        children: [
                                          callType != 2 ?
                                          callType == 0 ? Icon(Icons.call_received,color: Colors.grey,size: 15,)
                                              :Icon(Icons.call_made_outlined,color: Colors.green,size: 15,):Icon(Icons.call_missed,color: Colors.red,size: 15,),
                                          Text(
                                            convertTime(timestamp ?? DateTime.now().millisecondsSinceEpoch)??"", // Using timestamp instead
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return AddLeadView(name: name ?? '',contact: formattedNumber ?? "",);
                                      },));
                                    },
                                    child: CircleAvatar(
                                      radius:15,
                                      backgroundColor: primary,
                                      child: Icon(Icons.add_box,color: Colors.white,size: 15,),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ) : SizedBox();

                /*ListTile(
                  title: Text(callLog.name ?? 'Unknown'),
                  subtitle: Text(callLog.formattedNumber),
                  trailing: Text(callLog.callType.toString()),
                );*/
              },
            );
          }
        },
      );
  }
  Widget getRowContainer(String title,String value)
  {
    return Row(
      children: [
        Expanded(
          flex:10,
          child: Text(
            title,
            style: TextStyle(

                fontSize: 16,
                color: Colors.grey),
          ),
        ),
        Expanded(
          flex:1,
          child: Text(
            ":",
            style: TextStyle(

                fontSize: 13,color: Colors.grey),
          ),
        ),
        Expanded(
          flex:17,
          child: Text(
            value,
            style: TextStyle(

                fontSize: 16,
                color: primary),
          ),
        ),
      ],
    );
  }

  Widget headerContainer()
  {
    return  Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("images/logo.png",height: 30,),

              Icon(Icons.logout,color: Colors.white,)
            ],
          ),
          SizedBox(height: 4,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Leads",
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: primaryFont,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<dynamic>> getCallLogs() async { // Changed to dynamic due to compatibility issues
    try {
      // Placeholder implementation since call_log plugin is temporarily disabled
      print('Call log access temporarily disabled due to plugin compatibility issues');
      
      // Return mock data for now
      return [
        {
          'name': 'John Doe',
          'number': '+1234567890',
          'timestamp': DateTime.now().millisecondsSinceEpoch,
          'callType': 0,
        },
        {
          'name': 'Jane Smith',
          'number': '+0987654321',
          'timestamp': DateTime.now().subtract(Duration(minutes: 10)).millisecondsSinceEpoch,
          'callType': 1,
        },
      ]; // Mock data to prevent app from crashing
    } catch (e) {
      print('Error retrieving call logs: $e');
      return [];
    }
  }

  String convertTime(int time )
  {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);

    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    DateTime today = DateTime(now.year, now.month, now.day);
    // Format the DateTime to a human-readable string
    String formattedDateTime = DateFormat('d MMM yy h:mma').format(dateTime);

    if (dateTime.isAfter(today)) {
      return 'Today ${DateFormat('h:mma').format(dateTime)}';
    } else if (dateTime.isAfter(yesterday)) {
      return 'Yesterday ${DateFormat('h:mma').format(dateTime)}';
    } else {
      return DateFormat('d MMM yy h:mma').format(dateTime);
    }
    //return formattedDateTime;

  }

}
