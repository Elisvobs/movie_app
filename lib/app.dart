import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:byskopoyako/pages/auth/login.dart';
import 'package:flutter/material.dart';

import 'provider/bloc/movie_bloc.dart';
import 'provider/service/movie_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => MovieBloc(MovieService()))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Byskopo Yako",
//          builder: (context, child) => Navigator(
//            key: locator<DialogService>().dialogNavigationKey,
//            onGenerateRoute: (settings) => MaterialPageRoute(
//              builder: (context) => DialogManager(
//                child: child,
//              ),
//            ),
//          ),
//          navigatorKey: locator<NavigationService>().navigationKey,
        theme: ThemeData(
          fontFamily: 'Raleway',
          primarySwatch: Colors.red,
//          backgroundColor: Color.fromARGB(255, 26, 27, 30),
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            body1: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        home: LogIn(),
//          onGenerateRoute: generateRoute,
      ),
    );
  }
}
