
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/AgentController/Authcontroller.dart';
import '../../util/appColor.dart';
import '../../util/appImage.dart';

class AllComment extends StatefulWidget {
  final Id;
  final Status;
  const AllComment({super.key, this.Id, this.Status});

  @override
  State<AllComment> createState() => _AllCommentState();
}

class _AllCommentState extends State<AllComment> {
  @override
  final AuthController authController = Get.find<AuthController>();
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
   // await authController.GetAllcomments(client_id: widget.Id.toString());

      setState(() {

      });
    });
  }

  TextEditingController Comment = TextEditingController();
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF223e6d),
        title: Text("All Comment",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
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
              Padding(
                padding: const EdgeInsets.only(bottom:50),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:authController.allCommentResponse!.data!.length??0,
                  itemBuilder: (context, index) {
                    int durationInSec = int.tryParse(authController.allCommentResponse!.data![index].callDurationInSecond ?? '0') ?? 0;
                    int minutes = durationInSec ~/ 60;
                    int seconds = durationInSec % 60;
                    return InkWell(
                      onTap: (){
                        //Get.to(ClientProfile());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          authController.allCommentResponse!.data![index].callingPlatform.toString()=="call"||authController.allCommentResponse!.data![index].callingPlatform.toString()=="whatsapp"||authController.allCommentResponse!.data![index].callingPlatform.toString()=="gmail"?
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
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
                                       /* authController.allCommentResponse!.data![index].clientName!.toString()!=null && authController.allCommentResponse!.data![index].clientName!.isNotEmpty?
                                        Text(authController.allCommentResponse!.data![index].clientName.toString(),style:TextStyle(color: AppColor.AuthhintColor,fontSize: 15,fontWeight: FontWeight.w600),):SizedBox.shrink(),
                                        Text(authController.allCommentResponse!.data![index].clientMobile.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),),
                                        authController.allCommentResponse!.data![index].clientEmail !=null && authController.allCommentResponse!.data![index].clientEmail!.isNotEmpty?
                                        Text(authController.allCommentResponse!.data![index].clientEmail.toString(),style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),):SizedBox.shrink(),*/
                                        Row(
                                          children: [
                                            authController.allCommentResponse!.data![index].callDurationInSecond !=null && authController.allCommentResponse!.data![index].callDurationInSecond!.isNotEmpty?
                                            Text("Duration: ${minutes} min ${seconds} sec",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start):SizedBox.shrink(),
                                           /* authController.allCommentResponse!.data![index].callingType !=null && authController.allCommentResponse!.data![index].callingType!.isNotEmpty?
                                            Row(
                                              children: [
                                               // Text("",style:TextStyle(color: AppColor.Black,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                                if(authController.allCommentResponse!.data![index].callingType.toString()=="Missed")
                                                  Image.asset(AppImage.missedcall,fit: BoxFit.fill,height:15,),
                                                  //Text("Missed",style:TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                                if(authController.allCommentResponse!.data![index].callingType.toString()=="Outgoing")
                                                  Image.asset(AppImage.outgoingcall,fit: BoxFit.fill,height:15,),
                                                //Text("Outgoing",style:TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                                if(authController.allCommentResponse!.data![index].callingType.toString()=="Incoming")
                                                  Image.asset(AppImage.incomingcall,fit: BoxFit.fill,height:15,),

                                                //Text("Incoming",style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                              ],
                                            ):SizedBox.shrink(),*/
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Date & Time: ${authController.allCommentResponse!.data![index].callingDate.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.start),
                                            Text(" ${authController.allCommentResponse!.data![index].callingTime.toString()}",style:TextStyle(color: AppColor.Black,fontSize: 13,fontWeight: FontWeight.w500),textAlign: TextAlign.start),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  if(authController.allCommentResponse!.data![index].callingType.toString()=="Missed")
                                    Image.asset(AppImage.missedcall,fit: BoxFit.fill,height:15,)
                                  //Text("Missed",style:TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                                  else if(authController.allCommentResponse!.data![index].callingType.toString()=="Outgoing")
                                    Image.asset(AppImage.outgoingcall,fit: BoxFit.fill,height:15,)
                                  //Text("Outgoing",style:TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w400),textAlign: TextAlign.start),
                        else if(authController.allCommentResponse!.data![index].callingType.toString()=="Incoming")
                                    Image.asset(AppImage.incomingcall,fit: BoxFit.fill,height:15,)
                                    /*else  if(authController.allCommentResponse!.data![index].callingPlatform.toString()== "call")
                                    Image.asset(AppImage.telephone,fit: BoxFit.fill,height:25,)*/
                                  else if(authController.allCommentResponse!.data![index].callingPlatform.toString()== "whatsapp")
                                    Image.asset(AppImage.Whatsapp,fit: BoxFit.fill,height:25,)
                                  else if(authController.allCommentResponse!.data![index].callingPlatform.toString()== "gmail")
                                      Image.asset(AppImage.gmail,fit: BoxFit.fill,height:25,)

                                ],
                              ),
                              SizedBox(height: 0,),


                            ],
                          ),
                        ),
                      ):SizedBox.shrink(),
                          authController.allCommentResponse!.data![index].callingPlatform.toString()=="comments"?
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                       /* RichText(
                                          text: new TextSpan(
                                              text: 'by ',
                                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                              children: <TextSpan>[
                                                new TextSpan(
                                                  text: authController.allCommentResponse!.data![index].commentAgentName.toString(),
                                                  style: TextStyle(color: AppColor.ButtonColor2,fontSize: 16,fontWeight: FontWeight.w500),
                                                )]
                                          ),),
                                        SizedBox(height: 3,),*/
                                        Text(authController.allCommentResponse!.data![index].comment.toString(),style:TextStyle(color: AppColor.Black,fontSize: 14,fontWeight: FontWeight.w300,fontStyle: FontStyle.italic),),
                                        SizedBox(height: 3,),
                                        Text(authController.allCommentResponse!.data![index].commentDate.toString(),style:TextStyle(color: AppColor.Black,fontSize: 13,fontWeight: FontWeight.w500,),),
                                        //Text("09:12 PM",style:TextStyle(color: AppColor.Black,fontSize: 10,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ):SizedBox.shrink(),
                          SizedBox(height: 8,)
                        ],
                      ),
                    );
                  },
                ),
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
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (Comment.text.trim().isEmpty) return;

                    // Step 1: Add new comment via API
                    await authController.GetAddComment(
                      comment: Comment.text,
                      client_id: widget.Id.toString(),
                    );

                    // Step 2: Clear comment box
                    Comment.clear();

                    // Step 3: Fetch updated comments
                    await authController.GetAllcomments(client_id: widget.Id.toString());
                    /*await authController.GetAllClient(
                      name: '',
                      fname: '',
                      mobile: '',
                      email: '',
                      from_date: '',
                      to_date: '',
                      last_date: '',
                      search: '',
                      status: widget.Id.toString()??"",
                      location: '',
                      source: '',
                      limit: '10000',
                      offset: '0',
                      agent_id: '',

                    );
                    await authController.GetFlowupClient(
                      name: '',
                      mobile: '',
                      email: '',
                      from_date: '',
                      to_date: '',
                      last_date: '',
                      search:  "",
                      status: '',
                      location: '',
                      source: '',
                      limit: '10000', // fetch all for pagination
                      offset: '0',
                      agent_id: '',
                    );*/
                    // ✅ Step 4: Rebuild UI with new data
                    setState(() {});
                  },
                  child: Icon(
                    Icons.send,
                    color: AppColor.ButtonColor2,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
