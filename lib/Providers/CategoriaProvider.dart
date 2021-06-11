import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CategoriaProvider extends ChangeNotifier {
  int _software = 0;
  int _hardware = 0;
  int _red = 0;

  get software => _software;
  get hardware => _hardware;
  get red => _red;

  void getTicketsSoftware() async {
    QuerySnapshot snapshotSoftware = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Categoria', isEqualTo: 'Software')
        .get();

    _software = snapshotSoftware.size;
    notifyListeners();
  }

  void getTicketsHardware() async {
    QuerySnapshot snapshotHardware = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Categoria', isEqualTo: 'Hardware')
        .get();

    _hardware = snapshotHardware.size;
    notifyListeners();
  }

  void getTicketsRed() async {
    QuerySnapshot snapshotRed = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Categoria', isEqualTo: 'Red')
        .get();

    _red = snapshotRed.size;

    notifyListeners();
  }
}
