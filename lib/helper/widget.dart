import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myAppBar() {
  final black = Colors.black;
  return AppBar(
    title: Row(
      children: <Widget>[
        Text(
          "Artikel",
          style: TextStyle(color: black),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}