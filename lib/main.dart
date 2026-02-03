import 'dart:async';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:td_crm/util/appImage.dart';
import 'package:td_crm/util/route_helper.dart';
import 'package:workmanager/workmanager.dart';
import 'Controller/AgentController/Authcontroller.dart';
import 'Screens/Auth/LoginPage.dart';
import 'Screens/Home/HomePage.dart';
import 'Screens/Home/MainHomePage.dart';
import 'Screens/Home/RoleDashboard/manager/HrUser.dart';
import 'Screens/Home/RoleDashboard/manager/hrDashboard.dart';
import 'util/get.di.dart' as di;

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((dynamic task, dynamic inputData) async {
    print('✅ Background Task Running...');

    try {
      final Iterable<CallLogEntry> callLogs = await CallLog.get();
      final filteredLogs = callLogs.where((entry) => entry.number == '+9190981444014');

      for (CallLogEntry entry in filteredLogs) {
        print('📞 NUMBER: ${entry.number}, NAME: ${entry.name}');
      }

      return Future.value(true);
    } catch (e, s) {
      print('❌ Error: $e');
      print(s);
      return Future.value(false);
    }
  });
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent background
      statusBarIconBrightness: Brightness.dark, // Dark icons
      statusBarBrightness: Brightness.light, // iOS compatibility
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(sharedPreferences); // Ensure this is registered first
  await di.init();
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // Debug mode on
  );

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState()=>_MyApp();


}

class _MyApp extends State<MyApp> {

  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    //authController = Get.find<AuthController>();
    if(authController.isLoggedIn()){
      Get.find<AuthController>().getProfile();
      //Get.find<AuthController>().GetDashboard(authController.profileResponse!.data!.type.toString());
    }
    SystemChannels.textInput.invokeMethod("TextInput.hide");
    Timer(Duration(seconds: 3), () {
      LoadingAnimationWidget.hexagonDots(
        color: Colors.black,
        size: 10,
      );
      if (authController.isLoggedIn()) {
        // Use the AuthController's GetDashboard method to handle navigation based on user type and role
        String userType = authController.Repo.getUserType().toLowerCase();
        authController.GetDashboard(userType);
      } else {
        Get.to(LoginPage(), transition: Transition.fadeIn, duration: Duration(milliseconds: 100));
      }

     // Get.to(LoginPage());
    },);
  }
  Future<void> _initializeApp() async {
    await Future.delayed(Duration(seconds: 2));

    final isLoggedIn = authController.isLoggedIn();

    if (!isLoggedIn) {
      Get.offAll(() => LoginPage());
      return;
    }

    try {
      await authController.getProfile();

      // If status is invalid, assume token expired or invalid
      if (authController.profileResponse == null ||
          authController.profileResponse!.status != "200") {
        // Clear stored token
        final prefs = Get.find<SharedPreferences>();
        await prefs.remove("token");

        Get.offAll(() => LoginPage());
      } else {
        // Token is valid
        Get.offAll(() => HomePage());
      }
    } catch (e) {
      // In case of any other error
      Get.offAll(() => LoginPage());
    }
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'TDCRM APP',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          );
        },
        getPages: RouteHelper.routes,
        navigatorKey: Get.key,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.black12
          ),
        ),

        // getPages: RouteHelper.routes,
        home: Container(

          child: Scaffold(
            //backgroundColor: Colors.white,
            body: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 1,
                  focal: Alignment.topCenter,
                  focalRadius: 0.5,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFF5F71CF),

                  ],
                  //stops: [0,1.0], // Position stops for each color
                ),),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset(
                      AppImage.splashLogo,
                      height: 80,
                      width: 150,
                    ),
                    SizedBox(height: 40,),

                    LoadingAnimationWidget.hexagonDots(
                      color: Colors.white,
                      size: 40, // Adjust size as needed
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
