import 'package:flutter/material.dart';

class SlideTransitionPage extends PageRouteBuilder {
  final Widget page;

  SlideTransitionPage({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // trượt từ phải sang
      const end = Offset.zero;
      var tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: Curves.easeInOut));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
