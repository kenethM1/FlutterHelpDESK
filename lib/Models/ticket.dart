import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  Ticket({
    this.categoria,
    this.descripcion,
    this.estado,
    this.prioridad,
    this.titulo,
  });

  String? categoria;
  String? descripcion;
  String? estado;
  String? prioridad;
  String? titulo;

  void getAllTickets() {
    FirebaseFirestore.instance
        .collection('tickets')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["titulo"]);
      });
    });
  }
}
