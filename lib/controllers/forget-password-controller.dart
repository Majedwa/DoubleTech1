// ignore_for_file: prefer_const_constructors, unused_field, non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dukanji2/screen/auth-ui/sign-in-screen.dart';
import 'package:dukanji2/utils/app-constant.dart';

class ForgetPasswordController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isPasswordVisible = false.obs;
  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please wait..");
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
          "Request sent Sucessfully", "Password reesr link sent to $userEmail",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondColor,
          colorText: AppConstant.apptextColor);
      Get.offAll(() => SigninScreen());
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondColor,
          colorText: AppConstant.apptextColor);
    }
  }
}
