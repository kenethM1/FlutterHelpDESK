import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdesk/Models/ticket.dart';

class PrioridadProvider extends ChangeNotifier {
  List<Ticket> tickets = [];
  int _alta = 0;
  int _media = 0;
  int _baja = 0;

  get alta => _alta;
  get media => _media;
  get baja => _baja;

  void getTicketsAlta() async {
    QuerySnapshot snapshotAlta = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Prioridad', isEqualTo: 'Alta')
        .get();

    _alta = snapshotAlta.size;
    notifyListeners();
  }

  void getTicketsMedia() async {
    QuerySnapshot snapshotMedia = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Prioridad', isEqualTo: 'Media')
        .get();

    _media = snapshotMedia.size;
    notifyListeners();
  }

  void getTicketsBaja() async {
    QuerySnapshot snapshotBaja = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Prioridad', isEqualTo: 'Baja')
        .get();

    _baja = snapshotBaja.size;

    notifyListeners();
  }
}
