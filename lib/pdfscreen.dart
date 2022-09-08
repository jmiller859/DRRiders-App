import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PDFLaunch extends StatefulWidget {
  final int index;
  final String title;
  const PDFLaunch(this.index, this.title, {super.key});

  @override
  _PDFLaunch createState() => _PDFLaunch();
}

class _PDFLaunch extends State<PDFLaunch> {
  static final asset =['assets/FCRsetup.pdf', 'assets/FCRInstall.pdf','assets/TM40.pdf','assets/MaintenanceSchedule.pdf','assets/Procedures.pdf'
      'assets/WearLimits.pdf','assets/ExplodedViews.pdf','assets/LubeSystem.pdf','assets/ElectricalSystem.pdf','assets/WCHRouting.pdf'];
  late PDFDocument document;
  bool _isLoading = true;

  loadDocument() async {
    document = await PDFDocument.fromAsset(asset[widget.index]);
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child:
      _isLoading ? const Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,) //Large file
      ),
    );
  }
}