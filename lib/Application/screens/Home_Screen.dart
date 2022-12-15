import 'package:flutter/material.dart';
import 'package:moliere_app/Application/common_widgets/Appbar_Widget.dart';
import 'package:moliere_app/Application/common_widgets/Circular_Progress_Widget.dart';
import 'package:moliere_app/Application/common_widgets/Search_Widget.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_Screen_State createState() => _Home_Screen_State();
}

class _Home_Screen_State extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_Widget(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Search_Widget(),
      ),
    );
  }
}
