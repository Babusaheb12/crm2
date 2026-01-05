import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/appcomman/AppFont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appcomman/AppVariable.dart';
import '../view/Home.dart';
import '../view/dashBoard.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool show = true;
  bool isLoggingIn = false;

  final TextEditingController _emailController =
  TextEditingController(text: '');
  final TextEditingController _passwordController =
  TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: primary,
          gradient: LinearGradient(
              colors: [
                primary,
                Colors.white,

                //add more colors for gradient
              ],
              begin: Alignment.topCenter, //begin of the gradient color
              end: Alignment.bottomCenter, //end of the gradient color
              stops: [0.5, 0.5] //stops for individual color
            //set the stops number equal to numbers of color
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("images/logo.png",height: 60,),
                ),
              ),

              SizedBox(height: 30,),

              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                  color:Colors.white,
                ),
                margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1,left: 15,right: 15),


                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16,top: 10),
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: primaryFont, fontSize: 26,color: primary),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primary,),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              prefixIcon:  Icon(CupertinoIcons.mail,
                                  color: primary),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontFamily: primaryFont, color: Colors.grey, fontSize: 14)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                        child: TextField(
                          controller: _passwordController,
                          cursorColor: Colors.black,
                          obscureText: show,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primary,),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              suffixIcon: show
                                  ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      show = false;
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.eye_slash,
                                    color: Colors.black,
                                  ))
                                  : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      show = true;
                                    });
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.eye,
                                    color: Colors.black,
                                  )),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                              prefixIcon:  Icon(CupertinoIcons.lock,
                                  color: primary),
                              label: Text(
                                "Password",
                                style:
                                TextStyle(fontFamily: primaryFont, fontSize: 14),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {

                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashBoard(),), (route) => false);

                        },
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 0),
                            height: 40,
                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontFamily: primaryFont,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 14),
                        child: Column(
                          children: [
                            InkWell(
                                onTap:(){
                                  // AppUntill.webUrl();
                                },
                                child: Image.asset("images/company_logo.png",height: 45,)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Developed by",style: TextStyle(fontSize: 16,color: primary),),
                                SizedBox(width: 6,),
                                InkWell(
                                    onTap: (){
                                      // AppUntill.webUrl();
                                    },
                                    child: Text("3Edge Technologies",style: TextStyle(fontSize: 16,color: Color(0xFFF7941E)),)),

                              ],
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),


              ),

            ],
          ),
        ),
      ),
    );
  }
}
