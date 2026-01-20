
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import '../../util/custom_snackbar.dart';
import 'HomePage.dart';

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController mob1 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController source = TextEditingController();
  TextEditingController Skype = TextEditingController();
  TextEditingController Comment = TextEditingController();

  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF223e6d),
          title: Text("Add Client",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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

        body: GetBuilder<AuthController>(builder: (authController) {
      return
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.Background
        ),

          child: SingleChildScrollView(
          child: SafeArea(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Text("Name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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

    hintText: "Enter Name",
    hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


    ),
    ),
    ),
    SizedBox(height: 10,),
    Text("Mobile Number",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
    SizedBox(height: 5,),
    Container(
    width: double.infinity,
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
      Text("New Mobile Number",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color: AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
      SizedBox(height: 5,),
      Container(
        width: double.infinity,
        height: 36,
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(10),
          color: AppColor.White,

        ),
        child: TextField(
          controller : mob1,
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

              hintText: "Enter New Mobile Number",
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
    Text("New Email",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color: AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
    SizedBox(height: 5,),
    Container(
    width: double.infinity,
    height: 36,
    decoration: BoxDecoration(
    borderRadius:  BorderRadius.circular(10),
    color: AppColor.White,

    ),
    child: TextField(
    controller : email1,
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

    hintText: "Enter New Email",
    hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


    ),
    ),
    ),
    SizedBox(height: 10,),
    Text("Location(City)",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:  AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
    SizedBox(height: 5,),
    Container(
    width: double.infinity,
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
    Text("Source",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
    SizedBox(height: 5,),
    Container(
    width: double.infinity,
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
    Text("Skype Id",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
    SizedBox(height: 5,),
    Container(
    width: double.infinity,
    height: 36,
    decoration: BoxDecoration(
    borderRadius:  BorderRadius.circular(10),
    color: AppColor.White,

    ),
    child: TextField(
    controller : Skype,
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
    hintText:"Enter Skype Id",
    hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")



                              ),
                            ),
                          ),
      SizedBox(height: 10,),
    Text("Remark And Comment",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
    SizedBox(height: 5,),
    Container(
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius:  BorderRadius.circular(10),
    color: AppColor.White,

    ),
    child: TextField(
    controller : Comment,
    cursorColor:AppColor.AuthhintColor,
    minLines: 3,
    maxLines: 3,
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
    hintText:"Enter Remark And Comment",
    hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")



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
                                      backgroundColor: MaterialStateProperty.all(AppColor.ButtonColor2),
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
                                    else{
                                      authController.GetAddClient(
                                           name: name.text,
                                        email: email.text,
                                        new_email: email1.text,
                                        mobile: mob.text,
                                        new_mobile: mob1.text,
                                        location: location.text,
                                        comment: Comment.text,
                                        skype: Skype.text,
                                        source: source.text,

                                      );

                                    }
                                  },

                                  child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                                )
                            ),
                          ),

                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        );})


    );
  }
}