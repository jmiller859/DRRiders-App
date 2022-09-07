import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class CarbScreen extends StatelessWidget {
  const CarbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Carburetors')
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: const Text('BST-40 (OEM Carb)'),
            subtitle: const Text("Factory Setup, Modded Setups & Exploded View"),
            onTap: () {_navigateToBST(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('TM-40/42'),
            subtitle: const Text("The Basic Pumper"),
            onTap: () {_navigateToTM40(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('FCR-39'),
            subtitle: const Text("The Mad Tuner's Choice"),
            onTap: () {_navigateToFCR(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('Jet Size Conversion Chart'),
            subtitle: const Text("For Cross-Referencing Jets"),
            onTap: () {_navigateToChart(context);},
          ),
          const Divider()
        ]
        )
    );
  }
  void _navigateToBST(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BSTAdjustment()));
  }
  void _navigateToTM40(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TM40()));
  }
  void _navigateToFCR(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FCR()));
  }
  void _navigateToChart(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JetChart()));
  }
}

class BSTAdjustment extends StatelessWidget {
  final _asset = ['assets/BSTExploded.png', 'assets/BSTSpecs.png', 'assets/PilotPlugRemoval.png', 'assets/jetchart.jpg'];

  BSTAdjustment({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('BST-40 Adjustment and Diagram')
        ),
        body: InteractiveViewer( child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Exploded View', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset(_asset[0]),),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Factory Tune', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child:Image.asset(_asset[1]),),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Pilot Adjustment', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding( padding: const EdgeInsets.all(8.0), child:Image.asset(_asset[2]),),
                const Text(' - Lightly seat pilot screw by turning it clockwise. Do not overtighten!\n'
                    ' - Back the screw out 1.5 turns\n'
                    ' - Ride the machine for 15-30 minutes so it reaches full operating temp\n'
                    ' - With idle at 1500 RPM slowly turn pilot screw clockwise until the idle stumbles and becomes erratic\n'
                    ' - Now slowly turn the screw counter-clockwise until the idle smoothes out, at this point turn the screw 1/16 to 3/16 further\n'
                    ' - Pilot circuit is now set'
                    '\n\n The stock 42.5 pilot jet is correct in most applications except for owners who live at high altitude.', textScaleFactor: 1, textAlign: TextAlign.left),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Stock Needle Adjustment', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('The USA E-03/33 needle is a single position needle that you cannot adjust without shimming. The adjustable 6F19 needle used in the rest of the world is available from motolab in the "external links" section.\n'
                        'Shims for this purpose are stainless or brass flat washers for M3-M4 screws and are typically around .5mm in thickness. You want to place the shim below the needle clip (part# 4 in the diagram), but above the '
                        'white plastic spacer (part# 5). Inspect the white spacer for wear marks where it contacts the shelf inside the slide. Flip or replace the spacer as needed to prevent leaning out of the jetting. Typically shimming the needle'
                        '0.5-1mm is all that is required depending on altitude. You will have to shim the needle higher if you remove the snorkel from the airbox.')
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('"BST Magic" Setup', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('The BST magic line of tuning is based on getting the most of of your DR for the least amount of money.\n\n'
                        'The first issue to address is tapering the stock needle to increase fuel in the 1/8 - 1/2 throttle range. This can be accomplished by grinding a taper in the needle (part #6) in a straight line starting 45mm from the top of the needle to the bottom. Leave at least 1mm of metal at the bottom.'
                        'The second step is grinding the plastic spacer (#5) into a D-shape so it falls all the way to the bottom of the slide. This will result in the needle sitting lower in the carb.'
                        'Finally, shorten the slide spring from 112mm to 110mm to potentially improve throttle response.'
                        '\n\nIf you want to go the whole 9 yards remove the snorkel and cut an additional 2" hole in the airbox as far away from the secondary breather as possible to prevent surging. This requires upgrading to a 150 or 155 main jet.'
                        )
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Motolab Setup', textScaleFactor: 1.5, textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'The motolab tuning method finds that the non-US 6F19 adjustable needle is adequate for DR650 application and can be used to wake up the DR while maintaining good fuel economy. '
                        'US owners will have to source a 6F19 for this method, but they are relatively cheap compared to a jetting kit at ~\$16. '
                        'US owners should put the needle clip in the 4th slot down from the top and Australian riders put the needle in the 3rd slot. The slight difference is the result of a difference in fuel formulations.'
                        '\n\nBelow is the main jet recommendations for general modding points of the intake track. Make sure to source your main jet from a genuine retailer as fake and grossly inaccurate Mikuni jets are popping up on the market frequently.\n\n'
                        )
                ),
                const Divider(),
                Padding(padding: const EdgeInsets.all(8.0), child:Table (
                  border: TableBorder.all(color: Colors.white24, width: 1.0),
                  children: const [
                   TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Stock Exhaust w/ Snorkel')))),
                     TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('140')))),
                   ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Stock Exhaust w/ Snorkel Removed')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('140')))),
                    ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Aftermarket Exhaust w/ Snorkel Removed')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('145')))),
                    ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Stock Exhaust w/ Cut Airbox Top\n(Not Recommended, Detonation Danger!)')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('150')))),
                    ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Aftermarket Exhaust w/ Cut Airbox Top')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('155')))),
                    ])
                  ])
              ),
                const Divider(),
        ])
        )
        )
    );
  }
}

