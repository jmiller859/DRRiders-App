import 'package:flutter/material.dart';

class EngineDisassembly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Engine Disassembly Guides'),
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Valve Cover & Camshaft'),
            onTap: () {_navigateToValverCoverCamshaft(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Head & Cylinder'),
            onTap: () {_navigateToHead(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Stator Side'),
            subtitle: Text("Flywheel & Starter Mechanisms"),
            onTap: () {_navigateToStatorSide(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Gear Shift Mechanism'),
            onTap: () {_navigateToGearChange(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Clutch Side'),
            subtitle: Text("Primary Drive, Clutch, Oil pump, & NSU"),
            onTap: () {_navigateToClutchSide(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Case Splitting'),
            subtitle: Text("Crank & Counter-Balancer"),
            onTap: () {_navigateToBottomEnd(context);},
          ),
          Divider(),
          ListTile(
            title: Text('Transmission'),
            subtitle: Text("Removal and Gearshaft Disassembly"),
            onTap: () {_navigateToTransmission(context);},
          ),
          Divider(),
        ]
        )
    );
  }

  void _navigateToValverCoverCamshaft(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ValveCoverCamshaft()));
  }
  void _navigateToHead(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Head()));
  }
  void _navigateToStatorSide(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatorSide()));
  }
  void _navigateToGearChange(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GearChangeMechanism()));
  }
  void _navigateToClutchSide(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClutchSide()));
  }
  void _navigateToBottomEnd(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomEnd()));
  }
  void _navigateToTransmission(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Transmission()));
  }
}

class ValveCoverCamshaft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Valve Cover & Camshaft'),
    ),
    body:  InteractiveViewer(child: SingleChildScrollView(
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Tools', textScaleFactor: 1.5, textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold))),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('- 10mm Wrench or Socket\n- 17mm Socket\n'
            '- 5mm Allen Key\n- 10mm Allen Key\n- Flathead Screwdriver\n- Hammer\n\n'
            'If the two inspection ports on the stator cover have never been removed before attempt to loosen them with the engine at full hot temperature. The stock bungs are very soft and strip very easily.',
          textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Divider(),
      Align(child: Padding(padding: EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc1.png")), alignment: Alignment.center),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Begin by removing the 10mm bolts holding on the valve inspection ports.',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(child: Padding(padding: EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc2.png")), alignment: Alignment.center),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Remove the 12 10mm bolts holding on the valve cover including the two that were uncovered when the inspection port covers were removed.\n'
              'Break loose the 10mm bolt on top of the cam chain tensioner on the side of the cylinder, you do not need to remove the bolt only loosen it. Then use the 5mm allen key to remove the two bolts holding on the automatic cam chain tensioner. Gently remove the cam chain tensioner from the cylinder and set aside.',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(child: Padding(padding: EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc3.png")), alignment: Alignment.center),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Using the 10mm allen remove the bung over the crank bolt. Using the 17mm socket rotate the engine to shove the valve cover off of its dowels. Be aware of the two dowels and make sure they don\'t get lost.',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(child: Padding(padding: EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc4.png")), alignment: Alignment.center),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Using the flat-head and mallet bend down the retaining tab on the 10mm cam sprocket bolt. Then remove the two bolts holding the sprocket to the gear. '
              'The engine will need to be rotated so you can have access to one bolt or the other. Once the sprocket is free remove it from the camshaft by pulling it toward you with the chain still on it.'
              '\nWith your other hand remove the cam from its journals; be aware of the half-moon washer in the farthest right journal as it might jump free. There is also a pin in the camshaft where the sprocket mounts; depending on its mood it with either stay firmly in place or go flying free.'
              ' Remove the sprocket from the chain and set aside.\n\nIf not going deeper than this make sure the chain does not drop into the engine. It can be a struggle to retrieve.',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(child: Padding(padding: EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc5.png")), alignment: Alignment.center),
      Divider(),
      Padding(padding: EdgeInsets.all(8.0), child: Text('Thank you to BergDonk of DRRiders for the provided photos.', textAlign: TextAlign.left, textScaleFactor: 1.0,))
    ]
    )))
    );
  }
}

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Head & Cylinder'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                ]
            )))
    );
  }
}

class StatorSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stator Side'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                ]
            )))
    );
  }
}

class GearChangeMechanism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gear Shift Mechanism'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                ]
            )))
    );
  }
}

class ClutchSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clutch Side'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                ]
            )))
    );
  }
}

class BottomEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Case Splitting'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                ]
            )))
    );
  }
}

class Transmission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transmission'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                ]
            )))
    );
  }
}