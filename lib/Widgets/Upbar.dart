import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterdesk/Providers/menuProvider.dart';
import 'package:provider/provider.dart';

class UpBar extends StatelessWidget {
  const UpBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<ProviderMenu>(context);

    Size size = MediaQuery.of(context).size;

    TextStyle titlestyle = TextStyle(color: Colors.white, fontSize: 18);
    return Container(
      height: size.height * 0.05,
      width: size.width,
      color: Colors.redAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () => menuProvider.opcionMenuSeleccionado = 0,
          ),
          TextButton(
            child: Text('Home', style: titlestyle),
            onPressed: () => menuProvider.opcionMenuSeleccionado = 0,
          ),
          TextButton(
              child: Text('Tickets', style: titlestyle),
              onPressed: () => menuProvider.opcionMenuSeleccionado = 1),
          TextButton(
              child: Text('Human Resourses', style: titlestyle),
              onPressed: () {}),
        ],
      ),
    );
  }
}
