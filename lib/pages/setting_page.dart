import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/controller/data_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/global.dart';

///SettingPage
///담당자 : ---

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  void initState() {
    super.initState();
    logger.w("SettingPage");
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("SettingPage")),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("언어선택"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async{
                        await prefs.setString('language', "ko-KR");
                        // controller.getMovieList();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: prefs.getString('language') =="ko-KR"?Colors.redAccent:Colors.grey
                          ),
                          child: Text("한국어")),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () async{
                        await prefs.setString('language', "en-US");
                        // controller.getMovieList();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: prefs.getString('language') =="en-US"?Colors.redAccent:Colors.grey
                          ),
                          child: Text("영어")),
                    ),
                  ],
                ),


              ],
            ),
          ),
        );
      }
    );
  }
}
