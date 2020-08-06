import 'package:byskopoyako/entity/entity.dart';
import 'package:byskopoyako/infra/circular_clipper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailsMoviePage extends StatefulWidget {
  final MovieEntity movie;

  DetailsMoviePage({this.movie});

  @override
  _DetailsMoviePageState createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  VideoPlayerController controller;
  Firestore firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();
//    if(firestore.document('movie').snapshots())
    //check network state
    //check if the stream has data
    // control timeout & loading state inclu buffering

    controller = VideoPlayerController.network(widget.movie.trailer)
      ..initialize().then((_) => {});
//    if (!controller.value.isBuffering) {
//      controller = VideoPlayerController.network(widget.movie.trailer)
//        ..initialize().then((_) => {});
//    } else {
//      CircularProgressIndicator(
//        strokeWidth: 3,
//      );
//    }
  }

  @override
  void dispose() {
    controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: controller.value.isPlaying
              ? Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.pause();
                          controller = VideoPlayerController.network(
                              widget.movie.trailer)
                            ..initialize().then((_) {});
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                          child: Hero(
                            tag: widget.movie.title,
                            child: ShadowClip(
                              clipper: CircularClipper(),
                              shadow: Shadow(blurRadius: 20.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/placeholder.png',
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                image: widget.movie.screenshot.url,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              icon: Icon(Icons.arrow_back),
                              onPressed: () => Navigator.pop(context),
                              iconSize: 30.0,
                              color: Colors.white,
                            ),
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                              height: 60.0,
                              width: 150.0,
                            ),
                          ],
                        ),
                        Positioned.fill(
                          bottom: 90.0,
                          child: Align(
                            alignment: Alignment.center,
                            child: RawMaterialButton(
                              padding: EdgeInsets.all(10.0),
                              elevation: 10.0,
                              onPressed: () {
                                setState(() {
                                  controller.play();
                                });
                              },
                              shape: CircleBorder(),
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.play_arrow,
                                size: 60.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
