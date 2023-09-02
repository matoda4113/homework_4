import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/data_controller.dart';
import 'global/global.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DataController());


  prefs = await SharedPreferences.getInstance();

  if(prefs.getString('language')==null){
    await prefs.setString('language', "ko-KR");
  }


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        home: MainPage()
    );
  }
}
