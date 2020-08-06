import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:byskopoyako/entity/entity.dart';
import 'package:byskopoyako/pages/details/detail_movies_page.dart';
import 'package:byskopoyako/provider/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';

class UpcomingWidget extends StatelessWidget {
  final PageController pageController =
      PageController(initialPage: 1, viewportFraction: 1.0);
  final MovieBloc movieBloc = BlocProvider.getBloc<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280.0,
        width: double.infinity,
        child: StreamBuilder(
            initialData: List<MovieEntity>(),
            stream: movieBloc.listMoviesListFlux,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return Container(height: 1.0, width: 1.0);

              return PageView.builder(
                controller: pageController,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return itemHeadMovie(snapshot.data[index], context, index);
                },
              );
            }));
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
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsMoviePage(
                      movie: movie,
                    ))),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
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
            Positioned(
              left: 30.0,
              bottom: 70.0,
              child: Align(
                child: Container(
                  width: 250.0,
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
