import 'package:flutter/material.dart';

import 'Screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(),
      routes: {
        'HomePage': (_) => HomePageScreen(),
      },
      initialRoute: 'HomePage',
    );
  }
}
