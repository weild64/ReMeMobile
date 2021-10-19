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

class Halrey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: new AppBar(
        title: new Text("All About Reynard"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.grey.shade400,
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 47, vertical: 10),
              ),
              icon: Icon(Icons.assignment_ind),
              label: Text("Profile Reynard"),
              onPressed: () {
                Navigator.pushNamed(context, '/profilerey');
              },
            ),
            Spacer(flex: 1), // Profile
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 64, vertical: 10),
              ),
              icon: Icon(Icons.attach_money_rounded),
              label: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donorey');
              },
            ),
            Spacer(flex: 1), //Donation
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 63, vertical: 10),
              ),
              icon: Icon(Icons.calendar_today_outlined),
              label: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableRey');
              },
            ),
            Spacer(flex: 1), // sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
              ),
              icon: Icon(Icons.arrow_back),
              label: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(flex: 4),
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
                onTap: _launchEmail),
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

_launchEmail() async {
  launch(
      "mailto:thedualsimp@gmail.com?subject=Feedback App&body=This App need ....");
}

class SchedTableRey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ScheduleRey').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return MaterialApp(
          home: Scaffold(
              backgroundColor: Colors.grey.shade300,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('Reynard Livestream/Premier Schedule'),
                backgroundColor: Colors.grey.shade400,
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                  'Reynard Schedule',
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

class Donorey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: new AppBar(
        title: new Text("Donations"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.grey.shade400,
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
              ),
              icon: Icon(Icons.wallet_giftcard_rounded),
              label: Text("Trakteer(IDR)"),
              onPressed: () async {
                if (await canLaunch('https://trakteer.id/reynardblanc')) {
                  await launch('https://trakteer.id/reynardblanc');
                }
              },
            ), // Profile
            Spacer(flex: 1),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 38, vertical: 10),
              ),
              icon: Icon(Icons.wallet_giftcard_rounded),
              label: Text("Streamlabs (Paypal,Etc)"),
              onPressed: () async {
                if (await canLaunch(
                    'https://streamlabs.com/reynardblanc/tip')) {
                  await launch('https://streamlabs.com/reynardblanc/tip');
                }
              },
            ),
            Spacer(flex: 1), //Donation// sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                onPrimary: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 92, vertical: 10),
              ),
              icon: Icon(Icons.arrow_back),
              label: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(flex: 4),
            //Kembali
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
                  applicationIcon: Icon(Icons.info_rounded),
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
                onTap: _launchEmail),
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

class profilerey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text('Reynard Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Center(
                child: Image(
                    height: MediaQuery.of(context).size.height / 4,
                    fit: BoxFit.fill,
                    image: AssetImage('Image/rey.jpg')),
              ),
              // Positioned(
              //   child: CircleAvatar(
              //       radius: 80,
              //       backgroundColor: Colors.white,
              //       backgroundImage: AssetImage('Image/A-rey.jpg')
              //   ),),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade50,
            child: ListTile(
              title: Text(
                'Reynard Blanc',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text('Virtual Musician'),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade50,
            child: ListTile(
              title: Text('About Me'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Hi!~ /ᐠ .⋏. ᐟﾉ\nFox Guy Virtual Musician, Reynard Blanc here~~\nI love to make music, so please listen to my musics xD\nBe one of my Reysteners won't you? ;3\n"),
                  // Text('Birthday : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('1 March',textAlign: TextAlign.end,),
                  // Text('Height : ',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                  // Text('180Cm'),
                  // Text('Papa',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('Reinly'),
                  // Text('Background : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('A Fox demon from mythical village in indonesia. He Come to the big city searching for wealth and catch his dream to become a Musician.'),
                ],
              ),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade50,
            child: ListTile(
              title: Text('Bussiness inquiries and collaboration matters\n'),
              subtitle: Column(
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () => _launchURL(
                        'reynardblanc@gmail.com',
                        'Bussiness inquiries and collaboration',
                        'Hello Reynard'),
                    icon: Icon(Icons.mail, color: Colors.white),
                    label:
                        Text('Email Me', style: TextStyle(color: Colors.white)),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.grey.shade50,
            child: ListTile(
              title: Text('Link Media\n'),
              subtitle: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        child: twtrey(),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://twitter.com/ReynardBlanc')) {
                            await launch('https://twitter.com/ReynardBlanc');
                          }
                        },
                      ),
                      TextButton(
                        child: ytrey(),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://www.youtube.com/channel/UCoUFv7APM1XOo4TUaWbRekw')) {
                            await launch(
                                'https://www.youtube.com/channel/UCoUFv7APM1XOo4TUaWbRekw');
                          }
                        },
                      ),
                      TextButton(
                        child: fbrey(),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://www.facebook.com/Reynard-Blanc-Ch-111525344029201')) {
                            await launch(
                                'https://www.facebook.com/Reynard-Blanc-Ch-111525344029201');
                          }
                        },
                      ),
                      TextButton(
                        child: igrey(),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://www.instagram.com/reynardblanc/')) {
                            await launch(
                                'https://www.instagram.com/reynardblanc/');
                          }
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(''),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ytrey extends StatelessWidget {
  ytrey({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      width: 70.0,
      height: 45.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Image/yticon.png'), fit: BoxFit.fill),
      ),
    );
  }
}

class fbrey extends StatelessWidget {
  fbrey({this.navigasi});

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
            image: AssetImage('Image/fbicon.png'), fit: BoxFit.fill),
      ),
    );
  }
}

class twtrey extends StatelessWidget {
  twtrey({this.navigasi});

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
            image: AssetImage('Image/twittericon.png'), fit: BoxFit.fitHeight),
      ),
    );
  }
}

class igrey extends StatelessWidget {
  igrey({this.navigasi});

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
            image: AssetImage('Image/igicon_a.png'), fit: BoxFit.fitHeight),
      ),
    );
  }
}
