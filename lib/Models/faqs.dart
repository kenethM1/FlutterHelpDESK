import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Faqs {

  String? pregunta;
  String? respuesta;


  Faqs({
    this.pregunta,
    this.respuesta,
   
  });
        

  Map<String, dynamic> toMap() {
    return{
      'Pregunta': pregunta,
      'Respuesta': respuesta,
    };
  } 

  factory Faqs.fromMap(Map<String, dynamic> map){
    return Faqs(
      pregunta: map['Pregunta'],
      respuesta: map['Respuesta']
    );
    
  }
          
}