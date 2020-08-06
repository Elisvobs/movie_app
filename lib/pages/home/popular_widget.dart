import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:byskopoyako/entity/entity.dart';
import 'package:byskopoyako/pages/details/detail_movies_page.dart';
import 'package:byskopoyako/provider/bloc/movie_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  final PageController pageController =
      PageController(initialPage: 1, viewportFraction: 1.0);
  final MovieBloc movieBloc = BlocProvider.getBloc<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        initialData: List<MovieEntity>(),
        stream: movieBloc.listMoviesPopularFlux,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(height: 1.0, width: 1.0);
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return PageView.builder(
                controller: pageController,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemHeadMovie(snapshot.data[index], context, index);
                },
              );
            }
          }
        },
      ),
    );
  }

  itemHeadMovie(MovieEntity movie, BuildContext context, int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => playMovie(context, movie),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movie.title,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.png',
                          height: 280.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          image: movie.screenshot.url),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 90.0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RawMaterialButton(
                  padding: EdgeInsets.all(20.0),
                  elevation: 10.0,
                  onPressed: () {
                    playMovie(context, movie);
                  },
                  shape: CircleBorder(),
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.play_arrow,
                    size: 50.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40.0,
              bottom: 30.0,
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      movie.title,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Text(
                      '${movie.year.toString()}',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Text(
                      '${movie.time} mins',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void playMovie(BuildContext context, MovieEntity movie) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailsMoviePage(
                  movie: movie,
                )));
  }
}