class TM40 extends StatelessWidget {
  final _asset = ['assets/TMExploded.png'];

  TM40({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('TM-40 Diagram and Jetting')
        ),
        body: InteractiveViewer(child: SingleChildScrollView(
            child: Column( children: <Widget> [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Exploded View', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding( padding: const EdgeInsets.all(8.0), child: Image.asset(_asset[0]),),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Accelerator Pump Setup', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'The baseline gap for the accelerator pump is approximately 0.08"-0.1" or ~2mm. This gap can be set close enough with a popsicle stick. '
                        'The pump should no longer squirt beyond 2/3\'rds throttle. Aim the squirt directly into the intake, hitting the needle is not required for the DR650 engine.')
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Baseline Jetting', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0), child:Table (
                  border: TableBorder.all(color: Colors.white24, width: 1.0),
                  children: const [
                    TableRow( children: <Widget> [
                       TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Mods')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Pilot Jet')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Needle Clip From The Top')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Main Jet'))))
                    ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Stock Airbox No Snorkel & Stock Exhaust')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('22.5')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('1st')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('135'))))
                    ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Stock Airbox No Snorkel & Aftermarket Exhaust')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('22.5')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('2nd')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('140'))))
                    ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Opened Airbox & Stock or Quiet Aftermarket Exhaust')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('22.5')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('2nd')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('145'))))
                    ]),
                    TableRow( children: <Widget> [
                      TableCell(child: Align(alignment: Alignment.centerLeft, child: Padding( padding: EdgeInsets.all(4.0), child: Text('Opened Airbox & High Flow Aftermarket Exhaust')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('22.5')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('3rd')))),
                      TableCell(child: Align(alignment: Alignment.center, child: Padding( padding: EdgeInsets.all(4.0), child: Text('150'))))
                    ])
                  ])
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile( title: const Text('Mikuni In-Depth Tuning Guide', textScaleFactor: 1.25, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text('Click Me', textAlign: TextAlign.center),
                onTap: () {_navigateToTMTune(context);})
              ),
              const Divider()
            ])
        )
        )
    );
  }
  _navigateToTMTune(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TMTune()));
  }
}

class TMTune extends StatefulWidget {
  const TMTune({super.key});

  @override
  _TMTune createState() => _TMTune();
}

class _TMTune extends State<TMTune> {
  static const  asset ='assets/TM40.pdf';
  late PDFDocument document;
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
        title: const Text('TM40 Tuning Guide'),
      ),
      body: Center(child:
      _isLoading ? const Center(child: CircularProgressIndicator())
          : PDFViewer(
        document: document, scrollDirection: Axis.vertical, lazyLoad: false,) //Large file
      ),
    );
  }
}

class FCR extends StatelessWidget {
  final _asset = ['assets/yzffcr.gif', 'assets/ktmfcr.jpg'];

  FCR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('FCR Diagrams and Jetting')
        ),
        body: InteractiveViewer(child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Exploded View YZF FCR', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset(_asset[0]),),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Exploded View KTM & Aftermarket FCR', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset(_asset[1]),),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('MXrob Detailed FCR Jetting', textScaleFactor: 1.5, textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('- 155 Main Jet\n- EMP Needle 4th clip from the top + .5mm shim\n- 100 Pilot Air\n- 200 Main Air\n- 35 Leak Jet'
                    '- 75 Starter Circuit Jet\n- Slide Cutaway Mod\n- 9mm Float Height\n- Merge Racing (Procycle) APS Spring\n- Extended Pilot Screw'),
              )
            ]
            )
        )
        )
    );
  }
}

class JetChart extends StatelessWidget {
  final _asset = 'assets/jetchart.jpg';

  const JetChart({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: const Text('Jet Size Chart')
    ),
    body: InteractiveViewer( child: SingleChildScrollView(
    child: Column(
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(8.0),
      child: Text('Jet Size Conversion Chart', textScaleFactor: 1.5, textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
      const Padding(
      padding: EdgeInsets.all(8.0),
       child: Text('Here\'s a handy chart for jet sizes and their closest relationship with other manufacturers jets. They are not guaranteed to be the '
        'exact same size but it\'s as close as they get in relation.'),
       ),
      Padding( padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset(_asset),),
      ],
    )
    )
    )
    );
  }
  }