import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:permission_handler/permission_handler.dart';


class Halsettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Settings"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                var status = await Permission.notification.status;
                if (status.isUndetermined) {
                  await openAppSettings();
                }
                if (status.isGranted){
                  final snackBar = SnackBar(content: Text('Notification Granted'),);
                }
                if (status.isDenied) {
                  final snackBar = SnackBar(content: Text('Notification been Denied'),);
                }
              },
              icon: Icon(Icons.announcement),
              label: Text("Turn On Notifications"),
            ),
            FlatButton(
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
              child: Text('Warteg Portable'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),
            ListTile(
                title: Text("Discord Link"),
                onTap: () async {
                  if (await canLaunch('https://s.id/wartegepel')){
                    await launch('https://s.id/wartegepel');
                  };
                }
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                showAboutDialog(context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: 'Warteg Epel Project',
                  applicationVersion: '0.0.2',
                  applicationLegalese: 'Dibuat Oleh DuoSimpTeam',
                  children: <Widget>[
                    Text(
                        'Tentang Kami Duo Simp, Kami Terdiri dari Dua orang Berinisialkan Renkyushi dan Zafkiel'),
                  ],
                );
              },
            ),
            ListTile(
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
          FlatButton.icon(
            onPressed: () async {
              var status = await Permission.notification.status;
              if (status.isUndetermined) {
                await openAppSettings();
              }
              if (status.isGranted){
                final snackBar = SnackBar(content: Text('Notification Granted'),);
              }
              if (status.isDenied) {
                final snackBar = SnackBar(content: Text('Notification been Denied'),);
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