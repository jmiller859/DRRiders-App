import 'package:flutter/material.dart';

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