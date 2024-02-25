import 'package:flutter/material.dart';

import '../main.dart';

class NavigationService {
  Future<dynamic>? navigateTo({required String routeName, dynamic argument}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: argument);
  }


  void pop() {
    return navigatorKey.currentState?.pop();
  }
}
