import 'dart:io';

import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/appcomman/AppFont.dart';
import 'package:crm/appcomman/AppRoute.dart';
import 'package:crm/appcomman/AppUtil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Helper/CircularChart.dart';
// import 'package:carousel_slider/carousel_slider.dart'; // Temporarily removed due to compatibility issues
// import 'package:syncfusion_flutter_charts/charts.dart'; // Temporarily removed due to compatibility issues
// import 'package:syncfusion_flutter_charts/sparkcharts.dart'; // Temporarily removed due to compatibility issues

import 'Lead/detail.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {

  List<String>chartTitle = ["Invoice Overview","Estimate Overview","Proposal Overview"];
  int currentIndex = 0;

  final List<DataPoint> chartData = [
    DataPoint('Category 1', 30, primary),
    DataPoint('Category 2', 50, Colors.orange),
    DataPoint('Category 3', 20, Colors.red),
  ];
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
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35))
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // headerContainer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Leads",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: primaryFont,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: AppUtil.fullHeight(context)*0.06,),
                    getCustomerData(),



                    SizedBox(height: 10,), // Placeholder for charts


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
          NavigationService.instance.navigateTo("/addLead");
        },
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
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceDetail(),));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: primary.withOpacity(0.6),width: 0.2)
            ),
            child: Stack(
              children: [
                Padding(
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
                                "Name",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: primary),
                              ),

                              SizedBox(height: 2,),
                              Text(
                                "Company Name",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(

                                    fontSize: 14,
                                    color: primary),
                              ),

                              SizedBox(height: 2,),
                              Text(
                                "1234567890",
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
                                    onTap:(){
                                      _makePhoneCall('1234567890');
                                    },
                                    child: CircleAvatar(
                                      radius:15,
                                      backgroundColor: Colors.blue,
                                      child: Icon(Icons.call,color: Colors.white,size: 15,),
                                    ),
                                  ),
                                  SizedBox(width: 10,),


                                      InkWell(
                                          onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => whatsapp()));

                                    },
                                    child: CircleAvatar(
                                      radius:15,
                                      backgroundColor: Colors.blue,
                                      child: Image.asset("images/whatsapp.png")
                                    ),
                                  ),



                                ],
                              ),
                              SizedBox(height: 6,),
                              Text(
                                "12 june 23 6:10 am",
                                style: TextStyle(

                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.4)),
                              ),

                            ],
                          ))
                    ],
                  ),
                ),

                if (index.isEven) Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))
                      ),
                      child: Text("Pending",style: TextStyle(color: Colors.white),)),
                ) else Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))
                      ),
                      child: const Text("Complete",style: TextStyle(color: Colors.white),)),
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
            style: const TextStyle(

                fontSize: 16,
                color: Colors.grey),
          ),
        ),
        const Expanded(
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

  Widget headerContainer()
  {
    return  Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("images/logo.png",height: 30,),

              const Icon(Icons.logout,color: Colors.white,)
            ],
          ),
          const SizedBox(height: 4,),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Leads",
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: primaryFont,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        height: 200,
        child: Center(
          child: Text(
            'Invoice Overview Chart',
            style: TextStyle(
              fontSize: 16,
              color: primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget estimateContainer() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        height: 200,
        child: Center(
          child: Text(
            'Estimate Overview Chart',
            style: TextStyle(
              fontSize: 16,
              color: primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget proposalContainer() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        height: 200,
        child: Center(
          child: Text(
            'Proposal Overview Chart',
            style: TextStyle(
              fontSize: 16,
              color: primary,
            ),
          ),
        ),
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  whatsapp() async{
    var contact = "1234567890";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hii, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    {
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    }
  }
}