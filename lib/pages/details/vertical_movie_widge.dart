import 'package:byskopoyako/entity/entity.dart';
import 'package:flutter/material.dart';

class VerticalMovieWidget extends StatelessWidget {
  final MovieEntity movie;

  final String title;

  const VerticalMovieWidget({
    Key key,
    this.movie,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
