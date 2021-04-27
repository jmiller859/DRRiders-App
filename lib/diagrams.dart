import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class Diagrams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Diagrams & About Your DR')
        ),
        body: ListView(
            children: <Widget>[
              ListTile(
                  title: Text('Machine Specs'),
                  onTap: () {_navigateToSpecs(context);}
              ),
              Divider(),
              ListTile(
                  title: Text('Exploded Views'),
                  subtitle: Text('For all chassis components'),
                  onTap: () {_navigateToExplodedView(context);}
              ),
              Divider(),
              ListTile(
                  title: Text('Lubrication System Diagram'),
                  onTap: () {_navigateToLubeSystem(context);}
              ),
              Divider(),
              ListTile(
                  title: Text('Electrical System Diagrams'),
                  onTap: () {_navigateToElectricSystem(context);}
              ),
              Divider(),
              ListTile(
                  title: Text('Wire, Cable, & Hose Routing'),
                  onTap: () {_navigateToWCHRouting(context);}
              ),
              Divider(),
              ListTile(
                  title: Text('Colored Wiring Diagram \'98+ Models'),
                  onTap: () {_navigateToColoredWiring(context);}
              ),
              Divider(),
            ]
        )
    );
  }
  void _navigateToSpecs(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MachineSpecs()));
  }
  void _navigateToExplodedView(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExplodedChassis()));
  }
  void _navigateToLubeSystem(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LubeSystem()));
  }
  void _navigateToElectricSystem(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ElectricSystem()));
  }
  void _navigateToWCHRouting(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WCHRouting()));
  }
  void _navigateToColoredWiring(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColoredWiring()));
  }
}

class MachineSpecs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Machine Specs')
        ),
        body: InteractiveViewer( child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Dimensions and Dry Mass', textScaleFactor: 2, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Table(
                  border: TableBorder.all(color: Colors.white24, width: 1.0),
                  children: [
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Overall Length\nE18,22', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2345mm (92.3")', textAlign: TextAlign.right)))
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('E18,22 (Lowered)', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2325mm (91.5")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('All Others', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2255mm (88.8")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('All Others (Lowered)', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2235mm (88.0")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Overall Width', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('865mm (34.1")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Overall Height', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1205mm (47.4")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Overall Height (Lowered)', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1165mm (45.9")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Wheelbase', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1490mm (58.7")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Wheelbase (Lowered)', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1475mm (58.1")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Ground Clearance', textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('265mm (10.4")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Ground Clearance (Lowered)', textAlign: TextAlign.left,))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('225mm (8.9")', textAlign: TextAlign.right))),
                        ]
                    ),
                    TableRow(
                        children: <Widget> [
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Dry Mass' , textAlign: TextAlign.left))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('147kg (324 lbs)', textAlign: TextAlign.right))),
                        ]
                    ),
                  ]
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Engine', textScaleFactor: 2, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
              ),
              Table(
                border: TableBorder.all(color: Colors.white24, width: 1.0),
                children: [
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Type', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('4-Stroke, OHC with SACS', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Intake Valve Clearance', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('0.08-0.13mm\n0.003"-0.005"', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Exhaust Valve Clearance', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('0.17-0.22mm\n0.007"-0.009"', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Number of Cylinders', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Bore', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('100mm (3.937")', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Stroke', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('82mm (3.228")', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Piston Displacement', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('644cm3 (39.3 cu in)', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Compression Ratio', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('9.5:1', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Carburetor', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Mikuni BST40', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Air Cleaner Element', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Polyurethane Foam', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Starter System', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Electric', textAlign: TextAlign.right))),
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Lubrication System', textAlign: TextAlign.left))),
                        TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Wet Sump', textAlign: TextAlign.right))),
                      ]
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Transmission', textScaleFactor: 2, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
              ),
              Table(
                  border: TableBorder.all(color: Colors.white24, width: 1.0),
                  children: [
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Clutch Type'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Wet Multi-Plate')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Transmission'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('5-Speed\nConstant Mesh')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Shift Pattern'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1-down 4-up')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Primary Reduction Ratio'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2.178 (61/28)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('1st Gear Ratio'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2.416 (29/12)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('2nd Gear Ratio'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1.625 (26/16)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('3rd Gear Ratio'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1.238 (26/21)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('4th Gear Ratio'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('1.000 (21/21)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('5th Gear Ratio'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('0.826 (19/23)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Final Reduction Ratio\nE-03,28,33'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2.800 (42/15')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Final Reduction Ratio\nAll Others'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2.733(41/15)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Drive Chain'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('DID-525-V9 110 link')))
                        ]
                    ),
                  ]
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Chassis', textScaleFactor: 2, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
              ),
              Table(
                  border: TableBorder.all(color: Colors.white24, width: 1.0),
                  children: [
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Suspension'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Telescopic, Coil Spring\nOil dampened')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Rear Suspension'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Link-Type, Coil Spring\n'
                              'Gas/Oil Dampened\nPreload Adjustable\nCompression Adjustable')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Fork Stroke &\nRear Wheel Travel'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('260mm (10.2")')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Fork Stroke &\n Rear Wheel Travel (Lowered)'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('220mm (8.7")')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Steering Angle'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('43\u00b0')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Caster'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('28\u00b0 30')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Trail'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('111mm (2.37")')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Turn Radius'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2.5m (8.7')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Brake'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('290mm Disc')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Rear Brake'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('240mm Disc')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Tire Size'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('90/90-21 54S')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Rear Tire Size'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('120/90-17 64S')))
                        ]
                    ),
                  ]
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Electronics', textScaleFactor: 2, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
              ),
              Table(
                  border: TableBorder.all(color: Colors.white24, width: 1.0),
                  children: [
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Ignition Type'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('Electronic CDI')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Ignition Timing'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('10\u00b0 BTDC @ 1500RPM')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Spark Plug'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('NGK CR10E\nDenso U31ESR-N')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Spark Plug (Hot)'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('NGK-CR9E\nDenso-U31ESR-N')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Spark Plug\n(Dual Electrode)'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('NGK-CR10EK\nNGK-CR9EK (Hot)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Battery'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 28.8kC/10 (8AH)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Generator'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('3-Phase AC 200W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Fuses'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('30/10/10')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Headlight'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 60/55W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Parking Light\n(excluding E-03, 24, 28,33)'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 4W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Turn Signal Light'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 21W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('License Plate Light'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 5W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Speedometer Light'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 3W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Neutral Indicator'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 2W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('High Beam Indicator'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 2W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Turn Signal Indicator'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12v 2W')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Available Power'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('84W')))
                        ]
                    ),
                  ]
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Capacities', textScaleFactor: 2, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
              ),
              Table(
                  border: TableBorder.all(color: Colors.white24, width: 1.0),
                  children: [
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Fuel Tank + Reserve\nE-33'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('12L (3.2/2.3 US/Imp)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Fuel Tank + Reserve\nAll Others'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('13L (3.4/2.9 US/Imp)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Engine Oil - Oil Change'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2300mL (2.4/2.6 US/Imp Qt)\n INCORRECT')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Engine Oil - With Filter'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2400mL (2.5/2.1 US/Imp Qt)\nINCORRECT')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Engine Oil - Overhaul'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('2600mL 2.7/2.3 US/Imp Qt)')))
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          TableCell(child: Align(alignment: Alignment.centerLeft, child: Text('Front Fork Oil (Each Leg)'))),
                          TableCell(child: Align(alignment: Alignment.centerRight, child: Text('565mL (19.1/19.9 US/Imp Qt)')))
                        ]
                    ),
                  ]
              ),
            ],
          ),
        )
    ));
  }
}

