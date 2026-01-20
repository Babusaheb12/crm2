
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/appColor.dart';
import 'HomePage.dart';

class performance extends StatefulWidget {
  const performance({super.key});

  @override
  State<performance> createState() => _performanceState();
}

class _performanceState extends State<performance> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text("Top Performance",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.Background
        ),

        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}
