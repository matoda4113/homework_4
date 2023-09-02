import 'package:homework_4/vo/min_max_date.dart';

import '../vo/movieVo.dart';

class MovieListModel {
  MinMaXDates? dates;
  int? page;
  List<MovieVo>? results;
  int? totalPages;
  int? totalResults;

  MovieListModel(
      {this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new MinMaXDates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieVo>[];
      json['results'].forEach((v) {
        results!.add(new MovieVo.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dates != null) {
      data['dates'] = this.dates!.toJson();
    }
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}



