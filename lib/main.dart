import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/pages/main_page.dart';

import 'controller/data_controller.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DataController());
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
