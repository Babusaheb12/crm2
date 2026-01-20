
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../util/appColor.dart';
import '../../util/custom_snackbar.dart';
import 'HomePage.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController mob1 = TextEditingController();
  TextEditingController Sdate = TextEditingController();
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text("ToDo List",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
      floatingActionButton: SizedBox(
        height: 40,
        child: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColor.ButtonColor2, // Title Background Color
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child:   Row(

                            children: [
                              Expanded(child: Center(child: Text("New Task",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color:Colors.white,fontFamily:"Montserrat")))),
                              // Spacer(),
                              SizedBox(width: 10,),
                              InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                    child: Text("X",style: TextStyle(color: Colors.white,fontSize: 18),),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" Person Name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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
                              Text(" Task Date",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
                              SizedBox(height: 5,),
                              Container (
                                width: double.infinity,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:  BorderRadius.circular(10),

                                ),
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
                              Text(" Task Name",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color:AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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

                                      hintText: "Enter Task Name",
                                      hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(" Task Note",style: TextStyle(fontSize: 14,fontStyle: FontStyle.normal,color: AppColor.Black,fontWeight: FontWeight.w600,fontFamily:"Poppins"),),
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

                                      hintText: "Enter Note",
                                      hintStyle: TextStyle(fontSize: 14,color:AppColor.AuthhintColor,fontFamily:"Poppins")


                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),
                        Center(
                          child: Container(
                              width: 100,
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

                                  else if (mob.text.isEmpty) {
                                    showCustomSnackBar(
                                        "All Feild Required", getXSnackBar: false,
                                        isError: true);
                                  }

                                  else{

                                  }
                                },

                                child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          label: Text("ToDo ",style: TextStyle(color: AppColor.White,fontSize: 14,fontWeight: FontWeight.w500,fontFamily:"Poppins")),
          icon: Icon(Icons.add_circle_outline,color: AppColor.White,size: 20,),
          backgroundColor: AppColor.ButtonColor2,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
