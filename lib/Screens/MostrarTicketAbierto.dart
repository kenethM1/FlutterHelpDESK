import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final String estadoTicket;
  NoteList(this.estadoTicket);
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: db
              .collection('tickets')
              .where('Estado', isEqualTo: estadoTicket)
              .snapshots(includeMetadataChanges: false),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> ticket = snapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;

                    print(ticket);

                    return Card(
                        child: ListTile(
                      title: Text(
                        ticket['Titulo'],
                      ),
                      subtitle: Text(ticket['Descripcion']),
                      trailing: IconButton(
                          icon: Icon(Icons.reorder_rounded),
                          onPressed: () async {
                            final nombreUsuario = await getUserData(ticket);

                            TextStyle titulo = TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold);
                            TextStyle descripciones = TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            );

                            showDialog<String>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) => Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 50,
                                          color: Colors.deepOrange,
                                          spreadRadius: 5)
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  height: 400,
                                  width: 500,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                        ticket['Titulo'].toString(),
                                        style: descripciones,
                                      ),
                                      Text(
                                        'Descripción'.toUpperCase(),
                                        style: titulo,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ticket['Descripcion'],
                                        style: descripciones,
                                      ),
                                      Text(
                                        'Prioridad'.toUpperCase(),
                                        style: titulo,
                                      ),
                                      Text(
                                        ticket['Prioridad'],
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('Asignar'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
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

  Future<String> getUserData(Map<String, dynamic> ticket) async {
    CollectionReference usuarios =
        FirebaseFirestore.instance.collection('usuarios');
    Map<String, dynamic>? usuarioMap;

    String usuarioID = ticket['IDUsuario'];

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
