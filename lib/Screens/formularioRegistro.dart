import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesk/Models/datosUsuario.dart';
import 'package:flutterdesk/Providers/menuProvider.dart';
import 'package:flutterdesk/Services/auth.dart';
import 'package:provider/provider.dart';

class RegistroUsuario extends StatefulWidget {
  @override
  _RegistroUsuarioState createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  UsuarioService usuarioService = UsuarioService();
  Usuario usuario = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF8A65),
      body: Container(
        child: Center(
          child: Card(
            color: Colors.deepOrange.shade100,
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 130, vertical: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: double.infinity,
              height: 650.0,
              child: Padding(
                padding: EdgeInsets.all(35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Crear Cuenta ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 30,
                      child: Divider(
                        color: Colors.deepOrange,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 100, left: 120),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Ingrese su nombre',
                            labelText: 'Tupac',
                            suffixIcon: Icon(
                              Icons.assignment_ind_rounded,
                            ),
                            icon: Icon(Icons.group_outlined)),
                        onChanged: (value) {
                          setState(() => usuario.nombre = value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 100, left: 120),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ingrese su apellido',
                          labelText: 'Shakour',
                          suffixIcon: Icon(
                            Icons.assignment_ind_rounded,
                          ),
                          icon: Icon(Icons.group_outlined),
                        ),
                        onChanged: (value) {
                          setState(() => usuario.apellido = value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 100, left: 120),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Ingrese su correo electronico',
                            labelText: 'tupachakour@amaru.sk',
                            suffixIcon: Icon(
                              Icons.contact_mail_rounded,
                            ),
                            icon: Icon(Icons.attach_email_outlined)),
                        onChanged: (value) {
                          setState(() => usuario.correo = value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 100, left: 120),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Ingrese una contraseña',
                            labelText: '_Shakour123456',
                            suffixIcon: Icon(
                              Icons.lock_rounded,
                            ),
                            icon: Icon(Icons.lock_open_rounded)),
                        onChanged: (value) {
                          setState(() => usuario.contrasena = value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 100, left: 120),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Tipo de usuario',
                            labelText: 'Administrativo / Usuario',
                            suffixIcon: Icon(
                              Icons.badge,
                            ),
                            icon: Icon(Icons.group_outlined)),
                        onChanged: (value) {
                          setState(() => usuario.tipoUsuario = value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('Crear Cuenta'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          String message = '';
                          try {
                            await usuarioService.create(usuario);
                            setState(() {
                              usuario = new Usuario();
                            });
                            message = 'Usuario guardado correctamente';
                          } catch (e) {
                            message = 'Ocurrió un error';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'Login'),
                              child: Text(
                                "Regresar al login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
