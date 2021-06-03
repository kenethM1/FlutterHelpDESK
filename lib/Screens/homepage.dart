import 'package:flutter/material.dart';
import 'package:flutterdesk/Providers/menuProvider.dart';
import 'package:flutterdesk/Screens/dashboardScreen.dart';
import 'package:flutterdesk/Screens/ticketsScreen.dart';
import 'package:flutterdesk/Widgets/Upbar.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [UpBar(), HomePageBody()],
    ));
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<ProviderMenu>(context);
    final currentIndex = menuProvider.menuSeleccionado;

    switch (currentIndex) {
      case 0:
        return DashBoardScreen();
      case 1:
        return TicketScreen();
      default:
        return DashBoardScreen();
    }
  }
}
