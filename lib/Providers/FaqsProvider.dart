import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FaqsProvider{

  final CollectionReference faqsList =
      FirebaseFirestore.instance.collection('faqs');

  Future getFaqsList() async {

    FirebaseFirestore.instance
        .collection('faqs')
        .get()
        .then((QuerySnapshot querySnapshot) {
            querySnapshot.docs.forEach((doc) {
                print(doc["Pregunta"]);
            });
        });
  }

}