class ExplodedChassis extends StatefulWidget {
  @override
  _ExplodedChassisState createState() => _ExplodedChassisState();
}

class _ExplodedChassisState extends State<ExplodedChassis> {
  static final asset ='assets/ExplodedViews.pdf';
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
        title: Text('Exploded Views'),
      ),
      body: Center(child:
      _isLoading? Center(child: CircularProgressIndicator())
          : PDFViewer(document: document, scrollDirection: Axis.vertical, lazyLoad: false,)
      ),
    );
  }
}

class LubeSystem extends StatefulWidget {
  @override
  _LubeSystemState createState() => _LubeSystemState();
}

class _LubeSystemState extends State<LubeSystem>{
  static final asset ='assets/LubeSystem.pdf';
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
        title: Text('Lubrication System Diagram'),
      ),
      body: Center(child:
      _isLoading ? Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,)
      ),
    );
  }
}

class ElectricSystem extends StatefulWidget {
  @override
  _ElectricSystemState createState() => _ElectricSystemState();
}

class _ElectricSystemState extends State<ElectricSystem> {
  static final asset ='assets/ElectricalSystem.pdf';
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
        title: Text('Electrical System Diagrams'),
      ),
      body: Center(child:
      _isLoading ? Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,) //Large file
      ),
    );
  }
}

class WCHRouting extends StatefulWidget {
  @override
  _WCHRoutingState createState() => _WCHRoutingState();
}

class _WCHRoutingState extends State<WCHRouting> {
  static final asset ='assets/WCHRouting.pdf';
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
        title: Text('Wire, Cable, & Hose Routing'),
      ),
      body: Center(child:
      _isLoading ? Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,) //Large file
      ),
    );
  }
}

class ColoredWiring extends StatelessWidget {
  final _asset = 'assets/ColoredWiringDiagram.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Colored Wiring Diagram')
        ),
        body: InteractiveViewer ( child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(_asset),
                Text('Thanks to DRRiders user nmerrill for making this color coded diagram')
              ],
            )
        )
    ));
  }
}