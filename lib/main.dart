import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesk/Screens/loginDesk.dart';
import 'package:provider/provider.dart';
import 'Providers/menuProvider.dart';
import 'Screens/homepage.dart';
import 'Screens/ticketsScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: 'helpdesk');

  runApp(MyApp());
}

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
          'Login': (_) => LoginDesk(),
          'HomePage': (_) => HomePageScreen(),
          'Tickets': (_) => TicketScreen(),
        },
        initialRoute: 'HomePage',
      ),
    );
  }
}
