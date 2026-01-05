import 'package:flutter/material.dart';

import '../../appcomman/AppColor.dart';
import '../../appcomman/AppFont.dart';
import '../../appcomman/AppUtil.dart';
import 'commentView.dart';

class ManageTaskView extends StatefulWidget {
  const ManageTaskView({super.key});

  @override
  State<ManageTaskView> createState() => _ManageTaskViewState();
}

class _ManageTaskViewState extends State<ManageTaskView> {
  List<String>sourceList = [ "Complete", "Incomplete"];
  List<bool> selectedSourceList = List.generate(10, (index) => false);

  String selectSource = 'Incomplete';
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
                        "Task",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: primaryFont,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: AppUtil.fullHeight(context)*0.06,),

                    getCustomerData()




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
    return ListView.builder(
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

          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CommentView(),));
                },
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
                                "Title",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: primary),
                              ),

                              SizedBox(height: 2,),
                              Text(
                                "Description",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(

                                    fontSize: 14,
                                    color: primary),
                              ),
                              SizedBox(height: 4,),
                              Text("12 Oct 23",style: TextStyle(color: Colors.black.withOpacity(0.6),
                                  fontFamily: primaryFont,fontWeight: FontWeight.w500,
                                  fontSize: 12)),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CommentView(),));
                                },
                                child: CircleAvatar(

                                  radius:15,
                                  backgroundColor: primary,
                                  child: Icon(Icons.comment,color: Colors.white,size: 15,),
                                ),
                              ),
                              SizedBox(width: 6,),


                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: selectedSourceList[index] ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
                    child: Text("Complete", style: TextStyle(color: Colors.green),),
                  ):
                  Checkbox(
                    value: selectedSourceList[index],
                    activeColor: primary,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedSourceList[index] = value!;
                      });

                    },)


              )
            ],
          ),
        );
      },);

  }
}
