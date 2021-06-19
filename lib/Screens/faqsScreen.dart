import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesk/Models/faqs.dart';
import 'package:provider/provider.dart';





class FaqsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          //centerTitle: true,
          
          flexibleSpace: Container(
            
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: AssetImage('imagenes/q.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            
          ),
          
          backgroundColor: Colors.deepOrange,
          
          title: Text("Preguntas y Respuestas Frecuentes",
          style: TextStyle(fontSize: 50,)),
          
        ),
        
        
      ),
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('faqs').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
  
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                width: 800,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10,
                  vertical: MediaQuery.of(context).size.width / 35),
            
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.only(

                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),

                  ),
                  gradient: LinearGradient(

                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.deepOrange.shade100
                    ]
                  ),
                  
                ),
                child: SingleChildScrollView(
                child: Column(
                  
                  children: [
                    
                    SizedBox(
                      height: 50,
                    ),
                    Text(document['Pregunta'],  
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    SizedBox(
                      height: 15,
                    ),
                    Text(document['Respuesta'], 
                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
                    
                    
                  ],
                
                )
                
                )  
                
              );
            }).toList(),
          );
        },
      ),
    );

  }

}