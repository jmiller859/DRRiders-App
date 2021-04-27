import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ExternalLinks extends StatelessWidget {

  final _links = ['https://drriders.com','http://www.mxrob.com/','https://dr650.fandom.com','https://dr650.zenseeker.net','https://procycle.us',
    'https://motocd.com','https://www.facebook.com/pages/category/Website/DRRiderscom-152797784771110/', 'https://store.moto-lab.com/'];

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
          ListTile(
              title: Text('motolab'),
              subtitle: Text('DR650 BST40 Parts Supplier'),
              onTap: () {
                _launchURL(_links[7]);
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