import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/component/movie_list_card.dart';
import 'package:homework_4/controller/data_controller.dart';
import 'package:homework_4/pages/setting_page.dart';
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
    dataController.getMovieList();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("영화 리스트")),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.network('https://cdn.pixabay.com/photo/2023/05/02/21/08/river-7966163_1280.png',fit: BoxFit.cover,),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Get.to(()=>SettingPage());
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async{
                        await dataController.setType(1);
                        controller.getMovieList();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: controller.type ==1 ? Colors.redAccent : Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("현재 상영중")),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: ()async{
                        await dataController.setType(2);
                        controller.getMovieList();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: controller.type ==2 ? Colors.redAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("인기영화")),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: ()async{
                        await dataController.setType(3);
                        controller.getMovieList();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: controller.type ==3 ? Colors.redAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("탑 영화")),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: ()async{
                        await dataController.setType(4);
                        controller.getMovieList();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: controller.type ==4 ? Colors.redAccent : Colors.grey,
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
