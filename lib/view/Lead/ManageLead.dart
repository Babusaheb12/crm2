import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/appcomman/AppRoute.dart';
import 'package:crm/appcomman/AppUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../appcomman/AppFont.dart';

class ManageLead extends StatefulWidget {
  const ManageLead({Key? key}) : super(key: key);

  @override
  State<ManageLead> createState() => _ManageLeadState();
}

class _ManageLeadState extends State<ManageLead> {

  String balanceTypes = "";
  List<String>leadList = ["Nothing Lead","Customer"];
  String selectLead  = 'Nothing Lead';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Lead"),
      actions: [
        IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) refresh) {
                      return Dialog(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 3),
                                      child: Text("Lead Status*",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    ),
                                    Container(

                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: primary,width: 1)
                                      ),
                                      padding:const EdgeInsets.symmetric(horizontal: 10.0),

                                      child: DropdownButton(
                                        hint: Text("Lead Status",
                                          style: TextStyle(fontSize: 14,color: Color(0xFF3434348A),fontFamily: primaryFont),),
                                        dropdownColor: Colors.white,
                                        icon: Icon(Icons.arrow_drop_down,color: Color(0xFF000000),),
                                        iconSize: 25,
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: primaryFont),
                                        items: leadList.map((String language) {
                                          return  DropdownMenuItem<String>(
                                            child:  Text(language),
                                            value: language,
                                          );
                                        }).toList(),
                                        value: selectLead,
                                        onChanged: (String? value) {
                                          refresh(() {
                                            selectLead = value.toString();
                                          });
                                        },),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20,),

                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.1),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: primary),
                                child: Text("Apply",style: TextStyle(fontSize: 14,color: Colors.white),),
                              ),
                              SizedBox(height: 20,),

                            ],
                          ),
                        ),
                      );
                    },

                  );
                },
              );
              },
            icon: Icon(CupertinoIcons.color_filter,color: Colors.white,)),

        IconButton(
            onPressed: (){


            },
            icon: Icon(Icons.sort,color: Colors.white,))
      ],
      ),

      body: Column(
        children: [
          Expanded(child: getCustomerData())
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          NavigationService.instance.navigateTo("/addLead");
        },
        backgroundColor: primary,
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  Widget getCustomerData()
  {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: primary.withOpacity(0.6),width: 0.2)
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: primary,
                      child: Text("SJ"),
                    ),

                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sanjay Jangid",
                          style: TextStyle(

                              fontSize: 16,
                              color: primary),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "3 Edge Technologies",
                          style: TextStyle(

                              fontSize: 13,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  height: 0.4,
                  color: primary.withOpacity(0.4),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:  Text(
                      "Complete",
                      style: TextStyle(

                          fontSize: 13,
                          color: Colors.black.withOpacity(0.6)),
                    ),),
                    Expanded(
                      flex: 1,
                      child:  Text(
                        "12/06/2023",
                        style: TextStyle(

                            fontSize: 13,
                            color: Colors.black.withOpacity(0.6)),
                      ),)
                  ],
                )


              ],
            ),
          ),
        );
      },);
  }

  Widget getRowContainer(String title,String value)
  {
    return Row(
      children: [
        Expanded(
          flex:10,
          child: Text(
            title,
            style: TextStyle(

                fontSize: 16,
                color: Colors.grey),
          ),
        ),
        Expanded(
          flex:1,
          child: Text(
            ":",
            style: TextStyle(

                fontSize: 13,color: Colors.grey),
          ),
        ),
        Expanded(
          flex:17,
          child: Text(
            value,
            style: TextStyle(

                fontSize: 16,
                color: primary),
          ),
        ),
      ],
    );
  }


  void _showFilterDialog() {

    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                decoration:  const BoxDecoration(
                  borderRadius:  BorderRadius.all( Radius.circular(8.0)),
                ),
                padding: const EdgeInsets.only(top: 35,right: 20),
                child:  Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight:  Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        topLeft: Radius.circular(8),
                        topRight:  Radius.circular(8)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);



                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8,left: 10,bottom: 8),
                            child: Text('Lead Status 1',
                              style: TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),),
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);

                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8,left: 10,bottom: 8),
                            child:  Text('Lead Status 2',
                              style:  TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),),
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);


                          },
                          child: const Padding(
                            padding:  EdgeInsets.only(top: 8,left: 10,bottom: 8),
                            child:  Text('Lead Status 3',
                              style:  TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),),
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);


                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8,left: 10,bottom: 8),
                            child:  Text('Lead Status 4',
                              style: TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),),
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);

                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8,left: 10,bottom: 8),
                            child:  Text('Total',
                              style:  TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),),
                          ),
                        ),



                      ],

                    ),
                  ),
                )
            )
          ],
        );
      },
    );

  }
}
