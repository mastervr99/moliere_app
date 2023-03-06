import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moliere_app/Application/common_widgets/Appbar_Widget.dart';
import 'package:moliere_app/Application/common_widgets/Circular_Progress_Widget.dart';
import 'package:moliere_app/Application/common_widgets/Search_Widget.dart';
import 'package:moliere_app/Application/components/PDFViewerPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_Screen_State createState() => _Home_Screen_State();
}

// get_doc() async {
//   PDFDocument doc =
//       await PDFDocument.fromAsset('assets/ebooks/Les_Amants_magnifiques.pdf');
//   // return await doc;

//   return FutureBuilder(
//     future: PDFDocument.fromAsset('assets/ebooks/Les_Amants_magnifiques.pdf'),
//     builder: (context, AsyncSnapshot snapshot) {
//       // var doc = snapshot.data;
//       var doc = true;

//       if (doc) {
//         return AlertDialog(
//           content: Text("data"),
//         );
//         // return SizedBox(
//         //   height: MediaQuery.of(context).size.height,
//         //   width: MediaQuery.of(context).size.width,
//         //   child: Center(
//         //     child: PDFViewer(document: doc),
//         //   ),
//         // );
//         // } else if (snapshot.hasError) {
//         //   return AlertDialog(
//         //     content: Text("error"),
//         //   );

//         //   // return Text('Error: ${snapshot.error}');
//       } else {
//         return Circular_Progress_Widget();
//       }
//     },
//   );
// }

class _Home_Screen_State extends State<Home_Screen> {
  void loadDocument(BuildContext context) async {
    PDFDocument document =
        await PDFDocument.fromAsset('assets/ebooks/Les_Amants_magnifiques.pdf');
    // Open the PDF viewer page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerPage(document: document),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: Appbar_Widget(context),
    //   body: Container(
    //       width: double.infinity,
    //       height: double.infinity,
    //       color: Colors.white70,
    //       child: Column(
    //         children: [
    //           //Search_Widget(),
    //           Expanded(
    //             child: ListView(
    //               children: [
    //                 // Text("TEST"),
    //                 // ElevatedButton(
    //                 //   child: Text(('Book')),
    //                 //   onPressed: () async {
    //                 //     return get_doc();
    //                 //     // FutureBuilder(
    //                 //     //   future: get_doc(),
    //                 //     //   builder: (context, AsyncSnapshot snapshot) {
    //                 //     //     var doc = snapshot.data;

    //                 //     //     if (snapshot.hasData) {
    //                 //     //       return AlertDialog(
    //                 //     //         content: Text("data"),
    //                 //     //       );
    //                 //     //       // return SizedBox(
    //                 //     //       //   height: MediaQuery.of(context).size.height,
    //                 //     //       //   width: MediaQuery.of(context).size.width,
    //                 //     //       //   child: Center(
    //                 //     //       //     child: PDFViewer(document: doc),
    //                 //     //       //   ),
    //                 //     //       // );
    //                 //     //     } else if (snapshot.hasError) {
    //                 //     //       return AlertDialog(
    //                 //     //         content: Text("error"),
    //                 //     //       );

    //                 //     //       // return Text('Error: ${snapshot.error}');
    //                 //     //     } else {
    //                 //     //       return Circular_Progress_Widget();
    //                 //     //     }
    //                 //     //   },
    //                 //     // );
    //                 //   },
    //                 // ),
    //                 ElevatedButton(
    //                   onPressed: () {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => PdfViewPage(
    //                           pdfPath:
    //                               'assets/ebooks/Les_Amants_magnifiques.pdf',
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                   child: Text('Open PDF'),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       )),
    // );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Home Page'),
    //   ),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => PdfViewPage(
    //               pdfPath: 'assets/ebooks/Les_Amants_magnifiques.pdf',
    //             ),
    //           ),
    //         );
    //       },
    //       child: Text('Open PDF'),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            loadDocument(context);
          },
          child: Text('Open PDF'),
        ),
      ),
    );
  }
}
