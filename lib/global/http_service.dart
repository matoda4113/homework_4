import 'dart:convert';

import 'package:homework_4/model/movie_list_model.dart';
import 'package:http/http.dart' as http;

import 'global.dart';

class HttpService {

  Future<MovieListModel> getMovieList() async {

    Map<String,String> headers ={
      "accept": 'application/json',
      "Authorization": 'Bearer ${accessCode}'
    };
    String url = "https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1";

    Uri uri = Uri.parse(url);

    final response = await http.get(uri , headers: headers);
    if (response.statusCode == 200) {
      logger.e(response.body);
      return MovieListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("server_fail");
    }
  }


}

