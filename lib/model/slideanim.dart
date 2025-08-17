import 'package:flutter/material.dart';

/// Custom route dengan animasi slide dari kanan ke kiri.
/// Saat pop otomatis reverse (slide ke kanan).
Route slideRightRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 280),
    reverseTransitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetTween = Tween<Offset>(
        begin: const Offset(1, 0), // mulai dari kanan
        end: Offset.zero, // posisi akhir
      ).chain(CurveTween(curve: Curves.easeOutCubic));

      return SlideTransition(
        position: animation.drive(offsetTween),
        child: child,
      );
    },
  );
}
