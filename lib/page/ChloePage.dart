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

class Halchloe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: new AppBar(
        title: new Text(
          "All About Chloe",
          style: TextStyle(color: Colors.green),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.green),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.yellow.shade300,
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 53, vertical: 10),
              ),
              icon: Icon(Icons.assignment_ind),
              label: Text("Profile Chloe"),
              onPressed: () {
                Navigator.pushNamed(context, '/profilechloe');
              },
            ),
            Spacer(flex: 1), // Profile
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 63, vertical: 10),
              ),
              icon: Icon(Icons.attach_money_rounded),
              label: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donochloe');
              },
            ),
            Spacer(flex: 1), //Donation
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 63, vertical: 10),
              ),
              icon: Icon(Icons.calendar_today_outlined),
              label: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableChloe');
              },
            ),
            Spacer(flex: 1), // sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
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

class SchedTableChloe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ScheduleChloe').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return MaterialApp(
          home: Scaffold(
              backgroundColor: Colors.yellow.shade50,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.green),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  'Chloe Livestream/Premier Schedule',
                  style: TextStyle(color: Colors.green),
                ),
                backgroundColor: Colors.yellow.shade300,
              ),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                  'Chloe Schedule',
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

class Donochloe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Donations",
          style: TextStyle(color: Colors.green),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.green),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.yellow.shade300,
      ),
      backgroundColor: Colors.yellow.shade50,
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
              ),
              icon: Icon(Icons.wallet_giftcard_rounded),
              label: Text("Trakteer(IDR)"),
              onPressed: () async {
                if (await canLaunch('https://trakteer.id/chloepawapua')) {
                  await launch('https://trakteer.id/chloepawapua');
                }
              },
            ), // Profile
            Spacer(flex: 1),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 38, vertical: 10),
              ),
              icon: Icon(Icons.wallet_giftcard_rounded),
              label: Text("Streamlabs (Paypal,Etc)"),
              onPressed: () async {
                if (await canLaunch(
                    'https://streamlabs.com/chloepawapuach/tip')) {
                  await launch('https://streamlabs.com/chloepawapuach/tip');
                }
              },
            ),
            Spacer(flex: 1), //Donation// sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
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

class profilechloe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.yellow.shade300,
        title: Text(
          'Chloe Profile',
          style: TextStyle(color: Colors.green),
        ),
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
                    image: AssetImage('Image/chloe.jpg')),
              ),
              // Positioned(
              //   child: CircleAvatar(
              //       radius: 80,
              //       backgroundColor: Colors.white,
              //       backgroundImage: AssetImage('Image/A-chloe.jpg')
              //   ),),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTileTheme(
            tileColor: Colors.yellow.shade50,
            child: ListTile(
              title: Text(
                'Chloe Pawapua',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text('Virtual Wizard'),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.yellow.shade50,
            child: ListTile(
              title: Text('About Me'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Kawahionapua~ \nI am a wizard who are not talented in magic, Chloe Pawapua.\nGive me information about how to life because I want to prevent extinction of Pawapua clan, it's wizard clan, my clan.\nYou can also join Pawapua clan anyway. ehehe..\n"),
                  // Text('Birthday : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('29 February',textAlign: TextAlign.end,),
                  // Text('Height : ',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                  // Text('160Cm'),
                  // Text('Papa',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('Reinly'),
                  // Text('Background : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  // Text('Wizard who are not talented in magic. Seek the information about life to adapt with normal humans, this all for prevent the extinction of the Pawapua populations.'),
                ],
              ),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.yellow.shade50,
            child: ListTile(
              title: Text('Bussiness inquiries and collaboration matters\n'),
              subtitle: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () => _launchURL(
                          'chloepawapua@gmail.com',
                          'Bussiness inquiries and collaboration',
                          'Hello Chloe'),
                      icon: Icon(Icons.mail, color: Colors.white),
                      label: Text('Email Me',
                          style: TextStyle(color: Colors.white)),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      )),
                ],
              ),
            ),
          ),
          ListTileTheme(
            tileColor: Colors.yellow.shade50,
            child: ListTile(
              title: Text('Link Media\n'),
              subtitle: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        child: twtchloe(),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://twitter.com/chloepawapua')) {
                            await launch('https://twitter.com/chloepawapua');
                          }
                        },
                      ),
                      TextButton(
                        child: ytchloe(),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://www.youtube.com/channel/UCrKS2bOUZDXA_R3qhCux7ow')) {
                            await launch(
                                'https://www.youtube.com/channel/UCrKS2bOUZDXA_R3qhCux7ow');
                          }
                        },
                      ),
                      TextButton(
                        child: igchloe(),
                        onPressed: () async {
                          if (await canLaunch(
                              'https://www.instagram.com/chloepawapua/')) {
                            await launch(
                                'https://www.instagram.com/chloepawapua/');
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

class ytchloe extends StatelessWidget {
  ytchloe({this.navigasi});

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

class twtchloe extends StatelessWidget {
  twtchloe({this.navigasi});

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

class igchloe extends StatelessWidget {
  igchloe({this.navigasi});

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
