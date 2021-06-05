import 'package:flutter/material.dart';

class LoginDesk extends StatelessWidget {
  const LoginDesk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12),
        children: [
          Menu(),
          Body(),
        ],
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
          _LoginItems(title: 'Iniciar Sesion', isActive: true),
          _loginRegistrar(),
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

Widget _loginRegistrar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200, spreadRadius: 10, blurRadius: 12)
        ]),
    child: Text(
      'Registarse',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                height: 30,
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
                    width: 15,
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
                width: 360,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 10),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 300,
            child: _loginDatos(),
          ),
        )
      ],
    );
  }

  Widget _loginDatos() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'Ingrese su correo electronico',
              suffixIcon:
                  Icon(Icons.account_circle_rounded, color: Colors.grey),
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
          decoration: InputDecoration(
            hintText: 'Ingrese la contraseña',
            counterText: 'Olvidaste la contraseña',
            suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
            fillColor: Colors.deepOrange.shade100,
            filled: true,
            labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
              child: Center(child: Text('Iniciar Secion')),
            ),
            onPressed: () {},
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
        Row(
          children: [
            Expanded(
              child: Divider(height: 50, color: Colors.grey.shade300),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Registrate con'),
            ),
            Expanded(
              child: Divider(
                height: 50,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _loginCuentasPropias(image: 'imagenes/gmail-logo-16.png'),
            _loginCuentasPropias(image: 'imagenes/facebook-logo-20.png'),
            _loginCuentasPropias(image: 'imagenes/twitter-logo-20.png'),
          ],
        ),
      ],
    );
  }

  Widget _loginCuentasPropias({String? image}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 90,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade400)),
      child: Center(
        child: Container(
          child: Image.asset('$image', width: 40),
        ),
      ),
    );
  }
}
