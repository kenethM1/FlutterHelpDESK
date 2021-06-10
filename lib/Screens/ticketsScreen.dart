import 'package:flutter/material.dart';

//int _value = 1;

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

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
          _newTicket(title: 'Crear un nuevo ticket', isActive: true),
        ],
      ),
    );
  }
}

Widget _newTicket({String? title, bool isActive = false}) {
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

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Alta';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Alta', 'Media', 'Baja']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
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
                'Generando nuevo ticket',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'imagenes/ticket.png',
                width: 360,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _loginCuentasPropias(image: 'imagenes/gmail-logo-16.png'),
                  _loginCuentasPropias(image: 'imagenes/facebook-logo-20.png'),
                  _loginCuentasPropias(image: 'imagenes/twitter-logo-20.png'),
                ],
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
            child: _datosTicket(),
          ),
        )
      ],
    );
  }

  Widget _datosTicket() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'Titulo',
              suffixIcon: Icon(Icons.format_align_left, color: Colors.grey),
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
            hintText: 'Descripcion',
            suffixIcon: Icon(Icons.format_align_left_sharp, color: Colors.grey),
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
        TextField(
          decoration: InputDecoration(
            hintText: 'Categoria',
            suffixIcon: Icon(Icons.format_align_left, color: Colors.grey),
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
        MyStatefulWidget(),
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
              child: Center(child: Text('Crear Ticket')),
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
        SizedBox(height: 40),
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
