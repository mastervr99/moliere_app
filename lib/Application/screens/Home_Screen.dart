import 'package:flutter/material.dart';
import 'package:moliere_app/Application/common_widgets/Appbar_Widget.dart';
import 'package:moliere_app/Application/common_widgets/Circular_Progress_Widget.dart';
import 'package:moliere_app/Application/common_widgets/Search_Widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_Screen_State createState() => _Home_Screen_State();
}

get_doc() async {
  PDFDocument doc =
      await PDFDocument.fromAsset('assets/ebooks/Les_Amants_magnifiques.pdf');
  // return await doc;

  return FutureBuilder(
    future: PDFDocument.fromAsset('assets/ebooks/Les_Amants_magnifiques.pdf'),
    builder: (context, AsyncSnapshot snapshot) {
      var doc = snapshot.data;

      if (snapshot.hasData) {
        return AlertDialog(
          content: Text("data"),
        );
        // return SizedBox(
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   child: Center(
        //     child: PDFViewer(document: doc),
        //   ),
        // );
      } else if (snapshot.hasError) {
        return AlertDialog(
          content: Text("error"),
        );

        // return Text('Error: ${snapshot.error}');
      } else {
        return Circular_Progress_Widget();
      }
    },
  );
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
              //Search_Widget(),
              Expanded(
                child: ListView(
                  children: [
                    Text("TEST"),
                    ElevatedButton(
                      child: Text(('Book')),
                      onPressed: () async {
                        return get_doc();
                        // FutureBuilder(
                        //   future: get_doc(),
                        //   builder: (context, AsyncSnapshot snapshot) {
                        //     var doc = snapshot.data;

                        //     if (snapshot.hasData) {
                        //       return AlertDialog(
                        //         content: Text("data"),
                        //       );
                        //       // return SizedBox(
                        //       //   height: MediaQuery.of(context).size.height,
                        //       //   width: MediaQuery.of(context).size.width,
                        //       //   child: Center(
                        //       //     child: PDFViewer(document: doc),
                        //       //   ),
                        //       // );
                        //     } else if (snapshot.hasError) {
                        //       return AlertDialog(
                        //         content: Text("error"),
                        //       );

                        //       // return Text('Error: ${snapshot.error}');
                        //     } else {
                        //       return Circular_Progress_Widget();
                        //     }
                        //   },
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
