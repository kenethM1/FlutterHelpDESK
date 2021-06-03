import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  final String? title;
  const DashBoard({
    Key? key,
    @required this.title,
  }) : super(key: key);

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
            //color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title!,
                      style: titulo,
                    ),
                  ],
                )
              ],
            ),
            width: size.width * 0.3,
            height: 60,
          ),
          Expanded(child: PieChart(sampleData1()))
        ],
      ),
    );
  }

  PieChartData sampleData1() {
    TextStyle titulos = TextStyle(color: Colors.white, fontSize: 25);
    return PieChartData(sections: [
      PieChartSectionData(
          title: '5',
          value: 5,
          color: Colors.red,
          badgePositionPercentageOffset: 2.5,
          titleStyle: titulos,
          badgeWidget: Badge(
            titulo: 'Abiertos',
            color: Colors.red,
          )),
      PieChartSectionData(
          title: '7',
          value: 7,
          color: Colors.greenAccent,
          badgePositionPercentageOffset: 2.5,
          titleStyle: titulos,
          badgeWidget: Badge(
            titulo: 'Asignados',
            color: Colors.greenAccent,
          )),
      PieChartSectionData(
          title: '4',
          value: 4,
          color: Colors.orange,
          badgePositionPercentageOffset: 2.5,
          titleStyle: titulos,
          badgeWidget: Badge(
            titulo: 'Asignados',
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
