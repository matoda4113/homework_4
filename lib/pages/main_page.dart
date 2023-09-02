import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/component/movie_list_card.dart';
import 'package:homework_4/controller/data_controller.dart';

import '../controller/data_controller.dart';
import '../global/global.dart';

///MainPage
///담당자 : ---

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  DataController dataController = Get.find<DataController>();

  @override
  void initState() {
    super.initState();
    logger.w("MainPage");
    dataController.getMovieList(type);
  }

  int type = 1;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("영화 리스트")),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          type = 1;
                        });
                        controller.getMovieList(type);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: type ==1 ? Colors.redAccent : Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("현재 상영중")),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){

                        setState(() {
                          type = 2;
                        });
                        controller.getMovieList(type);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: type ==2 ? Colors.redAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("인기영화")),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          type = 3;
                        });
                        controller.getMovieList(type);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: type ==3 ? Colors.redAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("탑 영화")),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          type = 4;
                        });
                        controller.getMovieList(type);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: type ==4 ? Colors.redAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("개봉 예정")),
                    ),

                  ],
                ),
                if(controller.movieListModel!=null &&controller.movieListModel?.results != null)
                Expanded(
                  child: GridView.builder(
                    cacheExtent: 10000,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3/4
                    ),

                    itemCount: controller.movieListModel!.results!.length,
                      itemBuilder: ((BuildContext context , int index){
                        return MovieListCard(item: controller.movieListModel!.results![index]);
                      })
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
