// ignore_for_file: prefer_const_constructors, use_super_parameters, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dukanji2/firebase_options.dart';
import 'package:dukanji2/screen/auth-ui/spalch.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // استيراد Firebase Messaging

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get the device token when the app starts
  await getToken();

  runApp(MyApp());
}  

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplachScreen(), 
      builder: (BuildContext context, Widget? child) {
        return EasyLoading.init()(context, child);
      },
    );
  }
}

Future<void> getToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  print("Device Token: $token");
}
