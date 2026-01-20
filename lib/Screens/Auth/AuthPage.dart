
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/appImage.dart';
import 'AdminLogin.dart';
import 'LoginPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomCenter,
              radius: 1,
              focal: Alignment.topCenter,
              focalRadius: 0.5,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFF5F71CF),

              ],
              //stops: [0,1.0], // Position stops for each color
            ),),
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 25),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80,),
                    Center(
                      child: Image.asset(
                        AppImage.splashLogo,
                        height: 80,
                        width: 150,
                      ),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child:InkWell(
                            onTap: (){
                              Get.to(Adminlogin(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
              
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: [
                                    Icon(Icons.perm_identity_outlined,size: 40,),
                                    SizedBox(height: 5,),
                                    Text("Admin",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              ),
                            )
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child:InkWell(
                            onTap: (){
                              Get.to(LoginPage(),transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
              
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: [
                                    Icon(Icons.perm_identity_outlined,size: 40,),
                                    SizedBox(height: 5,),
                                    Text("Agent",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
}
