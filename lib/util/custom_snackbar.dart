import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String? message, {bool isError = true, bool getXSnackBar = false}) {
  if (message != null && message.isNotEmpty) {
    if (getXSnackBar) {
      Get.snackbar(
        isError ? 'Error ❌' : 'Success 🎉', // Title
        message, // Message
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.transparent,
        colorText: Colors.white,
        margin: EdgeInsets.all(12),
        borderRadius: 12,
        duration: Duration(seconds: 2),
        icon: Icon(
          isError ? Icons.error : Icons.check_circle,
          color: Colors.white,
          size: 32,
        ),
        shouldIconPulse: true,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        barBlur: 10,
        overlayBlur: 2,
        overlayColor: Colors.black.withOpacity(0.2),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        snackStyle: SnackStyle.FLOATING,
        backgroundGradient: LinearGradient(
          colors: isError ? [Colors.redAccent, Colors.orangeAccent] : [Colors.blueAccent, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );
    } else if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.horizontal,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2),
          backgroundColor: isError ? Colors.redAccent : Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    }
  }
}
