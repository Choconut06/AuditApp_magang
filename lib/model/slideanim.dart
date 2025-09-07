import 'package:flutter/material.dart';

Route<T> slideRoute<T>(
  Widget page, {
  AxisDirection direction = AxisDirection.left,
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.ease,
}) {
  Offset begin;
  switch (direction) {
    case AxisDirection.left:
      begin = const Offset(1.0, 0.0);
      break;
    case AxisDirection.right:
      begin = const Offset(-1.0, 0.0);
      break;
    case AxisDirection.up:
      begin = const Offset(0.0, 1.0);
      break;
    case AxisDirection.down:
      begin = const Offset(0.0, -1.0);
      break;
  }

  return PageRouteBuilder<T>(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<Offset>(
        begin: begin,
        end: Offset.zero,
      ).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
