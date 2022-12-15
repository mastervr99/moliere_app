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
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Search_Widget(),
                  SizedBox(
                    height: 15,
                    child: Container(
                      color: Color(0xFFf5f6f7),
                    ),
                  ),
                  // FutureBuilder(
                  //   future: get_girls_products(),
                  //   builder: (context, AsyncSnapshot snapshot) {
                  //     var products = snapshot.data;

                  //     if (snapshot.hasData) {
                  //       return Products_Slider_Widget(
                  //           products: products,
                  //           title: translate("label_girls_selection"));
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     } else {
                  //       return Circular_Progress_Widget();
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
