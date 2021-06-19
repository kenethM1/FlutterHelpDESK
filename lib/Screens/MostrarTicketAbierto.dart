import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesk/Models/ticket.dart';

class NoteList extends StatelessWidget {
  final String estadoTicket;
  NoteList(this.estadoTicket);
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Ticket>>(
          future: Ticket().getTickets(estadoTicket),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(
                        snapshot.data![index].titulo.toString(),
                      ),
                      subtitle:
                          Text(snapshot.data![index].descripcion.toString()),
                      trailing: IconButton(
                          icon: Icon(Icons.reorder_rounded),
                          onPressed: () async {
                            final nombreUsuario = await getUserData(
                                snapshot.data![index].idUsuario.toString());

                            TextStyle titulo = TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold);
                            TextStyle descripciones = TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            );

                            buildShowTicketDialog(
                                context,
                                titulo,
                                snapshot.data![index],
                                descripciones,
                                nombreUsuario);
                          }),
                    ));
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future buildShowTicketDialog(BuildContext context, TextStyle titulo,
      Ticket ticket, TextStyle descripciones, String nombreUsuario) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Center(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 50, color: Colors.deepOrange, spreadRadius: 5)
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 400,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'INFORMACION DETALLADA DE TICKET',
                style: titulo,
              ),
              Text(
                'Titulo'.toUpperCase(),
                style: titulo,
                textAlign: TextAlign.center,
              ),
              Text(
                ticket.titulo.toString(),
                style: descripciones,
              ),
              Text(
                'Descripción'.toUpperCase(),
                style: titulo,
                textAlign: TextAlign.center,
              ),
              Text(
                ticket.descripcion.toString(),
                style: descripciones,
              ),
              Text(
                'Prioridad'.toUpperCase(),
                style: titulo,
              ),
              Text(
                ticket.prioridad.toString(),
                style: descripciones,
              ),
              Text(
                'Usuario'.toUpperCase(),
                style: titulo,
              ),
              CircleAvatar(
                radius: 20,
                child: Icon(Icons.verified_user),
              ),
              Text(
                nombreUsuario.toString(),
                style: descripciones,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text('Cancelar',
                              style: TextStyle(color: Colors.white)),
                        )),
                  ),
                  (estadoTicket == 'Abierto')
                      ? TextButton(
                          onPressed: () {
                            final ticketModel = new Ticket();
                            ticketModel.ticketAcerrado(ticket.id.toString());
                            Navigator.pop(context, 'OK');
                          },
                          child: Container(
                              width: 70,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text('Cerrar Ticket',
                                    style: TextStyle(color: Colors.white)),
                              )),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getUserData(String userID) async {
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('usuarios');
    Map<String, dynamic>? usuarioMap;

    String usuarioID = userID;

    final usuario = await usuarios
        .doc(usuarioID.trim())
        .get()
        .then((value) => usuarioMap = value.data() as Map<String, dynamic>);

    return usuarioMap!['nombre'];
  }
}

class _actualizarDatos {
  CollectionReference tickets =
      FirebaseFirestore.instance.collection('tickets');

  Future<void> updateUser() {
    return tickets
        .doc('ABC123')
        .update({'Estado': 'Asignado'})
        .then((value) => print('Ticket Asigado!'))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
