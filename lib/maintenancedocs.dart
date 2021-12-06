import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'carbs.dart';
import 'engineDisassembly.dart';

class Maintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Maintenance Materials')
        ),
        body: ListView(children: <Widget>[
          ListTile(
              title: Text('Maintenance Schedule'),
              subtitle: Text("As per Suzuki's recommendations"),
              onTap: () {_navigateToSchedule(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Tune Up Specs'),
            onTap: () {_navigateToTuneUpSpecs(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Tune Up Procedures'),
            subtitle: Text('As outlined by the service manual'),
            onTap: () {_navigateToMaintenanceProcedures(context);}
          ),
          Divider(),
          ListTile(
            title: Text('Torque Tables'),
            onTap: () {_navigateToTorqueTable(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Carburetors'),
            subtitle: Text('OEM & Aftermarket Options'),
            onTap: () {_navigateToCarburetors(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Lubrication Points'),
            subtitle: Text('Not just the chain'),
            onTap: () {_navigateToLubricationPoints(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Engine Disassembly Guides'),
            onTap: () {_navigateToEngineDisassembly(context);},
          ),
          Divider(),
          ListTile(
              title: Text('Engine Data & Wear Limits'),
            onTap: () {_navigateToServiceData(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Consumable Parts & Bearing List'),
            subtitle: Text('Cross-reference guide as well'),
            onTap: () {_navigateToCrossRef(context);}
          ),
          Divider(),
        ]
        )
    );
  }
  void _navigateToSchedule(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Schedule()));
  }
  void _navigateToEngineDisassembly(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => EngineDisassembly()));
  }
  void _navigateToTuneUpSpecs(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TuneUpSpecs()));
  }
  void _navigateToMaintenanceProcedures(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MaintenanceProcedures()));
  }
  void _navigateToTorqueTable(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TorqueTable()));
  }
  void _navigateToLubricationPoints(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LubePoints()));
  }
  void _navigateToCarburetors(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarbScreen()));
  }
  void _navigateToServiceData(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceData()));
  }
  void _navigateToCrossRef(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CrossRef()));
  }
}

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  static final asset ='assets/MaintenanceSchedule.pdf';
  PDFDocument document;
  bool _isLoading = true;

  loadDocument() async {
    document = await PDFDocument.fromAsset(asset);
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
        title: Text('Factory Maintenance Schedule'),
      ),
      body: Center(child:
      _isLoading ? Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,) //Large file
      ),
    );
  }
}

class TuneUpSpecs extends StatelessWidget {
  final _asset = 'assets/OilChart.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tune Up Specs'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Valves', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Intake Valve Clearance', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('0.08-0.13mm (0.003-0.005")', textAlign: TextAlign.right))))
                        ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Exhaust Valve Clearance', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('0.17-0.22mm (0.007-0.009")', textAlign: TextAlign.right))))
                      ]
                      )
                    ]
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Set valve clearances with a completely cold engine at TDC of compression stroke\n'
                      'Center the timing line next to the "T" mark on the rotor in the timing view port for best results', textScaleFactor: 0.80, textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Misc Engine', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Spark Plug Gap', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('0.7-0.8mm (0.028-0.031")', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Idle RPM', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('1500 +/- 100', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Exhaust Pipe Bolts Torque', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('19 ft-lbs, 26 N-m\n(Recommend Use Of Anti-Seize)', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Compression', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('120 psi, 850 kPa', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Pressure Above', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('4.3 psi, 30 kPa **', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Pressure Below', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10 psi, 70 kPa **', textAlign: TextAlign.right))))
                      ]
                      )
                    ]
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('** Checked at 3000 RPM, Oil temp at 140F, 60C', textScaleFactor: 0.80, textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Cables & Controls', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('"Push" Throttle Cable\n(Adjusted at the carburetor)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('3-4mm (0.12-0.16")', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('"Pull" Throttle Cable\n(Adjusted inline near the throttle grip)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('0.5-1mm (0.02-0.04")', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Clutch Cable\n(Measured at clutch lever ball)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10-15mm (0.4-0.6")', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Brake Fluid', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('DOT 4', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Brake Pedal Height\n(Distance below top of footpeg)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('5mm (0.2")', textAlign: TextAlign.right))))
                      ]
                      )
                    ]
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Engine Oil', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Change With Filter', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('2.0/1.67*** US/Imp Qts', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Drain Bolt Torque', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('17.5 ft-lbs, 24 N-m', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Filter Cover Bolts', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('4 ft-lbs, 5.5 N-m', textAlign: TextAlign.right))))
                      ]
                      )
                    ]
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('*** This is the generally accepted amount that riders have found the bike needs following an oil change,'
                      'The factory spec of 2300 mL (2.3 US Qts) results in the bike being SIGNIFICANTLY overfilled. When you do your oil change simply '
                      'ensure that the oil level is between the lines in the viewport on the clutch cover.', textScaleFactor: 0.80, textAlign: TextAlign.left,
                  ),
                ),
                Align(child: Image.asset(_asset), alignment: Alignment.center,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Wheels & Drive', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Drive Chain Play', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('30-40mm (1.2-1.8")\n (Measure inbetween drive sprockets)', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Drive Chain Wear Limit', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('319.4mm (12.6")\n (Measured across a 20 pin centerline)', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Axle Nut Torque (Castle Nut)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('72.5 ft-lbs, 100 N-m', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Axle Nut Torque (Self-Locking Nut)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('79.5 ft-lbs, 110 N-m', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Tire Tread Depth Limit', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('3mm (0.12")', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Front Tire Pressure (Solo)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('22 psi, 150 kPa', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Front Tire Pressure (Duo)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('25 psi, 175 kPa', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Tire Pressure (Solo)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('25 psi, 175 kPa', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Tire Pressure (Duo)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('29 psi, 200 kPa', textAlign: TextAlign.right))))
                      ]
                      )
                    ]
                ),),
              ]
          )
        )
        ));
  }
}

