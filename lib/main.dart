
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crm/view/Lead/AddLeadView.dart';
import 'package:crm/view/Lead/ManageLead.dart';
import 'package:crm/view/customer/AddCustomer.dart';
import 'package:crm/view/customer/ManageCustomer.dart';
import 'package:crm/view/invoice/addInvoice.dart';
import 'package:crm/view/proposal/AddProposalView.dart';
import 'package:crm/window/LoginView.dart';
import 'package:crm/window/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appcomman/AppColor.dart';
import 'appcomman/AppFont.dart';
import 'appcomman/AppRoute.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light, // this will change the brightness of the icons
        statusBarColor: primary, // or any color you want
      ));
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() =>_MyApp();


}

class _MyApp extends State<MyApp> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((sp) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      setState((){});


    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LeadInSide",
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigationKey,
      theme: ThemeData(
        fontFamily: primaryFont,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
        ),

        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: primary
        )
      ),
      routes: {
        "/login": (BuildContext context) =>  const LoginView(),
        "/manageCustomer": (BuildContext context) =>  const ManageCustomer(),
        "/manageLead": (BuildContext context) =>  const ManageLead(),
        "/addLead": (BuildContext context) =>   AddLeadView(),
        "/addCustomer": (BuildContext context) =>  const AddCustomer(),
        "/addInvoice": (BuildContext context) =>  const AddInvoice(),
        "/addProposalView": (BuildContext context) =>  const AddProposalView(),

      },
      home:  AnimatedSplashScreen(
        splash: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Image.asset("images/logo.png"),
        ),
        splashIconSize: 180,
        curve: Curves.bounceIn,
        backgroundColor: primary,

        nextScreen: LoginView(),

      ),

    );
  }
}


