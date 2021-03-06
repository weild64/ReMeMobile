// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

List<DataRow> _createRows(QuerySnapshot snapshot) {
  List<DataRow> newList =
      snapshot.documents.map((DocumentSnapshot documentSnapshot) {
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
      appBar: new AppBar(
        title: new Text(
          "Re:Memories Community Event Schedule",
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade900,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 47, vertical: 10),
              ),
              icon: Icon(Icons.chat),
              label: Text("About Re:Memories Community"),
              onPressed: () {
                Navigator.pushNamed(context, '/aboutwarteg');
              },
            ),
            Spacer(flex: 1),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 51, vertical: 10),
              ),
              icon: Icon(Icons.mic_outlined),
              label: Text("Podcast Community Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTablePodcast');
              },
            ),
            Spacer(flex: 1), // Profile
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 52, vertical: 10),
              ),
              icon: Icon(Icons.videogame_asset),
              label: Text("Makrab Community Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableMakrab');
              },
            ),
            Spacer(flex: 1), //Donation
            /*ElevatedButton.icon(
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
            */
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 91, vertical: 10),
              ),
              icon: Icon(Icons.attach_money_outlined),
              label: Text("Donations (IDR)"),
              onPressed: () async {
                if (await canLaunch('https://trakteer.id/wartegepelz')) {
                  await launch('https://trakteer.id/wartegepelz');
                }
              },
            ),
            Spacer(flex: 1), // sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              ),
              icon: Icon(Icons.arrow_back),
              label: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(flex: 4), //Kembali
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
                  if (await canLaunch('https://rememories.id/discord')) {
                    await launch('https://rememories.id/discord');
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
                  applicationLegalese: 'Created by DuoSim(P)',
                  children: <Widget>[
                    Text(
                        'About us, We are from team called "Duo Sim(P)" with two member, called Renkyushi and Zafkiel,This program is Fan project fom us to Re:Memories'),
                  ],
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.feedback_outlined),
                title: Text("Feedback"),
                onTap: _launchEmail),
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
      "mailto:thedualsimp@gmail.com?subject=Feedback App&body=This App need ....");
}

class SchedTableRadio extends StatelessWidget {
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
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('Radio Warteg Schedule'),
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                  'Radio Warteg Schedule',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Text(''),
                Text(
                  '*The time automatically converted to your timezone',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                DataTable(
                  dataRowHeight: 55,
                  horizontalMargin: 10,
                  columns: [
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Theme',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Time',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: _createRows(snapshot.data),
                ),
              ])),
        );
      },
    );
  }
}

class SchedTablePodcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('SchedulePodcast').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple.shade200,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  'Warteg Podcast Schedule',
                ),
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Text(
                  '*The time automatically converted to your timezone',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                Center(
                    child: Text(
                  'Warteg Podcast Schedule',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Text(''),
                DataTable(
                  dataRowHeight: 55,
                  horizontalMargin: 10,
                  columns: [
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Title',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Time',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: _createRows(snapshot.data),
                ),
              ])),
        );
      },
    );
  }
}

class SchedTableMakrab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ScheduleMakrab').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  'Warteg Makrab Schedule',
                ),
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Text(
                  '*The time automatically converted to your timezone',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                Center(
                    child: Text(
                  'Warteg Makrab Schedule',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Text(''),
                DataTable(
                  dataRowHeight: 55,
                  horizontalMargin: 10,
                  columns: [
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Title',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Time',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: _createRows(snapshot.data),
                ),
              ])),
        );
      },
    );
  }
}

class aboutwarteg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blueGrey.shade800,
        title: Text(
          'About Discord Re:Memories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Center(
                child: Image(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width / 1,
                    fit: BoxFit.fill,
                    image: AssetImage('Image/1316.png')),
              ),
              // Positioned(
              //   child: CircleAvatar(
              //       radius: 90,
              //       backgroundColor: Colors.white,
              //       backgroundImage: AssetImage('Image/A-epel.jpg')
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTileTheme(
            tileColor: Colors.blueGrey.shade50,
            child: ListTile(
              title: Text(
                'Re:Memories Community Server',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text('Community Discord Server'),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.blueGrey.shade50,
            child: ListTile(
              title: Text('About this server'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "This is a official server that houses Re:Memories Vtubers, an indie vtuber Agency.\nThey are : Evelyn, Lily Ifeta, Reynard Blanc, and Chloe Pawapua\nin this server they hold many event including podcast, play games together and many more\n",
                  ),
                  // Text('Birthday : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('1 December',textAlign: TextAlign.end,),
                  // Text('Height : ',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                  // Text('160Cm + 5Cm (Ahoge)'),
                  // Text('Papa & Mama',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('Reinly & Nabs'),
                  // Text('Background : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text("Normal college student who aspire to become everyone's mood booster, so she become a Vtuber. Very normal Student. Totally normal. Not Receh at all."),
                ],
              ),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.blueGrey.shade50,
            child: ListTile(
              title: Text('Link Discord'),
              subtitle: Column(
                children: <Widget>[
                  TextButton(
                    child: aboutbtn(),
                    onPressed: () async {
                      if (await canLaunch('rememories.id/discord')) {
                        await launch('rememories.id/discord');
                      }
                    },
                  ),
                  Text(''),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class aboutbtn extends StatelessWidget {
  aboutbtn({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      width: 45.0,
      height: 45.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Image/dcicon.png'), fit: BoxFit.fitHeight),
      ),
    );
  }
}
