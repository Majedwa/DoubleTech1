// ignore_for_file: file_names, avoid_print

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationController extends GetxController {
  TextEditingController codeController = TextEditingController();

  // دالة للتحقق من رمز التحقق
  Future<bool> verifyCode(String verificationId, String code) async {
    try {
      // إنشاء Credential للتحقق من الرمز المدخل
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
      
      // التحقق من الرمز باستخدام Credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // في حال نجاح التحقق
      return true;
    } catch (e) {
      // في حال حدوث خطأ
      print("Error verifying code: $e");
      return false;
    }
  }
}
