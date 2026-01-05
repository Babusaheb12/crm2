import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';  // Temporarily commented out due to compatibility issues
import 'package:intl/intl.dart';


import 'AppColor.dart';
import 'AppFont.dart';



class AppUtil{

  static appLogs(Object msg){

    if(Foundation.kReleaseMode){
      // print(msg.toString()+'  RM');
    } else {
      print(msg.toString()+' DM');
    }
  }

  static showToast(String msg,String type){

    Color color= Colors.black;

    if(type=='s')
      {
        color=Colors.green;
      }
    else if(type=='e')
      {
        color=Colors.redAccent;
      }
    else if(type=='i')
    {
      color=Colors.orange;
    }

    // Using debugPrint instead of fluttertoast due to compatibility issues
    debugPrint('$type: $msg');
  }




 /* static double myContainerWidth(BuildContext context)
  {

    double width=0;

    if(Responsive.isDesktop(context))
      {
        width=MediaQuery.of(context).size.width / 3;
      }
    else if(Responsive.isTabletDesktop(context))
    {
      width=MediaQuery.of(context).size.width / 2;
    }
    else if(Responsive.isTablet(context))
    {
      width=MediaQuery.of(context).size.width / 1.2;
    }
    else{
      //mobile
      width=MediaQuery.of(context).size.width;
    }

    return width;
  }*/
  
  static textStyle() {

    return  TextStyle(fontFamily: primaryFont,color: greyColor,fontSize: 15);
  }

  static String changeDateFormat(String value, String inType, String outType)
  {
    if(value.isEmpty) {
      return '';
    }

    DateTime tempDate =  DateFormat(inType).parse(value);
    String date = DateFormat(outType).format(tempDate);

    return date;
  }


  static bool isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

/*  static int dashBoxCount(BuildContext context)
  {

    int count=0;

    if(Responsive.isDesktop(context))
    {
      //1100 se more
      count=5;
    }
    else if(Responsive.isTablet(context))
    {
      //650 se 1100
      count=4;
    }
    else{
      //650 se less
      //mobile
      count=3;
    }

    return count;
  }

  static double dashBoxRatio(BuildContext context)
  {

    double ratio=0;

    if(Responsive.isDesktop(context))
    {
      ratio=(1 / 0.7);
    }
    else if(Responsive.isTablet(context))
    {
      ratio=(1 / 0.9);
    }
    else{
      //mobile
      ratio=(1 /1.1 );
    }
    return ratio;
  }*/

  static fullWidth(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }
  static fullHeight(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }

  static   Widget notHaveService(String header,String subTitle)
  {
    return Center(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,

        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 22,),

            Image.asset("images/feeling.png",
              height: 308,fit: BoxFit.contain,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Text(header,
                style: TextStyle(fontSize: 18,color: redColor),),

            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Text(subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: greyColor),),
            ),

            SizedBox(height: 50,)
          ],
        ),

      ),
    );
  }

  static String getFormattedDateSimple(int time) {
    DateFormat newFormat = DateFormat("MMMM dd, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }







}