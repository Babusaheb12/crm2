import 'package:flutter/material.dart';

import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/appcomman/AppFont.dart';
import 'package:crm/appcomman/AppRoute.dart';
import 'package:crm/appcomman/AppUtil.dart';
import 'package:flutter/material.dart';

class ManageProposalView extends StatefulWidget {
  const ManageProposalView({super.key});

  @override
  State<ManageProposalView> createState() => _ManageProposalViewState();
}

class _ManageProposalViewState extends State<ManageProposalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 8,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("images/logo.png", height: 30,),
            Icon(Icons.logout, color: Colors.white,),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: AppUtil.fullHeight(context) * 0.2,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Proposals",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: primaryFont,
                          color: Colors.white),
                      ),
                    ),
                    SizedBox(height: AppUtil.fullHeight(context) * 0.06,),
                    getProposalData(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        shape: const RoundedRectangleBorder( // <= Change BeveledRectangleBorder to RoundedRectangularBorder
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        backgroundColor: primary,

        onPressed: (){
          NavigationService.instance.navigateTo("/addProposalView");
        },
      ),
    );
  }

  Widget getProposalData() {
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
                          "Proposal #${index + 1}",
                          style: TextStyle(
                            fontSize: 16,
                            color: primary),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          "Client Name",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: primary),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          "Rs. ${(index + 1) * 5000}/-",
                          style: TextStyle(
                            fontSize: 14,
                            color: primary),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: CircleAvatar(
                              radius:15,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.edit,color: Colors.white,size: 15,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){},
                            child: CircleAvatar(
                              radius:15,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.remove_red_eye_rounded,color: Colors.white,size: 15,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6,),
                      Text(
                        "${DateTime.now().day} ${DateTime.now().month == DateTime.now().month ? 'Today' : 'Yesterday'} ${DateTime.now().hour}:${DateTime.now().minute} am",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.4)),
                      ),
                    ],
                  )),
              ],
            ),
          ),
        );
      },
    );
  }
}
