//import 'package:byskopoyako/src/entity/entity.dart';
//import 'package:byskopoyako/src/provider/service/movie_service.dart';
//
//class Mock {
//
//  static generateMock() async {
//    MovieService db = MovieService();
//
//    MovieEntity movie = MovieEntity(
//      // Categories: 'Watch your favourite local content on Byskopo Yako',
//      description: '',
//      typeMovie: 'Popular',
//      title:'Mwanasikana',
//      trailer: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/videos%2Ftrailer.mp4?alt=media&token=ad21458d-c999-4549-9524-474d894079fd',
//      // Country: 'USA',
//      time : '150 min',
//      screenshot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana.jpg?alt=media&token=21835c34-6559-4339-80d0-4328c21f335e'),
//      screenshots:List<ImageEntity>(),
//      year: '2019'
//    );
//
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana.jpg?alt=media&token=21835c34-6559-4339-80d0-4328c21f335e'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana.jpg?alt=media&token=21835c34-6559-4339-80d0-4328c21f335e'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana.jpg?alt=media&token=21835c34-6559-4339-80d0-4328c21f335e'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana.jpg?alt=media&token=21835c34-6559-4339-80d0-4328c21f335e'));
//    await db.save(movie);
//
//    movie = MovieEntity(
//      // Categories: 'Watch your favourite local content on Byskopo Yako',
//      typeMovie: 'Featured',
//      title:'Tariro',
//      // Country: 'USA',
//      time : '120 min',
//      screenshot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'),
//      screenshots: List<ImageEntity>(),
//      year: '2018'
//    );
//
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'));
//    await db.save(movie);
//
//
//    movie = MovieEntity(
//      // Categories: 'Watch your favourite local content on Byskopo Yako',
//      typeMovie: 'Upcoming',
//      title:'Chiredzwa',
//      // Country: 'USA',
//      time : '120 min',
//      screenshot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'),
//      screenshots: List<ImageEntity>(),
//      year: '2018'
//    );
//
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'));
//    movie.screenshots.add(ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'));
//    await db.save(movie);
//
//    movie = MovieEntity(
//      // Categories: 'Watch your favourite local content on Byskopo Yako',
//      typeMovie: 'Featured',
//      title:'Ghetto Girls',
//      // Country: 'USA',
//      time : '120 min',
//      screenshot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fghetto_girls.jpg?alt=media&token=f5112615-0231-4b50-b01e-ffc8ec93bf37'),
//      screenshots:List<ImageEntity>(),
//      year: '2018'
//    );
//
//    await db.save(movie);
//
//    movie = MovieEntity(
//      // Categories: 'Watch your favourite local content on Byskopo Yako',
//      typeMovie: 'Popular',
//      title:'Mwanasikana 2',
//      // Country: 'USA',
//      time : '120 min',
//      screenshot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana2.jpg?alt=media&token=fb24a7f8-f625-4d00-89ae-45fa20f4b0c6'),
//      screenshots:List<ImageEntity>(),
//      year: '2018'
//    );
//
//    await db.save(movie);
//
//    movie = MovieEntity(
//      // Categories: 'Watch your favourite local content on Byskopo Yako',
//      typeMovie: 'Upcoming',
//      title:'Damaged',
//      // Country: 'USA',
//      time : '120 min',
//      screenshot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fdamaged.jpg?alt=media&token=f0fbca3c-bd30-4312-8bef-257e2b849eb5'),
//      screenshots:List<ImageEntity>(),
//      year: '2018'
//    );
//
//    await db.save(movie);
//
//    movie = MovieEntity(
//      // Categories: 'Watch your favourite local content on Byskopo Yako',
//      typeMovie: 'Featured',
//      title:'Chengaose',
//      // Country: 'USA',
//      time : '120 min',
//      screenshot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fchengaose.jpg?alt=media&token=9d6e2343-77e6-4c46-bccf-4acd89cdd44f'),
//      screenshots:List<ImageEntity>(),
//      year: '2018'
//    );
//
//    await db.save(movie);
//
//    // movie = MovieEntity(
//    //   Categories: 'Watch your favourite local content on Byskopo Yako',
//    //   TypeMovie: 'MyList',
//    //   Title:'Chengaose',
//    //   Country: 'USA',
//    //   Time : '120 min',
//    //   ScreenShot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fchengaose.jpg?alt=media&token=9d6e2343-77e6-4c46-bccf-4acd89cdd44f'),
//    //   ScreenShots:List<ImageEntity>(),
//    //   Year: '2018'
//    // );
//
//    // await db.save(movie);
//
//    // movie = MovieEntity(
//    //   Categories: 'Watch your favourite local content on Byskopo Yako',
//    //   TypeMovie: 'Popular',
//    //   Title:'Damaged',
//    //   Country: 'USA',
//    //   Time : '120 min',
//    //   ScreenShot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fdamaged.jpg?alt=media&token=f0fbca3c-bd30-4312-8bef-257e2b849eb5'),
//    //   ScreenShots:List<ImageEntity>(),
//    //   Year: '2018'
//    // );
//
//    // await db.save(movie);
//
//    // movie = MovieEntity(
//    //   Categories: 'Watch your favourite local content on Byskopo Yako',
//    //   TypeMovie: 'Popular',
//    //   Title:'Ghetto Girls',
//    //   Country: 'USA',
//    //   Time : '120 min',
//    //   ScreenShot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fghetto_girls.jpg?alt=media&token=f5112615-0231-4b50-b01e-ffc8ec93bf37'),
//    //   ScreenShots:List<ImageEntity>(),
//    //   Year: '2018'
//    // );
//
//    // await db.save(movie);
//
//    // movie = MovieEntity(
//    //   Categories: 'Watch your favourite local content on Byskopo Yako',
//    //   TypeMovie: 'Popular',
//    //   Title:'Tariro',
//    //   Country: 'USA',
//    //   Time : '120 min',
//    //   ScreenShot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Ftariro.jpg?alt=media&token=845acb44-e5b9-4eb0-b3a4-ac0815be7dba'),
//    //   ScreenShots: List<ImageEntity>(),
//    //   Year: '2018'
//    // );
//
//    // await db.save(movie);
//
//    // movie = MovieEntity(
//    //   // Categories: 'Watch your favourite local content on Byskopo Yako',
//    //   TypeMovie: 'Popular',
//    //   Title:'Mwanasikana',
//    //   // Country: 'USA',
//    //   Time : '120 min',
//    //   ScreenShot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana.jpg?alt=media&token=21835c34-6559-4339-80d0-4328c21f335e'),
//    //   ScreenShots:List<ImageEntity>(),
//    //   Year: '2018'
//    // );
//
//    // await db.save(movie);
//
//    // movie = MovieEntity(
//    //   // Categories: 'Watch your favourite local content on Byskopo Yako',
//    //   TypeMovie: 'Popular',
//    //   Title:'Mwanasikana 2',
//    //   // Country: 'USA',
//    //   Time : '120 min',
//    //   ScreenShot: ImageEntity(url: 'https://firebasestorage.googleapis.com/v0/b/byskopo-8442a.appspot.com/o/images%2Fmwanasikana2.jpg?alt=media&token=fb24a7f8-f625-4d00-89ae-45fa20f4b0c6'),
//    //   ScreenShots:List<ImageEntity>(),
//    //   Year: '2018'
//    // );
//
//    // await db.save(movie);
//  }
//
//}