import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:byskopoyako/entity/entity.dart';
import 'package:byskopoyako/provider/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final MovieBloc movieBloc = BlocProvider.getBloc<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        child: StreamBuilder(
            initialData: List<MovieEntity>(),
            stream: movieBloc.listMoviesFlux,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Container(
                  height: 1,
                  width: 1,
                );

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  MovieEntity movie = snapshot.data[index] as MovieEntity;
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 340.0,
                    child: PhysicalShape(
                        color: Colors.transparent,
                        shadowColor: Colors.red,
                        elevation: 5.0,
                        clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: RawMaterialButton(
                            fillColor: Colors.transparent,
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 0.0,
                            textStyle: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white),
                            onPressed: null,
                            constraints: BoxConstraints.loose(Size(160, 90)),
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.2),
                                      BlendMode.dstATop),
                                  image: new NetworkImage(
                                    movie.screenshot.url,
                                  ),
                                ),
                                gradient: LinearGradient(
                                    colors: const [
                                      Color(0xffec2f48),
                                      Color(0xffc02425)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                              ),
                              child: Center(child: Text(
//                          movie.Categories
                                  "")),
                            ))),
                  );
                },
              );
            }));
  }
}
