import 'package:flutter/material.dart';
import 'package:flutterdesk/Widgets/dashboard.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DashBoard(
          title: 'Estado de Tickets',
        ),
        DashBoard(
          title: 'Categoria de Estados',
        ),
        DashBoard(
          title: 'Prioridad de Estados',
        )
      ],
    );
  }
}
