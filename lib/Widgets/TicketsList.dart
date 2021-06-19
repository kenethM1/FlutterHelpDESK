import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TicketList extends StatefulWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  _TicketListState createState() => _TicketListState();
}

String letras = 'Daniel';

class _TicketListState extends State<TicketList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Text(letras),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  letras = 'Keneth';
                });
              },
              child: Text('Cambiar a Keneth'))
        ],
      ),
      width: 600,
    );
  }
}
