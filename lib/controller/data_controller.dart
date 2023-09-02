import 'package:get/get.dart';

import '../global/http_service.dart';
import '../model/movie_list_model.dart';




///Datacontroller
///담당자 : saran

class DataController extends GetxController {

  final HttpService httpService = HttpService();

  MovieListModel? movieListModel;

  Future<bool> getMovieList() async{

    try {
      await httpService.getMovieList();

      MovieListModel info = await httpService.getMovieList();
      movieListModel = info;
      update();
      return true;

    } catch (error) {
      print(error);
      return false;
    }

  }

}