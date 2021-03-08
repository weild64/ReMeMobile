import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:splashscreen/splashscreen.dart';

class Halepel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("All About Epel"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Profile Epel"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donoepel');
              },
            ), //Donation
            ElevatedButton(
              child: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTable');
              },
            ),// sched
            ElevatedButton(
              child: Text("Kembali"),
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
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/Halsettings');
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

class SchedTable extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Evelyn Livestream/Premier Schedule'),
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Text(
                  'Evelyn Schedule 23 Feb - 27 Feb 2021',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columns: [
                DataColumn(label: Text(
                    'No',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Tanggal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Judul',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Jam',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('23 Feb 2021')),
                  DataCell(Text('Omori')),
                  DataCell(Text('19.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('24 Feb 2021')),
                  DataCell(Text('RFA')),
                  DataCell(Text('06.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('24 Feb 2021')),
                  DataCell(Text('Minecraft')),
                  DataCell(Text('09.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4')),
                  DataCell(Text('24 Feb 2021')),
                  DataCell(Text('JackBox Collab')),
                  DataCell(Text('19.00')),
                ]),
              ],
            ),
          ])
      ),
    );
  }
}

class Donoepel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Donations"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
                child: Text("Trakteer (IDR/Gopay/Ovo/Etc)"),
                onPressed: () async {
                  if (await canLaunch('https://www.trakteer.id/evelynvtuber')) {
                    await launch('https://www.trakteer.id/evelynvtuber');
                  };
                }
            ), // Profile
            FlatButton(
                child: Text("Karyakarsa (IDR)"),
                onPressed: () async {
                  if (await canLaunch(
                      'https://www.karyakarsa.com/evelynvtuber')) {
                    await launch('https://www.karyakarsa.com/evelynvtuber');
                  };
                }
            ),
            FlatButton(
                child: Text("Streamlabs (Paypal,Etc)"),
                onPressed: () async {
                  if (await canLaunch(
                      'https://streamlabs.com/evelynvtuber/tip')) {
                    await launch('https://streamlabs.com/evelynvtuber/tip');
                  };
                }
            ), //Donation// sched
            FlatButton(
              child: Text("Kembali"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halepel');
              },
            ), //Kembali
          ],
        ),
      ),
    );
  }
}