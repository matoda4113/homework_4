import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/component/movie_list_card.dart';
import 'package:homework_4/controller/data_controller.dart';
import 'package:homework_4/pages/now_playing_screen.dart';
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
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

  List<String> tabList = ["현재 상영작","인기 영화","탑 영화","개봉 예정"];
  int currentPage = 0;

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

                SizedBox(
                  height: 40,
                  child: ListView.separated(

                    separatorBuilder: ((BuildContext context ,int index){
                      return SizedBox(width: 5);
                    }),
                      itemCount: tabList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context ,int index){
                    return GestureDetector(
                      onTap: () async{
                        pageController.animateToPage(
                          index, // 이동할 페이지 번호
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );

                        // pageController.
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color : currentPage==index?Colors.redAccent: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(tabList[index])),
                    );
                  }),
                ),

                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index){
                      setState(() {
                        currentPage = index;
                      });
                    },
                    // 페이지 목록
                    children: [
                      NowPlayingScreen(),
                      // 첫 번째 페이지
                      SizedBox.expand(
                        child: Container(
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'Page index : 0',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      // 두 번째 페이지
                      SizedBox.expand(
                        child: Container(
                          color: Colors.yellow,
                          child: Center(
                            child: Text(
                              'Page index : 1',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      // 세 번째 페이지
                      SizedBox.expand(
                        child: Container(
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              'Page index : 2',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      // 네 번째 페이지
                      SizedBox.expand(
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Page index : 3',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
