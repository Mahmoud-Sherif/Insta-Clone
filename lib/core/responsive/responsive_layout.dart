import 'package:chat_app/const/dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, required this.webViewLayout, required this.mobileViewLayout})
      : super(key: key);
  final Widget webViewLayout;
  final Widget mobileViewLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreanSize) {
          return webViewLayout;
        } else {
          return mobileViewLayout;
        }
      },
    );
  }
}