class MaintenanceProcedures extends StatefulWidget {
  @override
  _MaintenanceProceduresState createState() => _MaintenanceProceduresState();
}

class _MaintenanceProceduresState extends State<MaintenanceProcedures> {
  static final asset ='assets/Procedures.pdf';
  PDFDocument document;
  bool _isLoading = true;

  loadDocument() async {
    document = await PDFDocument.fromAsset(asset);
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
        title: Text('Factory Maintenance Procedures'),
      ),
      body: Center(child:
      _isLoading ? Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,)
      ),
    );
  }
}

class TorqueTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Torque Tables'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Engine', textScaleFactor: 1.5, textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table (
                border: TableBorder.all(color: Colors.white24, width: 1.0),
                children: [
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Item', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('ft-lbs', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('n-m', style: TextStyle(fontWeight: FontWeight.bold))))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cam Chain Tensioner Cap Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('4.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cam Chain Tensioner Mounting Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cam Chain Tensioner Fitting Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('9.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Camshaft Sprocket Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('15')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Clutch Hub Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('36.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('50')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Clutch Spring Mounting Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Crankcase Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('8.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Crankshaft Bearing Retaining Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('58.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('80')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Valve Cover Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cylinder Head Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('27.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('38')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cylinder Head Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('18.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('25')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cylinder Base Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Oil Drain Plug Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Countershaft Sprocket Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('4.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Mounting Bolt (M8)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('29.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('40')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Mounting Bolt (M10)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('47.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('65')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Mounting Bracket Bolts (Front & Upper)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('29.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('40')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Mounting Bracket Bolt (Rear)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Cooler Hose Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Oil Pipe Union Bolt (Cylinder Head)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Engine Oil Pipe Hose Bolt (Crank Case)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('14.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('20')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Exhaust Header-Flange Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('19.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('26')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Gearshift Arm Stopper')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('19')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Generator Cover Plug')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('25')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Generator Rotor Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('115.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('160')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Gallery Plug')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Jet Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Primary Drive Gear Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('72.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('100')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Spark Plug')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('8.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Starter Clutch Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('18.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('25')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Timing View Port Plug')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                ]
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Chassis', textScaleFactor: 1.5, textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table (
                border: TableBorder.all(color: Colors.white24, width: 1.0),
                children: [
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Item', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('ft-lbs', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('n-m', style: TextStyle(fontWeight: FontWeight.bold))))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Brake Bleeder Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('8')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Caliper Axle Bolt, Front')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Caliper Axle Bolt, Rear')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('9.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Caliper Mounting Bolt, Front')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('19.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('26')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Brake Disc Mounting Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Brake Hose Banjo Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Master Cylinder Mounting Bolt, Front & Rear')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Brake Pad Mounting Pin, Front & Rear')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('18')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Front Brake Mounting Pin Plug')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('1.8')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('0.25')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rod Lock Nut, Rear Brake')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('18')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Lower Chain Roller Mounting Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('29.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('40')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Upper Chain Roller Mounting Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('REMOVE!')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('RISK OF FRAME DAMAGE')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Front Axle')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('47.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('65')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Front Axle Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Fork Damper Rod Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('21.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('30')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Lower Fork Clamp Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('19.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('26')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Upper Fork Clamp Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('21.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('29')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Fork Leg Cap')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Steering Stem Head Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('65.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('90')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Handlebar Clamp Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Hadlebar Holder Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('18.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('25')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Footpeg Mount Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('28.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('39')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Swingarm Pivot Axle Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('55.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('77')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Shock Mounting Bolt, Upper & Lower')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('40.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('55')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Shock Linkage Nut (Front)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('58.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('80')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Shock Linkage Lever Nut (Rear)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('72.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('100')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Shock Rod Nut')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('72.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('100')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Axle Nut (Castle Nut Style)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('72.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('100')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Axle Nut (Fuji Nut Style)')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('79.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('110')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Sprocket Mounting Bolt')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('19.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('27')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Spoke Nipple')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('3.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('0.45')))),
                    ]
                  ),
                  ]
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Other Conventional or "4" Marked Bolts', textScaleFactor: 1.5, textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table (
                border: TableBorder.all(color: Colors.white24, width: 1.0),
                children: [
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Bolt Diam', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('ft-lb', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('n-m', style: TextStyle(fontWeight: FontWeight.bold))))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M4')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('1.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('1.5')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('2.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('3')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M6')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('4.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('5.5')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M8')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('9.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M10')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('21.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('29')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M12')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('32.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('45')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M14')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('47.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('65')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M16')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('76.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('105')))),
                    ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M18')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('115.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('160')))),
                  ]
                  ),
            ]
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Other "7" Marked Bolts', textScaleFactor: 1.5, textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table (
                border: TableBorder.all(color: Colors.white24, width: 1.0),
                children: [
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Bolt Diam', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('ft-lb', style: TextStyle(fontWeight: FontWeight.bold))))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('n-m', style: TextStyle(fontWeight: FontWeight.bold))))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M4')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('1.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('2.3')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('3.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('4.5')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M6')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('7.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('10')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M8')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('23')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M10')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('36.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('50')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M12')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('61.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('85')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M14')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('97.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('135')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M16')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('152.0')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('210')))),
                  ]
                  ),
                  TableRow( children: <Widget> [
                    TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('M18')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('173.5')))),
                    TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('240')))),
                  ]
                  ),
                ]
            ))
            ]
          )
    )
    )
    );
  }
}


