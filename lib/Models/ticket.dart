import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String? id;
  String? categoria;
  String? descripcion;
  String? estado;
  String? prioridad;
  String? titulo;
  String? idUsuario;

  Ticket(
      {this.id,
      this.categoria,
      this.descripcion,
      this.estado,
      this.prioridad,
      this.titulo,
      this.idUsuario});

  Ticket.fromSnapshot(String idTicket, Map<String, dynamic> ticket)
      : id = idTicket,
        categoria = ticket['Categoria'],
        descripcion = ticket['Descripcion'],
        estado = ticket['Estado'],
        prioridad = ticket['Prioridad'],
        titulo = ticket['Titulo'],
        idUsuario = ticket['IDUsuario'];

  Map<String, dynamic> toMap() => {
        'Categoria': categoria,
        'Descripcion': descripcion,
        'Estado': estado,
        'Prioridad': prioridad,
        'Titulo': titulo,
        'IDUsuario': idUsuario
      };

  Future ticketAcerrado(String ticketID) async {
    await FirebaseFirestore.instance
        .collection('tickets')
        .doc(ticketID)
        .update({'Estado': 'Cerrado'});
  }

  Future<List<Ticket>> getTickets(String estado) async {
    List<Ticket> tickets = [];
    QuerySnapshot ticketQuery =
        await FirebaseFirestore.instance.collection('tickets').get();

    ticketQuery.docs.map((ticket) {
      final ticketMap = ticket.data() as Map<String, dynamic>;
      tickets.add(Ticket.fromSnapshot(ticket.id, ticketMap));
    }).toList();

    tickets.removeWhere((element) => element.estado != estado);

    return tickets;
  }

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
