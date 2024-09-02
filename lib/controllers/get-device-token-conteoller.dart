// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:dukanji2/utils/app-constant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        print("token :$deviceToken");
        update();
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondColor,
          colorText: AppConstant.apptextColor);
    }
  }
}
