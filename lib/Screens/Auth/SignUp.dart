/*
import 'package:crmtd/Screens/Auth/LoginPage.dart';
import 'package:crmtd/util/appColor.dart';
import 'package:crmtd/util/appImage.dart';
import 'package:crmtd/util/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController referenceno = TextEditingController();
  String selectSource2 = 'Select';
  List<String>sourceList2 = ["Partner", "Corporation"];
  String? selectedGender2;
  final Map<String, String> genderMapping = {
    "Partner": "1",
    "Corporation": "2",
  };
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

          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),

                  Center(
                    child: Image.asset(
                      AppImage.splashLogo,
                      height: 80,
                      width: 200,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text("First name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
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

                                  hintText: "First name",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Last name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : name1,
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

                                  hintText: "Last name",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Email",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
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
                          Text("Phone number",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color: AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : dob,
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

                                  hintText: "Phone number",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Password",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : password,
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

                                  hintText: "Password",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Confirm password",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                          SizedBox(height: 5,),
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              color: AppColor.White,

                            ),
                            child: TextField(
                              controller : password1,
                              cursorColor:AppColor.AuthhintColor,

                              obscuringCharacter: '*',
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
                                hintText:"Confirm Password",
                                  hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")
                                */
/*suffixIcon: IconButton(
                                    icon: Icon(isVisible ? Icons.remove_red_eye_outlined:CupertinoIcons.eye_slash_fill, color: AppColor.AuthBoderColor,size: 20,),
                                    onPressed: () {
                                      isVisible = !isVisible;

                                      setState(() {

                                      });



                                    },

                                  ),*//*


                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Center(
                            child: Container(
                                width: double.infinity,
                                height: 46,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(AppColor.Black),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )
                                      )
                                  ),
                                  onPressed: () {
                                    if (name.text.isEmpty) {
                                      showCustomSnackBar(
                                          "All Feild Required", getXSnackBar: false,
                                          isError: true);
                                    }
                                    else if (dob.text.isEmpty) {
                                      showCustomSnackBar(
                                          "All Feild Required", getXSnackBar: false,
                                          isError: true);
                                    }
                                    else if (email.text.isEmpty) {
                                      showCustomSnackBar(
                                          "All Feild Required", getXSnackBar: false,
                                          isError: true);
                                    }
                                    else if (password.text.isEmpty) {
                                      showCustomSnackBar(
                                          "All Feild Required", getXSnackBar: false,
                                          isError: true);
                                    }
                                    else if (referenceno.text.isEmpty) {
                                      // authController.TruckReferenceNo(truck_refrence_number:referenceno.text );
                                      showCustomSnackBar(
                                          "All Feild Required", getXSnackBar: false,
                                          isError: true);
                                    }
                                    else{

                                    }
                                  },

                                  child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                                )
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,fontFamily:"Poppins")),
                              SizedBox(height: 5,),
                              InkWell(
                                  onTap: (){
                                    Get.to(() => LoginPage());
                                  },
                                  child: Text("Sign in",style: TextStyle(color: AppColor.White,fontSize: 18,fontWeight: FontWeight.bold,fontFamily:"Poppins"))),
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        )


    );
  }

}
*/
