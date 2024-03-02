import 'package:flutter/material.dart';

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration;

  ScaleRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300)
  }): super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      // Scale the page up from the center
      return ScaleTransition(
        scale: animation.drive(tween),
        child: child,
      );
    },
  );

}