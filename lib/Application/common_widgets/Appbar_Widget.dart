import 'package:flutter/material.dart';

PreferredSizeWidget Appbar_Widget(context) {
  return AppBar(
    backgroundColor: Color(0xFFAC252B),
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      "L'Illustre Théâtre de Molière",
    ),
    leading: (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
  );
}
