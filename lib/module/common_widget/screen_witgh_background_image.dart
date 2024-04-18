import 'package:flutter/material.dart';
import 'package:seventh_sem_project/module/utils/const.dart';

class ScreenWithScaffold extends StatelessWidget {
  ScreenWithScaffold({Key? key, this.body, this.appBar, this.drawer, this.floatingActionButton}) : super(key: key);
  Widget? body;
  AppBar? appBar;
  Drawer? drawer;
  Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: body!,
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
