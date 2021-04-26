import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

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
            title: Text('Lubrication Points'),
            subtitle: Text('Not just the chain'),
            onTap: () {_navigateToLubricationPoints(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Carburetor Adjustment & Specs'),
            subtitle: Text('BST Magic'),
          ),
          Divider(),
          ListTile(
              title: Text('Service Data & Wear Limits')
          ),
          Divider(),
          ListTile(
            title: Text('OEM Parts & Bearing List'),
            subtitle: Text('Cross-reference guide as well'),
          ),
          Divider(),
        ]
        )
    );
  }
  void _navigateToSchedule(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Schedule()));
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
        body:  SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Valves', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Intake Valve Clearance', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('0.08-0.13mm (0.003-0.005")', textAlign: TextAlign.right)))
                        ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Exhaust Valve Clearance', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('0.17-0.22mm (0.007-0.009")', textAlign: TextAlign.right)))
                      ]
                      )
                    ]
                ),
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
                Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Spark Plug Gap', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('0.7-0.8mm (0.028-0.031")', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Engine Idle RPM', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1500 +/- 100', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Exhaust Pipe Bolts Torque', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('19 ft-lbs, 26 N-m\n(Recommend Use Of Anti-Seize)', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Compression', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('120 psi, 850 kPa', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Oil Pressure Above', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('4.3 psi, 30 kPa **', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Oil Pressure Below', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('10 psi, 70 kPa **', textAlign: TextAlign.right)))
                      ]
                      )
                    ]
                ),
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
                Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('"Push" Throttle Cable\n(Adjusted at the carburetor)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('3-4mm (0.12-0.16")', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('"Pull" Throttle Cable\n(Adjusted inline near the throttle grip)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('0.5-1mm (0.02-0.04")', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Clutch Cable\n(Measured at clutch lever ball)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('10-15mm (0.4-0.6")', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Brake Fluid', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('DOT 4', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Brake Pedal Height\n(Distance below top of footpeg)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('5mm (0.2")', textAlign: TextAlign.right)))
                      ]
                      )
                    ]
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Engine Oil', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Oil Change With Filter', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2.0/1.67*** US/Imp Qts', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Drain Bolt Torque', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('17.5 ft-lbs, 24 N-m', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Filter Cover Bolts', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('4 ft-lbs, 5.5 N-m', textAlign: TextAlign.right)))
                      ]
                      )
                    ]
                ),
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
                Table (
                    border: TableBorder.all(color: Colors.white24, width: 1.0),
                    children: [
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Drive Chain Play', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('30-40mm (1.2-1.8")\n (Measure inbetween drive sprockets)', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Drive Chain Wear Limit', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('319.4mm (12.6")\n (Measured across a 20 pin centerline)', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Rear Axle Nut Torque (Castle Nut)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('72.5 ft-lbs, 100 N-m', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Rear Axle Nut Torque (Self-Locking Nut)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('79.5 ft-lbs, 110 N-m', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Tire Tread Depth Limit', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('3mm (0.12")', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Tire Pressure (Solo)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('22 psi, 150 kPa', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Tire Pressure (Duo)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('25 psi, 175 kPa', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Rear Tire Pressure (Solo)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('25 psi, 175 kPa', textAlign: TextAlign.right)))
                      ]
                      ),
                      TableRow( children: <Widget> [
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Rear Tire Pressure (Duo)', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('29 psi, 200 kPa', textAlign: TextAlign.right)))
                      ]
                      )
                    ]
                ),
              ]
          )
        )
    );
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

class TorqueTable extends StatefulWidget {
  @override
  _TorqueTableState createState() => _TorqueTableState();
}

class _TorqueTableState extends State<TorqueTable> {
  static final asset ='assets/TorqueTable.pdf';
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
        title: Text('Torque Table'),
      ),
      body: Center(child:
      _isLoading ? Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical,)
      ),
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
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(_asset),
              ],
            )
        )
    );
  }
}