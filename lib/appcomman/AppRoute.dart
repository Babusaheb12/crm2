import 'package:flutter/material.dart';

class NavigationService {

  GlobalKey<NavigatorState> navigationKey =  GlobalKey<NavigatorState>();

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _rn) {
    return navigationKey.currentState!.pushReplacementNamed(_rn);
  }

  Future<dynamic> navigateTo(String _rn) {
    return navigationKey.currentState!.pushNamed(_rn);
  }

  Future<dynamic> navigatePopAndPushNamed(String _rn) {
    return navigationKey.currentState!.popAndPushNamed(_rn);
  }

  Future<dynamic> navigatePopAndPushNamedVal(String _rn, String value,var data) {
    return navigationKey.currentState!.popAndPushNamed(_rn, arguments: {'arg': value,'data': data});
  }

  Future<dynamic> navigateToArg(String _rn, String value) {
    return navigationKey.currentState!.pushNamed(_rn, arguments: {'arg': value});
  }

  Future<dynamic> navigateToArgVal(String _rn, String value, var data) {
    return navigationKey.currentState!.pushNamed(_rn, arguments: {'arg': value, 'data': data});
  }

  Future<dynamic> navigateToArgValueVal(String _rn, String value, var data,var type) {
    return navigationKey.currentState!.pushNamed(_rn, arguments: {'arg': value, 'data': data, 'type':type});
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn) {
    return navigationKey.currentState!.push(_rn);
  }

  goBack() {
    return navigationKey.currentState!.pop();
  }
}