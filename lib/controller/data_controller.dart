import 'package:get/get.dart';

import '../global/global.dart';
import '../global/http_service.dart';
import '../model/movie_list_model.dart';
import '../vo/movieVo.dart';

///Datacontroller
///담당자 : saran

class DataController extends GetxController {

  final HttpService httpService = HttpService();

  int? nowPlayingTotalPage;
  List<MovieVo> nowPlayingList=[];

  int? popularTotalPage;
  List<MovieVo> popularList=[];

  int? topRatedTotalPage;
  List<MovieVo> topRatedList=[];

  int? upComingTotalPage;
  List<MovieVo> upComingList=[];


  String selectedType = "now_playing";

  Future<void> setType(String type) async{
    selectedType = type;
    update();
  }

  Future<bool> getNowPlayingMovieList(int page) async{

    if(nowPlayingTotalPage==null || nowPlayingTotalPage! >= page){
      if(page==1){
        nowPlayingList.clear();
      }
      try {
        MovieListModel info = await httpService.getMovieList(selectedType,page);
        nowPlayingTotalPage = info.totalPages;
        nowPlayingList.addAll(info!.results!);
        update();
        return true;
      } catch (error) {
        logger.e(error);
        return false;
      }
    }else{
      return false;
    }
  }

  Future<bool> getPopularMovieList(int page) async{
    if(page==1){
      popularList.clear();
    }
    if(popularTotalPage==null || popularTotalPage! >= page){
      try {
        MovieListModel info = await httpService.getMovieList(selectedType,page);
        popularTotalPage = info.totalPages;
        popularList.addAll(info!.results!);
        update();
        return true;
      } catch (error) {
        logger.e(error);
        return false;
      }
    }else{
      return false;
    }
  }

  Future<bool> getTopRatedMovieList(int page) async{
    if(page==1){
      topRatedList.clear();
    }
    if(topRatedTotalPage==null || topRatedTotalPage! >= page){
      try {
        MovieListModel info = await httpService.getMovieList(selectedType,page);
        topRatedTotalPage = info.totalPages;
        topRatedList.addAll(info!.results!);
        update();
        return true;
      } catch (error) {
        logger.e(error);
        return false;
      }
    }else{
      return false;
    }
  }

  Future<bool> getUpComingMovieList(int page) async{
    if(page==1){
      upComingList.clear();
    }
    if(upComingTotalPage==null || upComingTotalPage! >= page){
      try {
        MovieListModel info = await httpService.getMovieList(selectedType,page);
        upComingTotalPage = info.totalPages;
        upComingList.addAll(info!.results!);
        update();
        return true;
      } catch (error) {
        logger.e(error);
        return false;
      }
    }else{
      return false;
    }
  }
}