import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ExternalLinks extends StatelessWidget {

  final _links = ['https://drriders.com','http://www.mxrob.com/','https://dr650.fandom.com','https://dr650.zenseeker.net','https://procycle.us',
    'https://motocd.com','https://www.facebook.com/pages/category/Website/DRRiderscom-152797784771110/', 'https://store.moto-lab.com/'];


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('External Links')),
      body: ListView(
        children: <Widget>[
          ListTile(
              title: const Text('DRRiders.com'),
              subtitle: const Text('The Forum for DR owners'),
              onTap: () {
                _launchURL(_links[0]);
              }
          ),
          const Divider(),
          ListTile(
              title: const Text('MXRob.com'),
              subtitle: const Text('MXRob\'s personal repository'),
              onTap: () {
                _launchURL(_links[1]);
              }
          ),
          const Divider(),
          ListTile(
              title: const Text('DR650 Wiki'),
              subtitle: const Text('Contains information all DR owners should know'),
              onTap: () {
                _launchURL(_links[2]);
              }
          ),
          const Divider(),
          ListTile(
              title: const Text('ZenSeeker\'s DR650 Data'),
              subtitle: const Text('If you want to know even more after reading the wiki'),
              onTap: () {
                _launchURL(_links[3]);
              }
          ),
          const Divider(),
          ListTile(
              title: const Text('Procycle.us'),
              subtitle: const Text('All the wingdings your DR needs'),
              onTap: () {
                _launchURL(_links[4]);
              }
          ),
          const Divider(),
          ListTile(
              title: const Text('Cogent Dynamics'),
              subtitle: const Text('DR650 Suspension Experts'),
              onTap: () {
                _launchURL(_links[5]);
              }
          ),
          const Divider(),
          ListTile(
              title: const Text('DRRiders Facebook Group'),
              onTap: () {
                _launchURL(_links[6]);
              }
          ),
          const Divider(),
          ListTile(
              title: const Text('motolab'),
              subtitle: const Text('DR650 BST40 Parts Supplier'),
              onTap: () {
                _launchURL(_links[7]);
              }
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _launchURL (String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch URL in External Links $url';
}