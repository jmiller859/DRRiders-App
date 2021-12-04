import 'package:flutter/material.dart';

class EngineDisassembly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Engine Disassembly'),
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