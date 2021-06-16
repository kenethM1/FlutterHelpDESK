import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutterdesk/Providers/CategoriaProvider.dart';
import 'package:flutterdesk/Providers/EstadoProvider.dart';
import 'package:flutterdesk/Providers/PrioridadProvider.dart';
import 'package:flutterdesk/Widgets/Categoriadashboard.dart';
import 'package:flutterdesk/Widgets/Estadodashboard.dart';
import 'package:flutterdesk/Widgets/PrioridadDashboard.dart';
import 'package:flutterdesk/Widgets/TicketsList.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ticketEstado = Provider.of<EstadoProvider>(context);
    final ticketCategoria = Provider.of<CategoriaProvider>(context);
    final ticketPrioridad = Provider.of<PrioridadProvider>(context);
    initAllData(ticketEstado, ticketCategoria, ticketPrioridad);
    return Column(
      children: [
        Row(
          children: [
            EstadoDashBoard(
              title: 'Estado de Tickets',
            ),
            PrioridadDashBoard(
              title: 'Prioridad de Estados',
            ),
            CategoriaDashBoard(
              title: 'Categoria de Estados',
            )
          ],
        ),
        TicketList()
      ],
    );
  }

  void initAllData(EstadoProvider ticketEstado,
      CategoriaProvider ticketCategoria, PrioridadProvider ticketPrioridad) {
    ticketEstado.getTicketsAbiertos();
    ticketEstado.getTicketsSolucionados();
    ticketEstado.getTicketsAsignado();
    ticketCategoria.getTicketsHardware();
    ticketCategoria.getTicketsRed();
    ticketCategoria.getTicketsSoftware();
    ticketPrioridad.getTicketsAlta();
    ticketPrioridad.getTicketsBaja();
    ticketPrioridad.getTicketsMedia();
  }
}
