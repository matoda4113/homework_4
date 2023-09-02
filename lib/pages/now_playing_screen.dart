import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_4/controller/data_controller.dart';

import '../component/movie_list_card.dart';
import '../global/global.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({Key? key}) : super(key: key);

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  DataController dataController = Get.find<DataController>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logger.i("NowPlayingScreen");
    dataController.getNowPlayingMovieList(1);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (controller) {
        return GridView.builder(
            cacheExtent: 10000,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3/4
            ),

            itemCount: controller.nowPlayingList.length,
            itemBuilder: ((BuildContext context , int index){
              return MovieListCard(item: controller.nowPlayingList[index]);
            })
        );
      }
    );
  }
}
