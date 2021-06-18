import 'package:flutter/material.dart';
import 'package:flutterdesk/Models/datosUsuario.dart';
import 'package:flutterdesk/Providers/menuProvider.dart';
import 'package:flutterdesk/Services/auth.dart';
import 'package:provider/provider.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
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
      padding: EdgeInsets.only(right: 100, bottom: 200, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          loginItems(title: 'Iniciar Sesión', isActive: true),
          _loginRegistrar(context),
        ],
      ),
    );
  }
}

Widget loginItems({String? title, bool isActive = false}) {
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
              color: Colors.grey.shade400, spreadRadius: 5, blurRadius: 12)
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
    final provider = Provider.of<ProviderMenu>(context);
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Registrate aqui',
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    'imagenes/Login-amico.png',
                    width: 300,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 600,
            ),
            Container(
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
                    obscureText: provider.isObscure,
                    onChanged: (value) {
                      setState(() => usuario.contrasena = value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Ingrese la contraseña',
                      suffixIcon: IconButton(
                          icon: Icon((provider.isObscure)
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                          onPressed: () =>
                              provider.verContra = !provider.isObscure,
                          color: Colors.grey),
                      fillColor: Colors.deepOrange.shade100,
                      filled: true,
                      labelStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
                        final menuProvider =
                            Provider.of<ProviderMenu>(context, listen: false);

                        final login = new UsuarioService();
                        CircularProgressIndicator();
                        Map isSignIn = await login.login(context, usuario);

                        menuProvider.setUserID = isSignIn['id'];

                        if (isSignIn['ok'] == false) {
                          buildShowDialogIfNotRegistered(context);
                        } else if (isSignIn['tipoUsuario'] ==
                            'Administrativo') {
                          Navigator.pushNamed(context, 'HomePage');
                        } else if (isSignIn['tipoUsuario'] == 'Empleado') {
                          Navigator.pushNamed(context, 'Tickets');
                        }
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
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialogIfNotRegistered(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      barrierColor: Colors.deepOrange.shade400.withOpacity(0.50),
      context: context,
      builder: (context) => Center(
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 50, color: Colors.deepOrange, spreadRadius: 5)
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: 500,
          height: 400,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: Image(
                      filterQuality: FilterQuality.high,
                      image: AssetImage('imagenes/Forgotpassword.png')),
                ),
                Text(
                  'No está registrado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
