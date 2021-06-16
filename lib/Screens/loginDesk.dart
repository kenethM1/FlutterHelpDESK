import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterdesk/Models/datosUsuario.dart';
import 'package:flutterdesk/Services/auth.dart';

class LoginDesk extends StatefulWidget {
  const LoginDesk({Key? key}) : super(key: key);

  @override
  _LoginDeskState createState() => _LoginDeskState();
}

class _LoginDeskState extends State<LoginDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6948),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Menu(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _LoginItems(title: 'Iniciar Sesión', isActive: true),
          _loginRegistrar(context),
        ],
      ),
    );
  }
}

Widget _LoginItems({String? title, bool isActive = false}) {
  return Padding(
    padding: EdgeInsets.only(right: 75),
    child: Column(
      children: [
        Text(
          '$title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.deepOrange : Colors.grey,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        isActive
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30)),
              )
            : SizedBox()
      ],
    ),
  );
}

Widget _loginRegistrar(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200, spreadRadius: 8, blurRadius: 12)
        ]),
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, 'Registro');
      },
      child: Text(
        'Crear Cuenta',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    ),
  );
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var usuario = new Usuario();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingrese sus datos\n HelpDesk',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Todavia no tienes una cuenta',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tu puedes',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Registrate aqui',
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image.asset(
                    'imagenes/Login-amico.png',
                    width: 300,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 6),
              child: Container(
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() => usuario.correo = value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Ingrese su correo electronico',
                          suffixIcon: Icon(Icons.account_circle_rounded,
                              color: Colors.grey),
                          fillColor: Colors.deepOrange.shade100,
                          filled: true,
                          labelStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
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
                      onChanged: (value) {
                        setState(() => usuario.contrasena = value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Ingrese la contraseña',
                        counterText: 'Olvidaste la contraseña',
                        suffixIcon: Icon(Icons.visibility_off_outlined,
                            color: Colors.grey),
                        fillColor: Colors.deepOrange.shade100,
                        filled: true,
                        labelStyle: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        contentPadding: EdgeInsets.only(left: 72),
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
                          width: double.infinity,
                          height: 50,
                          child: Center(child: Text('Iniciar Sesión')),
                        ),
                        onPressed: () async {
                          final login = new UsuarioService();
                          bool isSignIn = await login.login(context, usuario);

                          if (isSignIn == false) {
                            showDialog(
                              context: context,
                              builder: (context) => Center(
                                child: Text('No esta registrado'),
                              ),
                            );
                          } else
                            Navigator.pushNamed(context, 'Tickets');
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
