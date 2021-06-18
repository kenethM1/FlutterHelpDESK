import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutterdesk/Screens/MostrarTicketAbierto.dart';
import 'package:flutterdesk/Screens/MostrarTicketAsignado.dart';
import 'package:flutterdesk/Screens/MostrarTicketCerrado.dart';

class TicketList extends StatefulWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      width: 600,
      height: 600,
      child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            controller: new ScrollController(),
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                    child: TabBar(labelColor: Colors.black, tabs: [
                  Tab(text: 'ABIERTOS'),
                  Tab(text: 'CERRADOS'),
                  Tab(text: 'ASIGNADOS'),
                ]))
              ];
            },
            body: TabBarView(children: [
              NoteList('Abierto'),
              NoteList('Cerrado'),
              NoteList('Asignado'),
            ]),
          )),
    );
  }
}
