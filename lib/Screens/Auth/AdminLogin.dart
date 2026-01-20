import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../util/appColor.dart';
import '../../util/appImage.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  @override
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = true;
  bool _isChacked = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    _simulateLoading();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {


      setState(() {

      });
    });

  }

  bool _isLoading = true;
  void _simulateLoading() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
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
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImage.splashLogo,
                        height: 80,
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                        child: Text("Login to your admin account",style: TextStyle(fontSize: 18,fontFamily:"Poppins",color: Colors.white,fontWeight: FontWeight.w600),)),
                    SizedBox(height: 25,),
                    Container(
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(10),
                        color: AppColor.TextfeildColor,

                      ),
                      child: TextField(
                        controller : username,
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
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize:14,color: AppColor.AuthhintColor,fontFamily:"Poppins",fontWeight: FontWeight.w400),


                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(10),
                        color: AppColor.TextfeildColor,

                      ),
                      child: TextField(
                        controller : password,
                        cursorColor:AppColor.AuthhintColor,

                        obscuringCharacter: '*',
                        obscureText: isVisible,
                        style: TextStyle(color: Colors.black,fontSize: 14,fontFamily:"Poppins"),

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

                          //prefixIcon:Icon(Icons.lock,color: Colors.white, size: 20,),
                          hintText:"Password",
                          hintStyle: TextStyle(fontSize:14,color: AppColor.AuthhintColor,fontFamily:"Poppins",fontWeight: FontWeight.w400),
                          /*suffixIcon: IconButton(
                                icon: Icon(isVisible ? Icons.remove_red_eye_outlined:CupertinoIcons.eye_slash_fill, color: AppColor.AuthBoderColor,size: 20,),
                                onPressed: () {
                                  isVisible = !isVisible;

                                  setState(() {

                                  });



                                },

                              ),*/

                        ),
                      ),
                    ),
/*                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        TextButton(onPressed: (){
                          Get.to(ForgotPassword());
                        },
                          child:Text("Forgot your Password?",style: TextStyle(color: AppColor.White,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Montserrat"),),
                        ),
                      ],
                    ),*/
                    SizedBox(height: 30,),
                    Center(
                      child: Container(
                          width: double.infinity,
                          height: 47,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(AppColor.ButtonColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                )
                            ),
                            onPressed: () {
                              String uUsername = username.text;
                              String uPassword = password.text;

                              print('username:$uUsername,Pass: $uPassword');
                              /* if(username.text.isEmpty) {
                          showCustomSnackBar("Enter Username & password", getXSnackBar: true,isError: true);
                        }
                        else {
                        }*/
                              //Get.to(HomePage());

                            },
                            child:
                            Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Montserrat")),
                          )
                      ),
                    ),
                    SizedBox(height: 15,),
                    /*  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColor.White,
                      thickness: 0.8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or continue with",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColor.White,
                      thickness: 0.8,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text("Don’t have an account?",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,fontFamily:"Poppins")),
              SizedBox(height: 5,),
              Center(
                child: Container(
                    width: double.infinity,
                    height: 47,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColor.White),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          )
                      ),
                      onPressed: () {
                        Get.to(SignUp());
                      },
                      child: Text("Sign up",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                    )
                ),
              ),*/
                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
}
