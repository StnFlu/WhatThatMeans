import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whats_that_mean/splash/widgets/splash_animated_icon.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context,'/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.loose, children: buildRow(xCount: 10, yCount: 10)),
    );
  }

  List<List<Widget>> _buildGridTilesList(int xCount, int yCount) =>
      List.generate(xCount,
              (i) => List.generate(yCount, (y) => const SplashAnimatedIcon()));

  List<Widget> buildRow({required int xCount, required int yCount}) {
    List<List<Widget>> widgets = _buildGridTilesList(xCount, yCount);
    List<Widget> row = [];
    for (int i = 0; i < widgets.length; i++) {
      row.add(Positioned(
          top: i % 2 == 1 ? 0 : -50,
          left: i * 120 - 30,
          child: Column(
            children: widgets[i],
          )));
    }
    return row;
  }
}

