import 'package:flutter/material.dart';
import 'externallinks.dart';
import 'diagrams.dart';
import 'maintenancedocs.dart';



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

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DRRider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final options = [
    'Diagrams & About Your DR',
    'Maintenance Materials',
    'Useful External Links'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/AppIcon.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('DRRider'))
          ],

        ),
      ),
      body: ListView(
        children: <Widget>[
          /*       ListTile(
              title: Text('Maintenance Tracker'),
              onTap: () {_navigateToTracker(context);},
            ),
            Divider(),*/
          ListTile(
            title: Text('Diagrams & About Your DR'),
            onTap: () {
              _navigateToDiagrams(context);
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
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ExternalLinks()));
  }

  void _navigateToDiagrams(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Diagrams()));
  }

  void _navigateToMaintenance(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Maintenance()));
  }
}