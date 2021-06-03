import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/menuProvider.dart';
import 'Screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderMenu()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(),
        routes: {
          'HomePage': (_) => HomePageScreen(),
        },
        initialRoute: 'HomePage',
      ),
    );
  }
}
