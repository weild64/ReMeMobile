import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

List<DataRow> _createRows(QuerySnapshot snapshot) {

  List<DataRow> newList = snapshot.documents.map((DocumentSnapshot documentSnapshot) {
    Timestamp a = documentSnapshot['Date'];
    DateTime date = DateTime.parse(a.toDate().toString());

    return new DataRow(cells: [
      DataCell(Text(DateFormat('dd-MM-yyyy').format(date))),
      DataCell(Text(documentSnapshot['Title'])),
      DataCell(Text(DateFormat('HH:mm').format(date))),
    ]);
  }).toList();

  return newList;
}

class Halwarteg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(title: new Text("Warteg Epelz Event Schedule", style: TextStyle(color: Colors.white),),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );},),
        backgroundColor: Colors.blue,),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.shade200,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 53, vertical: 10),
              ),
              icon: Icon(Icons.mic_outlined),
              label: Text("Podcast Warteg Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTablePodcast');
              },
            ),
            Spacer(flex: 1),// Profile
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 57, vertical: 10),
              ),
              icon: Icon(Icons.videogame_asset),
              label: Text("Makrab Warteg Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableMakrab');
              },
            ),
            Spacer(flex: 1),//Donation
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 63, vertical: 10),
              ),
              icon: Icon(Icons.radio),
              label: Text("Warteg Radio Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableRadio');
              },
            ),
            Spacer(flex: 1),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 86, vertical: 10),
              ),
              icon: Icon(Icons.attach_money_outlined),
              label: Text("Donations (IDR)"),
              onPressed: () async {
                if (await canLaunch('https://trakteer.id/wartegepelz')) {
                  await launch('https://trakteer.id/wartegepelz');
                };
              },
            ),
            Spacer(flex: 1),// sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 116, vertical: 10),
              ),
              icon: Icon(Icons.arrow_back),
              label: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(flex: 4),//Kembali
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
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/Halsettings');
              },
            ),
            ListTile(
                leading: Icon(Icons.chat_outlined),
                title: Text("Discord Link"),
                onTap: () async {
                  if (await canLaunch('https://s.id/wartegepel')){
                    await launch('https://s.id/wartegepel');
                  };
                }
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('About Us'),
              onTap: () {
                showAboutDialog(context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: 'Warteg Epel Project',
                  applicationVersion: '1.0.2',
                  applicationLegalese: 'Created by DuoSim(P)',
                  children: <Widget>[
                    Text(
                        'About us, We are from team called "Duo Sim(P)" with two member, called Renkyushi and Zafkiel'),
                  ],
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.feedback_outlined),
                title: Text("Feedback"),
                onTap: _launchEmail
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close App'),
              onTap: () {
                SystemNavigator.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
_launchEmail() async {
  launch(
      "mailto:thedualsimp@gmail.com?subject=Feedback App&body=Here The App Feedback from me%20plugin");
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
                      'Radio Warteg Schedule',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(''),
                Text('*The time automatically converted to your timezone', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                DataTable( dataRowHeight: 55, horizontalMargin: 10,
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
                Text('*The time automatically converted to your timezone', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                Center(
                    child: Text(
                      'Warteg Podcast Schedule',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(''),
                DataTable( dataRowHeight: 55, horizontalMargin: 10,
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
                Text('*The time automatically converted to your timezone', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),),
                Center(
                    child: Text(
                      'Warteg Makrab Schedule',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(''),
                DataTable( dataRowHeight: 55, horizontalMargin: 10,
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
