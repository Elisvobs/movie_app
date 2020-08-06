import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:byskopoyako/pages/home/popular_widget.dart';
import 'package:byskopoyako/provider/bloc/movie_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'top_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

MovieBloc movieBloc = BlocProvider.getBloc<MovieBloc>();

class _HomePageState extends State<HomePage> {
  bool _progressController = false;
  int _currentIndex = 0;
//  final List<Widget> _children = [
//    YoutubeBody(),
//    Trending(),
//    Subscription(),
//    Container(),
//  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  } // check if device is connected then load the content or alert the user to connect
  // check if the logged in user has paid & restrict content

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: getAppBar(),
//      body: _progressController? CircularProgressIndicator()
//          : ListView(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 5.0,
              left: 15.0,
              right: 15.0,
              bottom: 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => print(''),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
          PopularWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => print(''),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
          TopWidget(),
        ],
      ),
//      bottomNavigationBar: BottomNavigationBar(
//          type: BottomNavigationBarType.fixed,
//          currentIndex: _currentIndex,
//          onTap: onTabTapped,
//          fixedColor: Colors.red,
//          iconSize: 24.0,
//          items: [
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text('Home'),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.folder),
//              title: Text('Saved Videos'),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.person),
//              title: Text('Profile'),
//            ),
//          ]),
    );
  }

  getAppBar() => AppBar(
        backgroundColor: Colors.black54,
//        elevation: 0.0,
        title: Center(
          child: Image(
            alignment: Alignment.center,
            height: 40,
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
//        leading: IconButton(
//          padding: EdgeInsets.only(left: 10.0),
//          onPressed: () => {},
//          icon: new Icon(
//            Icons.sort,
//            color: Colors.white70,
//            size: 25.0,
//          ),
//          iconSize: 30.0,
//          color: Colors.white70,
//        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => {},
            icon: Icon(Icons.info),
            iconSize: 30.0,
            color: Colors.white70,
          )
        ],
      );
}
