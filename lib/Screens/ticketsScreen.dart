import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdesk/Models/ticket.dart';
import 'package:flutterdesk/Providers/menuProvider.dart';
import 'package:provider/provider.dart';

String dropdownValuePrio = 'Alta';
String dropdownValueCategoria = 'Software';

Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) =>
        const AlertDialog(title: Text('Su ticket a sido enviado')),
  );
}

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: new ScrollController(),
            child: Container(
              height: size.height - 48.5,
              width: size.width,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12),
                children: [
                  Menu(),
                  Body(),
                ],
              ),
            ),
          ),
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

class ListaPrioridad extends StatefulWidget {
  const ListaPrioridad({Key? key}) : super(key: key);

  @override
  State<ListaPrioridad> createState() => _MyStatefulWidgetStatePrioridad();
}

class ListaCategoria extends StatefulWidget {
  const ListaCategoria({Key? key}) : super(key: key);

  @override
  State<ListaCategoria> createState() => _MyStatefulWidgetStateCategoria();
}

class _MyStatefulWidgetStatePrioridad extends State<ListaPrioridad> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Container(
        width: 450,
      ),
      focusColor: Colors.deepOrange,
      dropdownColor: Colors.deepOrange,
      value: dropdownValuePrio,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValuePrio = newValue!;
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

class _MyStatefulWidgetStateCategoria extends State<ListaCategoria> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Container(
        width: 450,
      ),
      dropdownColor: Colors.deepOrange.shade100,
      value: dropdownValueCategoria,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueCategoria = newValue!;
        });
      },
      items: <String>['Software', 'Hardware', 'Red']
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
          width: 700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '¿Necesitas ayuda? ¡Genera un nuevo ticket!',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'imagenes/ticket.png',
                width: 360,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 15),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 10),
          child: Container(
            width: 550,
            child: _datosTicket(context),
          ),
        )
      ],
    );
  }

  Widget _datosTicket(BuildContext context) {
    final txttitulo = TextEditingController();
    final txtdescripcion = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: txttitulo,
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
          controller: txtdescripcion,
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Descripcion',
            suffixIcon: Icon(Icons.format_align_left_sharp, color: Colors.grey),
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
        TextFormField(
          enabled: false,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 50, bottom: 30, top: 30),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'Categoria'),
        ),
        ListaCategoria(),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          enabled: false,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 50, bottom: 30, top: 30),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'Prioridad'),
        ),
        ListaPrioridad(),
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
              child: Center(child: Text('Crear Ticket')),
            ),
            onPressed: () {
              final menuProvider = Provider.of<ProviderMenu>(context);
              final ticketmap = Ticket(
                      categoria: dropdownValueCategoria,
                      descripcion: txtdescripcion.text,
                      estado: "Abierto",
                      prioridad: dropdownValuePrio,
                      titulo: txttitulo.text)
                  .toMap();

              FirebaseFirestore.instance.collection('tickets').add(ticketmap);

              menuProvider.opcionMenuSeleccionado = 0;

              txttitulo.text = "";
              txtdescripcion.text = "";
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
