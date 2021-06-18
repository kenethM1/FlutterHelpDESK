import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: db
              .collection('tickets')
              .where('Estado', isEqualTo: 'Abierto')
              .snapshots(includeMetadataChanges: false),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(itemBuilder: (context, index) {
                Map<String, dynamic> ticket =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;

                return Card(
                    child: ListTile(
                  title: Text(
                    ticket['Titulo'],
                  ),
                  subtitle: Text(ticket['Descripcion']),
                  trailing: IconButton(
                    icon: const Icon(Icons.reorder_rounded),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('INFORMACION DETALLADA DE TICKET'),
                        content: Text('Titulo: ' +
                            ticket['Titulo'].toString() +
                            '\n\nDescripcion: ' +
                            ticket['Descripcion'].toString() +
                            '\n\nCategoria: ' +
                            ticket['Categoria'].toString() +
                            '\n\nPrioridad: ' +
                            ticket['Prioridad'].toString()),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('Asignar'),
                          ),
                        ],
                      ),
                    ),
                  ),
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
