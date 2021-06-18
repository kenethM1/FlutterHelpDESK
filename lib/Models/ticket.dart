import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String? id;
  String? categoria;
  String? descripcion;
  String? estado;
  String? prioridad;
  String? titulo;

  Ticket({
    this.id,
    this.categoria,
    this.descripcion,
    this.estado,
    this.prioridad,
    this.titulo,
  });

  Ticket.fromSnapshot(String idTicket, Map<String, dynamic> ticket)
      : id = idTicket,
        categoria = ticket['Categoria'],
        descripcion = ticket['Descripción'],
        estado = ticket['Estado'],
        prioridad = ticket['Prioridad'],
        titulo = ticket['Titulo'];

  Map<String, dynamic> toMap() => {
        'Categoria': categoria,
        'Descripcion': descripcion,
        'Estado': estado,
        'Prioridad': prioridad,
        'Titulo': titulo
      };

  Future<Map<String, dynamic>> getAllTickets() async {
    QuerySnapshot snapshotSolucionado = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Estado', isEqualTo: 'Solucionado')
        .get();
    QuerySnapshot snapshotAbierto = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Estado', isEqualTo: 'Abierto')
        .get();

    QuerySnapshot snapshotAsignado = await FirebaseFirestore.instance
        .collection('tickets')
        .where('Estado', isEqualTo: 'Asignado')
        .get();

    return {
      'Solucionado': snapshotSolucionado.size,
      'Abierto': snapshotAbierto.size,
      'Asignado': snapshotAsignado.size
    };
  }
}
