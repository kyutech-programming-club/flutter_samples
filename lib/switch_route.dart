import 'package:flutter/material.dart';
import 'package:flutter_samples/page2.dart';

Route createUpRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // 変化量(速度)
      const end = Offset.zero;
      const curve = Curves.ease; // アニメーションの種類

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}