import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:splashscreen/splashscreen.dart';

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

class Halchloe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: new AppBar(title: new Text("All About Chloe",style: TextStyle(color: Colors.green),),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.green),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );},),
        backgroundColor: Colors.yellow.shade300,),
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
            Spacer(flex: 1),// Profile
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
            Spacer(flex: 1),//Donation
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
            Spacer(flex: 1),// sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade300,
                onPrimary: Colors.green,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 75,vertical: 10),
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
            ),
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

class SchedTableChloe extends StatelessWidget{
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
                title: Text('Chloe Livestream/Premier Schedule',style: TextStyle(color: Colors.green),),
                backgroundColor: Colors.yellow.shade300,),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                      'Chloe Schedule (GMT+7)',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
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

class Donochloe extends StatelessWidget {
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
                  if (await canLaunch('https://trakteer.id/chloepawapua')) {
                    await launch('https://trakteer.id/chloepawapua');
                  };
                }
            ), // Profile
            FlatButton(
                child: Text("Streamlabs(Paypal,Etc)"),
                onPressed: () async {
                  if (await canLaunch(
                      'https://streamlabs.com/chloepawapuach/tip')) {
                    await launch('https://streamlabs.com/chloepawapuach/tip');
                  };
                }
            ), //Donation// sched
            FlatButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), //Kembali
          ],
        ),
      ),
    );
  }
}

class profilechloe extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.yellow.shade300,
        title: Text('Chloe Profile', style: TextStyle(color: Colors.green),),
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
                    image: AssetImage('Image/chloe.jpg')
                ),),
              // Positioned(
              //   child: CircleAvatar(
              //       radius: 80,
              //       backgroundColor: Colors.white,
              //       backgroundImage: AssetImage('Image/A-chloe.jpg')
              //   ),),
            ],
          ),
          SizedBox(height: 20,),
          ListTileTheme(tileColor: Colors.yellow.shade50,
            child: ListTile(title: Text('Chloe Pawapua', style: TextStyle(fontSize: 20,),), subtitle: Text('Virtual Wizard'),),),
          ListTileTheme(tileColor: Colors.yellow.shade50,
            child: ListTile(title: Text('About Me'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kawahionapua~ \nI am a wizard who are not talented in magic, Chloe Pawapua.\nGive me information about how to life because I want to prevent extinction of Pawapua clan, it's wizard clan, my clan.\nYou can also join Pawapua clan anyway. ehehe.."),
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
          ListTile(
            title: Text('Bussiness inquiries and collaboration matters'),
          ),
          Center(
            child: FlatButton.icon(
              onPressed: () => _launchURL('chloepawapua@gmail.com', 'Bussiness inquiries and collaboration', 'Hello Chloe'),
              icon: Icon(Icons.mail, color: Colors.white), label: Text('Email Me', style: TextStyle(color: Colors.white)),
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              height: 30,
            ),
          ),
          ListTile(
            title: Text('Link Media'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: twtchloe(),
                onPressed: () async {
                  if (await canLaunch('https://twitter.com/chloepawapua')) {
                    await launch('https://twitter.com/chloepawapua');
                  };
                },
              ),
              FlatButton(
                child: ytchloe(),
                onPressed: () async {
                  if (await canLaunch('https://www.youtube.com/channel/UCrKS2bOUZDXA_R3qhCux7ow')) {
                    await launch('https://www.youtube.com/channel/UCrKS2bOUZDXA_R3qhCux7ow');
                  };
                },
              ),
            ],
          )
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

class ytchloe extends StatelessWidget{
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
            image: AssetImage('Image/yticon.png'),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}

class twtchloe extends StatelessWidget{
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
            image: AssetImage('Image/twittericon.png'),
            fit: BoxFit.fitHeight
        ),
      ),
    );
  }
}