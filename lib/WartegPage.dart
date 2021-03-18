import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

List<DataRow> _createRows(QuerySnapshot snapshot) {

  List<DataRow> newList = snapshot.documents.map((DocumentSnapshot documentSnapshot) {
    //var tgl = new DateTime.fromMicrosecondsSinceEpoch(documentSnapshot['Date']);
    return new DataRow(cells: [
      DataCell(Text(documentSnapshot['Date'])),
      DataCell(Text(documentSnapshot['Title'])),
      DataCell(Text(documentSnapshot['Time'])),]);
  }).toList();
  return newList;
}

class Halwarteg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Warteg Epelz Page"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Jadwal Podcast"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTablePodcast');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Jadwal Radio"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableRadio');
              },
            ), //Donation
            ElevatedButton(
              child: Text("Jadwal Makrab"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableMakrab');
              },
            ),// sched
            ElevatedButton(
                child: Text("Donation"),
                onPressed: () async {
                  if (await canLaunch('https://trakteer.id/wartegepelz')){
                    await launch('https://trakteer.id/wartegepelz');
                  };
                }
            ),
            ElevatedButton(
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
                  image: AssetImage('Image/drawer-02.png'),
                  fit: BoxFit.fill,
                ),
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
                  applicationVersion: '0.0.5',
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

class SchedTableRadio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ScheduleRadio').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('Radio Warteg Schedule'),
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                      'Radio Warteg Schedule (GMT +7)',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(''),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Date',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Theme',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Time',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: _createRows(snapshot.data),
                ),
              ])
          ),
        );
      },
    );
  }
}

class SchedTablePodcast extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('SchedulePodcast').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('Warteg Podcast Schedule',),
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                      'Warteg Podcast Schedule (GMT +7)',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(''),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Date',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Title',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Time',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: _createRows(snapshot.data),
                ),
              ])
          ),
        );
      },
    );
  }
}

class SchedTableMakrab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ScheduleMakrab').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('Warteg Makrab Schedule',),
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                      'Warteg Makrab Schedule (GMT +7)',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(''),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Date',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Title',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Time',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: _createRows(snapshot.data),
                ),
              ])
          ),
        );
      },
    );
  }
}
