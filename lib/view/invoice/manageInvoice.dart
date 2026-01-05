import 'package:flutter/material.dart';
import 'package:crm/appcomman/AppColor.dart';
import 'package:crm/appcomman/AppFont.dart';
import 'package:crm/appcomman/AppRoute.dart';
import 'package:crm/appcomman/AppUtil.dart';
import 'package:dots_indicator/dots_indicator.dart';

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:syncfusion_flutter_charts/charts.dart';

class ManageInvoice extends StatefulWidget {
  const ManageInvoice({super.key});

  @override
  State<ManageInvoice> createState() => _ManageInvoiceState();
}

class _ManageInvoiceState extends State<ManageInvoice> {
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
                        "Invoice",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: primaryFont,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: AppUtil.fullHeight(context)*0.06,),
                    getCustomerData()



                    /* Container(
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(

                          aspectRatio: 1.0,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: [
                          _buildChart(),
                          estimateContainer(),
                          proposalContainer()
                        ],
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        activeColor: primary
                      ),

                      position: currentIndex,
                    ),*/

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
          NavigationService.instance.navigateTo("/addInvoice");
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
        return Card(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Invoice No",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: primary),
                                ),

                                Text(
                                  "Due Date",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                              ],
                            ),

                            SizedBox(height: 2,),
                            Text(
                              "Customer Name",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [


                            CircleAvatar(
                              radius:15,
                              backgroundColor: primary,
                              child: Icon(Icons.edit,color: Colors.white,size: 15,),
                            ),
                            SizedBox(width: 6,),
                            CircleAvatar(
                              radius:15,
                              backgroundColor: primary,
                              child: Icon(Icons.remove_red_eye_rounded,color: Colors.white,size: 15,),
                            )

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
                    child: Text("Unpaid",style: TextStyle(color: Colors.white),)),
              ) else Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))
                    ),
                    child: Text("Paid",style: TextStyle(color: Colors.white),)),
              )
            ],
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

  Widget headerContainer()
  {
    return  Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("images/logo.png",height: 30,),

              Icon(Icons.logout,color: Colors.white,)
            ],
          ),
          SizedBox(height: 4,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
}
