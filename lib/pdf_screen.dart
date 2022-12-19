import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  String pdfUrl;
  PdfScreen({Key? key, required this.pdfUrl}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PdfScreenState();
  }

}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.network(widget.pdfUrl));
  }

}
