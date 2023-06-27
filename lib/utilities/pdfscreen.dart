import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PDFLaunch extends StatefulWidget {
  final int index;
  final String title;
  const PDFLaunch(this.index, this.title, {super.key});

  @override
  _PDFLaunch createState() => _PDFLaunch();
}

class _PDFLaunch extends State<PDFLaunch> {
  static final asset =['assets/FCRsetup.pdf', 'assets/FCRInstall.pdf','assets/TM40.pdf','assets/MaintenanceSchedule.pdf','assets/Procedures.pdf',
      'assets/WearLimits.pdf','assets/ExplodedViews.pdf','assets/LubeSystem.pdf','assets/ElectricalSystem.pdf','assets/WCHRouting.pdf'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pdfPinchController = PdfControllerPinch(document: PdfDocument.openAsset(asset[widget.index]));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PdfViewPinch(controller: pdfPinchController,
      ),
    );
  }
}