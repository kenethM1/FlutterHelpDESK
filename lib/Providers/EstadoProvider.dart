import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdesk/Models/ticket.dart';

class EstadoProvider extends ChangeNotifier {
  int _abiertos = 0;
  int _solucionados = 0;
  int _asignado = 0;

  get abiertos => _abiertos;
  get solucionados => _solucionados;
  get asignado => _asignado;

  set ticketsabiertos(int ticketsAbiertos) {
    _abiertos = ticketsAbiertos;
  }

  set ticketssolucionados(int ticketssolucionados) {
    _solucionados = ticketssolucionados;
  }

  void getTicketsAbiertos() async {
    QuerySnapshot snapshotAbierto = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Estado', isEqualTo: 'Abierto')
        .get();

    _abiertos = snapshotAbierto.size;
    notifyListeners();
  }

  void getTicketsSolucionados() async {
    QuerySnapshot snapshotAbierto = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Estado', isEqualTo: 'Solucionado')
        .get();

    _solucionados = snapshotAbierto.size;
    notifyListeners();
  }

  void getTicketsAsignado() async {
    QuerySnapshot snapshotAsignado = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Estado', isEqualTo: 'Asignado')
        .get();

    _asignado = snapshotAsignado.size;

    notifyListeners();
  }
}