class LubePoints extends StatelessWidget {
  final _asset = 'assets/LubePoints.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Lubrication Points')
        ),
        body: InteractiveViewer(
            constrained: false,
            minScale: 0.1,
            child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(_asset),
              ],
            )
        )
    ));
  }
}

class ServiceData extends StatefulWidget {
  @override
  _ServiceDataState createState() => _ServiceDataState();
}

class _ServiceDataState extends State<ServiceData> {
  static final asset ='assets/WearLimits.pdf';
  PDFDocument document;
  bool _isLoading = true;

  loadDocument() async {
    document = await PDFDocument.fromAsset(asset);
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
        title: Text('Engine Data & Wear Limits'),
      ),
      body: Center(child:
      _isLoading ? Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,)
      ),
    );
  }
}

class CrossRef extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Parts By Job')
        ),
        body: InteractiveViewer( child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Oil Change', textScaleFactor: 1.25, textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table(
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow(children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Filter', textAlign: TextAlign.left)))),
                      TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16510-37450', textAlign: TextAlign.right))))
                        ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Filter Sealing O-Ring', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09280-15007', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Filter Cover O-Ring', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09280-72001', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Drain Bolt Sealing Washer', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09168-14004', textAlign: TextAlign.right))))
                      ]
                      ),
                    ],
                  ),),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('BST-40 Repair', textScaleFactor: 1.25, textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Table(
                      border: TableBorder.all(color: Colors.white24, width: 1.0),
                      children: [
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Float Bowl Gasket', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13258-44B00', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Diaphragm Cover Vacuum Port O-Ring', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13278-02340', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Pilot Screw O-Ring', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13295-29900', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Float Assembly O-Ring #1', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13374-46710', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Float Assembly O-Ring #2', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13374-35C00', textAlign: TextAlign.right))))
                        ]
                        ),
                      ]
                  ),),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Clutch/NSU Repair', textScaleFactor: 1.25, textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Table(
                      border: TableBorder.all(color: Colors.white24, width: 1.0),
                      children: [
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Clutch Hub Bending Washer', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09169-20005', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Clutch Cover Gasket', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11482-32E00', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Cooler Hose O-Ring', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09280-12012', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Pump Idler Gear\n(Inspect and replace if worn)', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16321-32E00', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Float Assembly O-Ring #2', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('13374-35C00', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Filter', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('16510-37450', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Filter Sealing O-Ring', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09280-15007', textAlign: TextAlign.right))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Filter Cover O-Ring', textAlign: TextAlign.left)))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09280-72001', textAlign: TextAlign.right))))
                        ]
                        ),
                      ]
                  ),),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Cam Chain Tensioner Leak', textScaleFactor: 1.25, textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Table(
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('CCT Gasket', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('12837-24A10', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Exhaust Port Gasket\n(Optional)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('14181-22D01', textAlign: TextAlign.right))))
                      ]
                      ),
                    ],
                  ),),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Base Gasket Replacement', textScaleFactor: 1.25, textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Table(
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('CCT Gasket', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('12837-24A10', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Exhaust Port Gasket', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('14181-22D01', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Valve Cover Inspection O-Ring (x2)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11177-44B01', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Crank Bolt Access O-Ring', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09280-33004', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Timing Port Sealing Washer', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09168-14004', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Head Gasket', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11141-32E00', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Base Gasket', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('11241-04F20', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cam Journal Sealing Plug', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09241-25007', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cylinder Head Sealing Washers (x4)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09168-10017', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cylinder Cap Bolt Seals (x2)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09168-06023', textAlign: TextAlign.right))))
                      ]
                      ),
                      TableRow(children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Oil Cooler Hose O-Ring (x2)', textAlign: TextAlign.left)))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09280-12012', textAlign: TextAlign.right))))
                      ]
                      ),
                    ],
                  ),),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Chassis Bearings', textScaleFactor: 1.25, textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Table(
                      border: TableBorder.all(color: Colors.white24, width: 1.0),
                        children: [
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Location')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('OEM #')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Standard #'))))
                        ]
                      ),
                          TableRow(children: <Widget> [
                            TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Front Wheel (x2)')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('08123-60037')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6003 RS2'))))
                          ]
                          ),
                          TableRow(children: <Widget> [
                            TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Rear Wheel (x2)')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('08123-62047')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6204 RS2'))))
                          ]
                          ),
                          TableRow(children: <Widget> [
                            TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Cush Hub')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-25061')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6205 RS2'))))
                          ]
                          ),
                          TableRow(children: <Widget> [
                            TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Steering Head')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09265-30014')))),
                            TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('CR0643L'))))
                          ]
                          ),
                    ]
                  ),),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Engine Bearings', textScaleFactor: 1.25, textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Table(
                      border: TableBorder.all(color: Colors.white24, width: 1.0),
                      children: [
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Location')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('OEM #')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Standard #'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Main RH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-40008')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6208'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Main LH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-45011')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6209'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Balancer Shaft RH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-22029')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('63/22'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Balancer Shaft LH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-20121')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6204'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Trans Input Shaft RH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-22028')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('OEM ONLY!'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Trans Input Shaft LH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-17046')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6203 RS1'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Trans Output Shaft RH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-20059')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6004 RS1'))))
                        ]
                        ),
                        TableRow(children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('Trans Output Shaft LH')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('09262-25125')))),
                          TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: const EdgeInsets.all(4.0), child: Text('6305 RS1'))))
                        ]
                        ),
                      ]
                  ),),
                ]
            )
        )
    ));
  }
}