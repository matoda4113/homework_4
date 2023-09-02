import 'package:flutter/material.dart';

import '../global/global.dart';
import '../vo/movieVo.dart';

///MovieListCard
///담당자 : ---

class MovieListCard extends StatefulWidget {

  MovieVo item;
  MovieListCard({Key? key , required this.item}) : super(key: key);

  @override
  State<MovieListCard> createState() => _MovieListCardState();
}

class _MovieListCardState extends State<MovieListCard> {

  @override
  void initState() {
    super.initState();
    logger.d("MovieListCard");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
          Container(
              width: double.infinity,
              child: AspectRatio(
                  aspectRatio: 1/1,
                  child: Image.network("https://image.tmdb.org/t/p/original/${widget.item?.posterPath}",fit: BoxFit.cover,))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star , color: Colors.yellow,),
              Text("평점 : ${widget.item.voteAverage}"),
            ],
          ),
          Text(widget.item?.title??"noTitle"),
      ],
    ));
  }
}


