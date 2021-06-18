import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteListCerrado extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: db
              .collection('tickets')
              .where('Estado', isEqualTo: 'Cerrado')
              .snapshots(includeMetadataChanges: false),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> ticket = snapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;

                    return Card(
                        child: ListTile(
                      title: Text(
                        ticket['Titulo'],
                      ),
                      hoverColor: Colors.red,
                      subtitle: Text(ticket['Descripcion']),
                      trailing: Icon(Icons.reorder_rounded),
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
