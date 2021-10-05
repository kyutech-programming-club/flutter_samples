import 'package:flutter/material.dart';

Route createUpRoute(Widget switchedPage, double speed) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => switchedPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin = Offset(0.0, speed); // 変化量(速度)
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

Route createDefaultRoute(Widget switchedPage, dynamic defaultBuilder) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => switchedPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
       return defaultBuilder
           .buildTransitions(
           MaterialPageRoute(builder: (context) => switchedPage),
           context,
           animation,
           secondaryAnimation,
           child
       );
    },
  );
}
