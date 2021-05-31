import 'package:flutter/material.dart';
import 'package:flutterdesk/Screens/dashboard.dart';
import 'package:flutterdesk/Widgets/Upbar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [UpBar(), DashBoard()],
    ));
  }
}
