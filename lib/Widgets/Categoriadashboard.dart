import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutterdesk/Providers/CategoriaProvider.dart';
import 'package:provider/provider.dart';

class CategoriaDashBoard extends StatelessWidget {
  final String? title;
  const CategoriaDashBoard({Key? key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titulo = TextStyle(
        color: Colors.red,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.5);
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: size.width * 0.32,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title!,
                      style: titulo,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                )
              ],
            ),
            width: size.width * 0.3,
            height: 60,
          ),
          Expanded(child: PieChart(sampleData1(context)))
        ],
      ),
    );
  }

  PieChartData sampleData1(BuildContext context) {
    final ticket = Provider.of<CategoriaProvider>(context);
    TextStyle titulos = TextStyle(
      color: Colors.white,
      fontSize: 25,
    );
    return PieChartData(sections: [
      PieChartSectionData(
          title: ticket.software.toString(),
          value: ticket.software,
          color: Colors.red,
          badgePositionPercentageOffset: 2.5,
          titleStyle: titulos,
          badgeWidget: Badge(
            titulo: 'Software',
            color: Colors.red,
          )),
      PieChartSectionData(
          title: ticket.hardware.toString(),
          value: ticket.hardware,
          color: Colors.greenAccent,
          badgePositionPercentageOffset: 2.5,
          titleStyle: titulos,
          badgeWidget: Badge(
            titulo: 'Hardware',
            color: Colors.greenAccent,
          )),
      PieChartSectionData(
          title: ticket.red.toString(),
          value: ticket.red,
          color: Colors.orange,
          badgePositionPercentageOffset: 2.5,
          titleStyle: titulos,
          badgeWidget: Badge(
            titulo: 'Red',
            color: Colors.orange,
          ))
    ], centerSpaceRadius: 60);
  }
}

class Badge extends StatelessWidget {
  final String? titulo;
  final Color? color;

  const Badge({Key? key, @required this.titulo, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(titulo!),
        Container(
          width: 30,
          height: 30,
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
