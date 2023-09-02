import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/controller/data_controller.dart';

import '../global/global.dart';

///MainPage
///담당자 : ---

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    logger.w("MainPage");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("MainPage")),
          body: Column(
            children: [
              GestureDetector(
                onTap: (){
                  controller.getMovieList();
                },
                child: Text("sarantest"),
              ),
              GestureDetector(
                onTap: (){

                  logger.e(controller.movieListModel?.toJson());
                },
                child: Text("call"),
              ),
              Container(
                child: Text("MainPage"),
              ),
            ],
          ),
        );
      }
    );
  }
}
