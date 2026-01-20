

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/AgentController/Authcontroller.dart';
import '../Controller/DashboardController.dart';
import '../Repo/AgentRepo/Authrepo.dart';
import '../Repo/DashboardRepo.dart';
import '../api/api.dart';
import '../api/api_client.dart';




Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: ApiUrls.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => DashController(Repo: Get.find()));
  Get.lazyPut(() => AuthController(Repo: Get.find()));



  Get.lazyPut(() => DataRepo( sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo( sharedPreferences: Get.find(), apiClient: Get.find()));


}
