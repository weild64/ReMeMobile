// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class Halsettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings (UNDER CONSTRUCTION)"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton.icon(
              onPressed: () async {
                var status = await Permission.notification.status;
                if (status.isUndetermined) {
                  await openAppSettings();
                }
                if (status.isGranted) {
                  final snackBar = SnackBar(
                    content: Text('Notification Granted'),
                  );
                }
                if (status.isDenied) {
                  final snackBar = SnackBar(
                    content: Text('Notification been Denied'),
                  );
                }
              },
              icon: Icon(Icons.announcement),
              label: Text("Turn On Notifications"),
            ),
            TextButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Kembali
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('Image/drawer1-02.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),
            ListTile(
                leading: Icon(Icons.chat_outlined),
                title: Text("Discord Link"),
                onTap: () async {
                  if (await canLaunch('https://s.id/wartegepel')) {
                    await launch('https://s.id/wartegepel');
                  }
                }),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('About Us'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset('Image/ic_launcher.png'),
                  applicationName: 'Warteg Epel Project',
                  applicationVersion: '1.0.3',
                  applicationLegalese: 'Dibuat Oleh DuoSimpTeam',
                  children: <Widget>[
                    Text(
                        'Tentang Kami Duo Simp, Kami Terdiri dari Dua orang Berinisialkan Renkyushi dan Zafkiel'),
                  ],
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close App'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class notifsett extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          TextButton.icon(
            onPressed: () async {
              var status = await Permission.notification.status;
              if (status.isUndetermined) {
                await openAppSettings();
              }
              if (status.isGranted) {
                final snackBar = SnackBar(
                  content: Text('Notification Granted'),
                );
              }
              if (status.isDenied) {
                final snackBar = SnackBar(
                  content: Text('Notification been Denied'),
                );
              }
            },
            icon: Icon(Icons.announcement),
            label: Text("Notifications"),
          ),
        ],
      ),
    );
  }
}
