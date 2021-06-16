import 'dart:js';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdesk/Models/datosUsuario.dart';
import 'package:provider/provider.dart';

class Authservice {
  final _auth = FirebaseAuth.instance;

  Future<User> singIn(String correo, String contrasena) async {
    User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
              email: correo.trim(), password: contrasena))
          .user;
    } catch (e) {
      print(e.toString());
    }
    return user!;
  }

  Future<UserCredential> register(String correo, String contrasena) async {
    return _auth.createUserWithEmailAndPassword(
        email: correo, password: contrasena);
  }
}

class UsuarioService {
  CollectionReference usuariosRef =
      FirebaseFirestore.instance.collection(Usuario.collectionId);

  Future<void> create(Usuario usuario) async {
    await usuariosRef.add(usuario.toMap());
  }

  Future<Usuario> getById(String uid) async {
    Usuario usuario;
    DocumentSnapshot<dynamic> documentSnapshot =
        await usuariosRef.doc(uid).get();
    if (documentSnapshot.exists) {
      usuario =
          Usuario.fromSnapshot(documentSnapshot.id, documentSnapshot.data());
    }
    return Usuario();
  }
//Retornar un map

  Future<bool> login(BuildContext context, Usuario usuario) async {
    final peticion = FirebaseFirestore.instance
        .collection('usuarios')
        .where('correo', isEqualTo: usuario.correo)
        .where('contrasena', isEqualTo: usuario.contrasena);

    return peticion.get().then((value) {
      final Map user = value.docs.first.data();
      print(user['tipoUsuario']);

      if (value.size == 0) return false;
      return true;
    });
  }

  Future<List<Usuario>> get() async {
    QuerySnapshot<dynamic> querySnapshot = await usuariosRef.get();
    return querySnapshot.docs
        .map((ds) => Usuario.fromSnapshot(ds.id, ds.data()))
        .toList();
  }
}
