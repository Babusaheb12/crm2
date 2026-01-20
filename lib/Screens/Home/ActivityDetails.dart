
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/appColor.dart';
import '../../util/appImage.dart';
import 'CallLogs.dart';

class ActivityDetails extends StatefulWidget {
  const ActivityDetails({super.key});

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  @override

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

      body:  authController.isLoading19 ?
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
      authController.activityDetailsResponse == null || authController.activityDetailsResponse!.data == null ?
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
          Expanded(
            child: ListView.builder(
              itemCount: authController.activityDetailsResponse!.data!= null ?authController.activityDetailsResponse!.data!.length:0,
              itemBuilder: (context, index) {
                int durationInSec = int.tryParse(authController.activityDetailsResponse!.data![index].callDurationInSecond ?? '0') ?? 0;
                int minutes = durationInSec ~/ 60;
                int seconds = durationInSec % 60;
                return Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
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
                                    authController.activityDetailsResponse!.data![index].clientName!.toString()!=null && authController.activityDetailsResponse!.data![index].clientName!.isNotEmpty?
                                    Text(authController.activityDetailsResponse!.data![index].clientName.toString(),style:TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),):SizedBox.shrink(),
                                    Text(authController.activityDetailsResponse!.data![index].clientMobile.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),),
                                    authController.activityDetailsResponse!.data![index].clientEmail !=null && authController.activityDetailsResponse!.data![index].clientEmail!.isNotEmpty?
                                    Text(authController.activityDetailsResponse!.data![index].clientEmail.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),
                                    authController.activityDetailsResponse!.data![index].callDurationInSecond !=null && authController.activityDetailsResponse!.data![index].callDurationInSecond!.isNotEmpty?
                                    Text("Duration: ${minutes} min ${seconds} sec",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                    authController.activityDetailsResponse!.data![index].callingType !=null && authController.activityDetailsResponse!.data![index].callingType!.isNotEmpty?
                                    Row(
                                      children: [
                                        Text("Calling Type: ",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                        if(authController.activityDetailsResponse!.data![index].callingType.toString()=="Missed")
                                          Text("Missed",style:TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                        if(authController.activityDetailsResponse!.data![index].callingType.toString()=="Outgoing")
                                          Text("Outgoing",style:TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                        if(authController.activityDetailsResponse!.data![index].callingType.toString()=="Incoming")
                                          Text("Incoming",style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                      ],
                                    ):SizedBox.shrink(),
                                    Row(
                                      children: [
                                        Text("Date & Time: ${authController.activityDetailsResponse!.data![index].callingDate.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                        Text(" ${authController.activityDetailsResponse!.data![index].callingTime.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              if(authController.activityDetailsResponse!.data![index].callingPlatform.toString()== "call")
                                Image.asset(AppImage.telephone,fit: BoxFit.fill,height:25,)
                              else if(authController.activityDetailsResponse!.data![index].callingPlatform.toString()== "whatsapp")
                                Image.asset(AppImage.Whatsapp,fit: BoxFit.fill,height:25,)
                              else if(authController.activityDetailsResponse!.data![index].callingPlatform.toString()== "gmail")
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
