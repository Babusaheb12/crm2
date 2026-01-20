
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Repo/DashboardRepo.dart';



class DashController extends GetxController implements GetxService{


  DataRepo Repo;

  DashController({required this.Repo});


  bool isLoading = false;
  int currentIndex = 0;


  updateIndex(int index){

    currentIndex = index;
    print("currentIndex=>$currentIndex");


    update();
  }
}



