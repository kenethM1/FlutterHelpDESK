import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdesk/Models/faqs.dart';

 Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) => const AlertDialog(title: Text('Guardado')),
  );
} 

class AgregarFaqs extends StatelessWidget {
  const AgregarFaqs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          
          backgroundColor: Colors.deepOrange,
          
          title: Text("Agregar Preguntas",
          style: TextStyle(fontSize: 30,)),
          
        ),
        
        
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12),
        
        children: [
           SizedBox(
          height: 50,
        ),
          _datosfaqs(context) 
        ],
      ),
    );
  }


  Widget _datosfaqs(BuildContext context) {
    final txtPregunta = TextEditingController();
    final txtRespuesta = TextEditingController();

    return Column(
      children: [
         TextField(
          controller: txtPregunta,
          decoration: InputDecoration(
              hintText: 'Pregunta',
              suffixIcon:
                  Icon(Icons.align_horizontal_left, color: Colors.grey),
              fillColor: Colors.deepOrange.shade100,
              filled: true,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.only(left: 50),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(20),
              )),
        ),
        SizedBox(
          height: 30,
        ),

        TextField(
          controller: txtRespuesta,
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Respuesta',
            suffixIcon: Icon(Icons.align_horizontal_left, color: Colors.grey),
            fillColor: Colors.deepOrange.shade100,
            filled: true,
            labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.only(left: 50, bottom: 30, top: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.deepOrange.shade100,
                spreadRadius: 1,
                blurRadius: 20,
              )
            ],
          ),
          child: ElevatedButton(
            child: Container(
              width: 200,
              height: 50,
              child: Center(child: Text('Guardar')),
            ),
            
            onPressed: () {
              final ticketmap = Faqs(pregunta: 'Pregunta: '+txtPregunta.text, 
              respuesta: 'Respuesta: '+txtRespuesta.text,).toMap();

               FirebaseFirestore.instance.collection('faqs').add(ticketmap);
               
               txtPregunta.text = "";
               txtRespuesta.text = "";
               
               Navigator.of(context).restorablePush(_dialogBuilder);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        
        SizedBox(height: 40),
        
      ],
    );
  }
}