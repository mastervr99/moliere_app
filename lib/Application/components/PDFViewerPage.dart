import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PDFViewerPage extends StatefulWidget {
  final PDFDocument document;
  PDFViewerPage({required this.document});

  @override
  _PDFViewerPage_State createState() => _PDFViewerPage_State();
}

class _PDFViewerPage_State extends State<PDFViewerPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: PDFViewer(
          controller: pageController,
          document: widget.document,
          scrollDirection: Axis.vertical,
          lazyLoad: false,
        ),
      ),
    );
  }
}
