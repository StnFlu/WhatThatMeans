import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SplashAnimatedIcon extends StatefulWidget {
  const SplashAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<SplashAnimatedIcon> createState() => _SplashAnimatedIconState();
}

class _SplashAnimatedIconState extends State<SplashAnimatedIcon>
    with TickerProviderStateMixin {
  late Animation _iconAnimation;
  late Animation _iconRotateAnimation;

  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200),
        reverseDuration: const Duration(milliseconds: 1200));
    _iconAnimation = Tween(begin: 0.8, end: 1.0).animate(CurvedAnimation(
        curve: Curves.easeIn, parent: _iconAnimationController));
    _iconRotateAnimation = Tween(begin: 0.9, end: 1.0).animate(CurvedAnimation(
        curve: Curves.easeInOut, parent: _iconAnimationController));

    _iconAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _iconAnimationController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _iconAnimationController.forward();
      }
    });

    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _iconAnimationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _iconRotateAnimation.value * 1.9 * math.pi,
          child: Transform.scale(
            scale: _iconAnimation.value * 0.9,
            child: SvgPicture.asset('assets/WhatThatMeans.svg',
                width: 120.0, height: 120.0),
          ),
        );
      },
    );
  }
}
