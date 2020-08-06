import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:byskopoyako/entity/entity.dart';
import 'package:byskopoyako/provider/service/movie_service.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends BlocBase {
  final MovieService productService;

  MovieBloc(this.productService) {
    loadMovies();
  }

  final BehaviorSubject<List<MovieEntity>> listMoviesController =
      new BehaviorSubject<List<MovieEntity>>.seeded(List<MovieEntity>());

  Observable<List<MovieEntity>> get listMoviesFlux =>
      listMoviesController.stream;

  Sink<List<MovieEntity>> get listMoviesEvent => listMoviesController.sink;

  final BehaviorSubject<List<MovieEntity>> listMoviesPopularController =
      new BehaviorSubject<List<MovieEntity>>.seeded(List<MovieEntity>());

  Observable<List<MovieEntity>> get listMoviesPopularFlux =>
      listMoviesPopularController.stream;

  Sink<List<MovieEntity>> get listMoviesPopularEvent =>
      listMoviesPopularController.sink;

  final BehaviorSubject<List<MovieEntity>> listMoviesListController =
      new BehaviorSubject<List<MovieEntity>>.seeded(List<MovieEntity>());

  Observable<List<MovieEntity>> get listMoviesListFlux =>
      listMoviesListController.stream;

  Sink<List<MovieEntity>> get listMoviesListEvent =>
      listMoviesListController.sink;

  loadMovies() async {
    listMoviesEvent.add(await productService.getByTypeAll("Featured"));
    listMoviesPopularEvent.add(await productService.getByTypeAll("Popular"));
    listMoviesListEvent.add(await productService.getByTypeAll("Upcoming"));
  }

  @override
  void dispose() {
    listMoviesController?.close();
    listMoviesPopularController?.close();
    listMoviesListController?.close();
    super.dispose();
  }
}
