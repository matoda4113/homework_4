import 'package:get/get.dart';

import '../global/http_service.dart';
import '../model/movie_list_model.dart';




///Datacontroller
///담당자 : saran

class DataController extends GetxController {

  final HttpService httpService = HttpService();

  MovieListModel? movieListModel;

  int type = 1;

  Future<void> setType(int tab) async{
    type = tab;
    update();
  }

  Future<bool> getMovieList() async{

    String stringType = "now_playing";
    switch(type){
      case 1 :
        stringType = "now_playing";
        break;
      case 2 :
        stringType = "popular";
        break;
      case 3 :
        stringType = "top_rated";
        break;
      case 4 :
        stringType = "upcoming";
        break;
    }

    try {

      MovieListModel info = await httpService.getMovieList(stringType);
      movieListModel = info;
      update();
      return true;

    } catch (error) {
      print(error);
      return false;
    }

  }

}