import 'package:flutter/material.dart';

class EngineDisassembly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Engine Disassembly Guides'),
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: const Text('Valve Cover & Camshaft'),
            onTap: () {_navigateToValverCoverCamshaft(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('Head & Cylinder'),
            onTap: () {_navigateToHead(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('Stator Side'),
            subtitle: const Text("Flywheel & Starter Mechanisms"),
            onTap: () {_navigateToStatorSide(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('Gear Shift Mechanism'),
            onTap: () {_navigateToGearChange(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('Clutch Side'),
            subtitle: const Text("Primary Drive, Clutch, Oil pump, & NSU"),
            onTap: () {_navigateToClutchSide(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('Case Splitting'),
            subtitle: const Text("Crank & Counter-Balancer"),
            onTap: () {_navigateToBottomEnd(context);},
          ),
          const Divider(),
          ListTile(
            title: const Text('Transmission'),
            subtitle: const Text("Removal and Gearshaft Disassembly"),
            onTap: () {_navigateToTransmission(context);},
          ),
          const Divider(),
        ]
        )
    );
  }

  void _navigateToValverCoverCamshaft(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ValveCoverCamshaft()));
  }
  void _navigateToHead(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Head()));
  }
  void _navigateToStatorSide(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StatorSide()));
  }
  void _navigateToGearChange(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GearChangeMechanism()));
  }
  void _navigateToClutchSide(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ClutchSide()));
  }
  void _navigateToBottomEnd(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomEnd()));
  }
  void _navigateToTransmission(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Transmission()));
  }
}

class ValveCoverCamshaft extends StatelessWidget {
  const ValveCoverCamshaft({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Valve Cover & Camshaft'),
    ),
    body:  InteractiveViewer(child: SingleChildScrollView(
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Tools', textScaleFactor: 1.5, textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold))),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('- 10mm Wrench or Socket\n- 17mm Socket\n'
            '- 5mm Allen Key\n- 10mm Allen Key\n- Flathead Screwdriver\n- Hammer\n\n'
            'If the two inspection ports on the stator cover have never been removed before attempt to loosen them with the engine at full hot temperature. The stock bungs are very soft and strip very easily.',
          textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      const Divider(),
      Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc1.png"))),
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('\nBegin by removing the 10mm bolts holding on the valve inspection ports.\n',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc2.png"))),
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('\nRemove the 12 10mm bolts holding on the valve cover including the two that were uncovered when the inspection port covers were removed.\n'
              'Break loose the 10mm bolt on top of the cam chain tensioner on the side of the cylinder, you do not need to remove the bolt only loosen it. Then use the 5mm allen key to remove the two bolts holding on the automatic cam chain tensioner. Gently remove the cam chain tensioner from the cylinder and set aside.\n',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc3.png"))),
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('\nUsing the 10mm allen remove the bung over the crank bolt. Using the 17mm socket rotate the engine to shove the valve cover off of its dowels. Be aware of the two dowels and make sure they don\'t get lost.\n',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc4.png"))),
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('\nUsing the flat-head and mallet bend down the retaining tab on the 10mm cam sprocket bolt. Then remove the two bolts holding the sprocket to the gear. '
              'The engine will need to be rotated so you can have access to one bolt or the other. Once the sprocket is free remove it from the camshaft by pulling it toward you with the chain still on it.'
              '\nWith your other hand remove the cam from its journals; be aware of the half-moon washer in the farthest right journal as it might jump free. There is also a pin in the camshaft where the sprocket mounts; depending on its mood it with either stay firmly in place or go flying free.'
              ' Remove the sprocket from the chain and set aside.\n\nIf not going deeper than this make sure the chain does not drop into the engine. It can be a struggle to retrieve.\n',
            textScaleFactor: 1.0, textAlign: TextAlign.left,)),
      Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/vcc5.png"))),
      const Divider(),
      const Padding(padding: EdgeInsets.all(8.0), child: Text('Thank you to BergDonk of DRRiders for the provided photos.', textAlign: TextAlign.left, textScaleFactor: 1.0,))
    ]
    )))
    );
  }
}

class Head extends StatelessWidget {
  const Head({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Head & Cylinder'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Tools', textScaleFactor: 1.5, textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('- 12mm Wrench\n- 10mm Wrench\n- 14mm Socket\n'
                          '- 12mm Socket\n- Breaker Bar or Long Socket Wrench\n- Prybar\n- Mallet\n\n'
                          'You\'re now getting into the guts of the engine. Make sure to be working in a clean environment and cover or plug exposed internals with clean rags before you walk away.\n'
                          'You may need an oil catch pan as there is a small reservoir of oil under the cam that may need to be dumped out.',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  const Divider(),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/hc1.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nBegin by removing the 12mm bolt and crush washer holding on the upper chain guide. You can either fish the guide out with a pair of needle nose pliers or you can pull it out it after you get the head off.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/hc2.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nRemove the 4 14mm head bolts on top of the engine with your 14mm socket and big leverage tool. Two bolts next to the spark plugs, two on the cam chain side that were under the valve cover.'
                          ' They have copper sealing washers under them that may stay stuck to the head or come free with the bolt so keep track of them. The head bolts are reusable so hang on to them.\n'
                          'Also remove the two 12mm nuts holding the head on using the 12mm wrench. One is under the intake side of the engine and the other on the exhaust side. The exhaust side nut can be an absolute bear to get out with the engine in the frame.',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('The head can now be lifted. It is aligned with dowel pins so you may need some wiggling and tapping with a mallet to get it up. You can also gently pry with a prybar but ensure that you work back and forth so the head comes up square.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/hc4.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nRemove the two 10mm nuts at the bottom of the cylinder at the clutch side of the engine. Take this time to remove the lower cam chain guide as well as the upper if you did not lift it out earlier.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/hc5.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nIf you are not going deeper than this (like fixing a base gasket leak) take care to ensure that the cam chain does not drop into the bottom of the engine when the cylinder is lifted.'
                          ' Once again with a mixture of tapping and prying if needed lift the cylinder off the bottom of the engine and continue lifting till the piston comes free of the cylinder.\n'
                          'At this time if the piston needs to be removed you can pop one of the clips out and push the wrist pin free. This will free the piston from the rod and allow for inspection of the little end bearing.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/hc6.png"))),
                  const Divider(),
                  const Padding(padding: EdgeInsets.all(8.0), child: Text('Thank you to BergDonk of DRRiders for the provided photos.', textAlign: TextAlign.left, textScaleFactor: 1.0,))
                  ]
            )))
    );
  }
}

