import 'package:flutter/material.dart';
import 'package:whats_that_mean/home/home.dart';
import 'package:whats_that_mean/splash/splash.dart';

class AppView extends StatelessWidget {

  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daniel Monk',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
          )
      ),
      routes: {
        '/loading': (context) => const SplashPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return _createRoute(
              page: const SplashPage(), settings: settings);
        }
        if (settings.name == "/home") {
          return _createRoute(
              page: const HomeView(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => const HomeView());
      },
      initialRoute: '/',
    );
  }
}

Route _createRoute({required Widget page, required RouteSettings settings}) {
  return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, a, b, c) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOutSine)).animate(a),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-1.0, 0.0),
          ).chain(CurveTween(curve: Curves.easeInOutSine)).animate(b),
          child: c,
        ),
      ));
}
