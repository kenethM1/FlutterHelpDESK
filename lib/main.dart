import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesk/Providers/EstadoProvider.dart';
import 'package:flutterdesk/Screens/loginDesk.dart';
import 'package:provider/provider.dart';
import 'Providers/CategoriaProvider.dart';
import 'Providers/PrioridadProvider.dart';
import 'Providers/menuProvider.dart';
import 'Screens/formularioRegistro.dart';
import 'Screens/homepage.dart';
import 'Screens/ticketsScreen.dart';
import 'Screens/faqsScreen.dart';
import 'Screens/agregarFaqs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderMenu()),
        ChangeNotifierProvider(create: (_) => EstadoProvider()),
        ChangeNotifierProvider(create: (_) => CategoriaProvider()),
        ChangeNotifierProvider(create: (_) => PrioridadProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(),
        routes: {
          'Login': (_) => LoginDesk(),
          'HomePage': (_) => HomePageScreen(),
          'Tickets': (_) => TicketScreen(),
          'Registro': (_) => RegistroUsuario()

          'Faqs': (_) => FaqsScreen(),
          'addfaqs': (_) => AgregarFaqs(),
        },
        initialRoute: 'HomePage',
      ),
    );
  }
}
