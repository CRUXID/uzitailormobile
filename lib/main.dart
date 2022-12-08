import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uzitailor/pages/pages.dart';
import 'package:uzitailor/pref/user_pref.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: RememberUserPrefs.readUserInfo(),
            builder: (context, dataSnapShot) {
              if (dataSnapShot.data == null) {
                return WelcomePage();
              } else {
                return Home();
              }
            }));
  }
}