class StatorSide extends StatelessWidget {
  const StatorSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stator Side'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                   const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Tools', textScaleFactor: 1.5, textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                   const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('- 8mm Socket\n- 17mm Socket\n- Hammer\n- Assortment of Punches\n- Flywheel Puller Tool\n'
                          '- Ring Nut Socket\n- Breaker Bar or Long Socket Wrench\n- JIS Driver or 5MM Allen Key (depends on your model year)\n- Impact gun (not required but makes the job MUCH easier)\n'
                        '- Strap Wrench or Block of Hardwood\n- Prybar',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                   const Divider(),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/ss1.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nHaving already removed the crank bung, removed the 11 bolts holding the cover on. Its now ready to be pried off. Note that there are 3 tabs around the perimeter to facilitate this, no need to chisel into the gasket and maybe damage a surface.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/ss2.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nTake this time to bag and tag the starter gears and pins. Take note of the two washers and bushes that the kickback gear will have. '
                          'They may stay in the case or cover so make sure to account for them before they get lost. There is only one dowel pin in the stator cover to account for.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/ss3.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nNow it\'s time for the fight. The 17mm rotor bolt is the highest torque fastener on the engine and gets coated with red loctite to keep it from getting free on its own.'
                          'If you have a impact gun definitely use it. Using either a strap wrench or a block of wood on the left of the crank throw. Be careful that the wood contacts the case and does not '
                          'rest on the oil jet, use the widest piece of wood you have that still fits in the case so the crank does not get out of alignment. Once the rotor isn\'t going to move on you rattle or heave away.'
                          'Don\'t completely remove the bolt quite yet. Leave the bolt threaded in some to protect the crank while the flywheel is pulled off.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/ss4.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nThread your flywheel puller on the rotor and hold on to your strap wrench once more and crank away until the flywheel pops loose. The bolt will keep it captive and prevent it from flying off at you.'
                          ' You can now remove the flywheel puller from the rotor and the bolt from the crank, then remove the flywheel completely.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/ss5.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nNext up is removal of the woodruff key. A hammer and pin punch achieves this. They are half moons and rotate out, down and back as you tap on the leading edge. '
                          'With the key out, the starter clutch slides off.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/ss6.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nNext up is the removal of the bearing retainer nut using the ring socket. This isn\'t required to remove unless you plan to replace the bearings, but having it removed makes splitting and reassembly easier.'
                          'Plans for making a functional ring socket out of a 41mm socket and a piece of laser cut steel can be found on drriders.com\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/ss7.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nFinally, remove the three JIS or allen fasteners holding the splash plate to the case.',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  const Divider(),
                  const Padding(padding: EdgeInsets.all(8.0), child: Text('Thank you to BergDonk of DRRiders for the provided photos.', textAlign: TextAlign.left, textScaleFactor: 1.0,))
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
          title: const Text('Gear Shift Mechanism'),
        ),
        body:  InteractiveViewer(child: SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Tools', textScaleFactor: 1.5, textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('- 8mm Socket\n- JIS Driver\n- Impact Driver\n- Ziptie',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  const Divider(),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/gc1.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nRemove the 6 bolts holding the gearchange cover on and the 1 additional crankcase bolt that holds on the countershaft seal retainer.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/gc2.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nClean up the gasket or chunks of gasket and remove the splined shift shaft. Keep an eye out for the two dowels that are part of the shift cover.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/gc3.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nRemove the 4 JIS screws for the plates surround the dentent assembly. These can be quite tight and will be reassembled with threadlock so an impact driver may be required for extraction.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  Align(alignment: Alignment.center, child: Padding(padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0), child: Image.asset("assets/gc4.png"))),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('\nPrepare your ziptie. Very gently lift the detent assembly up just enough that you can get the ziptie secured around the two springloaded wings while they are still in the drum. Once you have the ziptie secured pull the'
                          'assembly the rest of the way out of the shift drum and stow it.\n',
                        textScaleFactor: 1.0, textAlign: TextAlign.left,)),
                  const Divider(),
                  const Padding(padding: EdgeInsets.all(8.0), child: Text('Thank you to BergDonk of DRRiders for the provided photos.', textAlign: TextAlign.left, textScaleFactor: 1.0,))
                ]
            )))
    );
  }
}

class ClutchSide extends StatelessWidget {
  const ClutchSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clutch Side'),
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
  const BottomEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Case Splitting'),
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
          title: const Text('Transmission'),
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