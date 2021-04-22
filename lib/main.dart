import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DRRider',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[600],
        accentColor: Colors.grey[800],
        fontFamily: 'Roboto',
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 14.0, color: Colors.white70)),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DRRider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final options = ['Diagrams & About Your DR','Maintenance Materials','Useful External Links'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Maintenance Tracker')
            ),
            Divider(),
            ListTile(
                title:Text('Diagrams & About Your DR'),
              onTap: () {_navigateToDiagrams(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Maintenance Materials'),
              onTap: () {
                _navigateToMaintenance(context);
              }
            ),
            Divider(),
            ListTile(
              title: Text('Useful External Links'),
              onTap: () {
                _navigateToExternalLinks(context);
              }
            ),
            Divider(),
            ],
    ),
    );
  }

  void _navigateToExternalLinks(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExternalLinks()));
  }

  void _navigateToDiagrams(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Diagrams()));
  }

  void _navigateToMaintenance(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Maintenance()));
  }
}

class ExternalLinks extends StatelessWidget {

  final _links = ['https://drriders.com','http://www.mxrob.com/','https://dr650.fandom.com','https://dr650.zenseeker.net','https://procycle.us',
    'https://motocd.com','https://www.facebook.com/pages/category/Website/DRRiderscom-152797784771110/'];
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('External Links')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('DRRiders.com'),
            subtitle: Text('The Forum for DR owners'),
            onTap: () {
              _launchURL(_links[0]);
            }
          ),
          Divider(),
          ListTile(
              title: Text('MXRob.com'),
              subtitle: Text('MXRob\'s personal repository'),
              onTap: () {
                _launchURL(_links[1]);
              }
          ),
          Divider(),
          ListTile(
              title: Text('DR650 Wiki'),
              subtitle: Text('Contains information all DR owners should know'),
              onTap: () {
                _launchURL(_links[2]);
              }
          ),
          Divider(),
          ListTile(
              title: Text('ZenSeeker\'s DR650 Data'),
              subtitle: Text('If you want to know even more after reading the wiki'),
              onTap: () {
                _launchURL(_links[3]);
              }
          ),
          Divider(),
          ListTile(
              title: Text('Procycle.us'),
              subtitle: Text('All the wingdings your DR needs'),
              onTap: () {
                _launchURL(_links[4]);
              }
          ),
          Divider(),
          ListTile(
              title: Text('Cogent Dynamics'),
             subtitle: Text('DR650 Suspension Experts'),
              onTap: () {
                 _launchURL(_links[5]);
    }
          ),
          Divider(),
          ListTile(
             title: Text('DRRiders Facebook Group'),
              onTap: () {
                _launchURL(_links[6]);
              }
          ),
          Divider(),
        ],
      ),
    );
  }

  void _launchURL (String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch URL in External Links $url';
}

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
                title: Text('Machine Specs')
              ),
              Divider(),
              ListTile(
                title: Text('Exploded Views'),
                subtitle: Text('For all chassis components'),
              ),
              Divider(),
              ListTile(
                title: Text('Lubrication System Diagram')
              ),
              Divider(),
              ListTile(
                title: Text('Electrical System Diagram')
              ),
              Divider(),
              ListTile(
                title: Text('Wire, Cable, & Hose Routing')
              ),
              Divider(),
            ]
        )
    );
  }
}

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
                subtitle: Text("As per Suzuki's recommendations")
          ),
          Divider(),
          ListTile(
            title: Text('Tune Up Specs'),

          ),
          Divider(),
          ListTile(
            title: Text('Tune Up Procedures'),
            subtitle: Text('As outlined by the service manual'),
          ),
          Divider(),
          ListTile(
            title: Text('Torque Tables')
          ),
          Divider(),
          ListTile(
            title: Text('Lubrication Points'),
            subtitle: Text('Not just the chain'),
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
}