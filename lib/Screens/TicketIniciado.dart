import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget{
  final img;
  DisplayWidget(this.img);
  @override 
    Widget build(BuildContext context){
      return Container(
        child: Center(
          child: Image.asset(img),
          ),
      );
    }
}