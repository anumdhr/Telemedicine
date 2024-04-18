import 'package:flutter/material.dart';

class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget widget;
  final bool useAnimation;

  CustomPageRouteBuilder({
    required this.widget,
    RouteSettings? settings,
    bool maintainState = true,
    this.useAnimation = true,
  }) : super(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    maintainState: maintainState,
    settings: settings,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
      if (useAnimation) {
        animation = CurvedAnimation(
          parent: animation,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.linear,
        );
        return SlideTransition(
          // alignment: Alignment.center,
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          transformHitTests: false,
          child: child,
        );
      }
      return child;
    },
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,
        ) {
      return widget;

    },
  );
}
