import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
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

class Hallily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: new AppBar(title: new Text("All About Lily", style: TextStyle(color: Colors.pink.shade200),),
        backgroundColor: Colors.lightBlue.shade100,),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue.shade100,
                onPrimary: Colors.pink.shade200,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 51, vertical: 10),
              ),
              icon: Icon(Icons.assignment_ind),
              label: Text("Profile Lily"),
              onPressed: () {
                Navigator.pushNamed(context, '/profilelily');
              },
            ),
            Spacer(flex: 1),// Profile
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade100,
                  onPrimary: Colors.pink.shade200,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 56, vertical: 10),
                ),
                icon: Icon(Icons.attach_money_rounded),
                label:Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donolily');
              },
            ),
            Spacer(flex: 1),//Donation
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade100,
                  onPrimary: Colors.pink.shade200,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                ),
                icon: Icon(Icons.calendar_today_outlined),
                label: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableLily');
              },
            ),
            Spacer(flex: 1),// sched
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade100,
                  onPrimary: Colors.pink.shade200,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 68, vertical: 10),
                ),
                icon: Icon(Icons.arrow_back),
              label: Text("Back"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
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
              child: Text('Warteg Portable'),
              decoration: BoxDecoration(
                color: Colors.blue,
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

class SchedTableLily extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('ScheduleLily').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.lightBlue.shade100,
              appBar: AppBar(
                title: Text('Lily Livestream/Premier Schedule', style: TextStyle(color: Colors.pink.shade200),),
                backgroundColor: Colors.lightBlue.shade100,),
              body: ListView(children: <Widget>[
                Text(''),
                Center(
                    child: Text(
                      'Lily Schedule (GMT+7)',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                Text(''),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Date',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Title',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Time',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: _createRows(snapshot.data),
                ),
              ],),
          ),
        );
      },
    );
  }
}

class Donolily extends StatelessWidget {
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
                  if (await canLaunch('https://trakteer.id/lilyifeta')) {
                    await launch('https://trakteer.id/lilyifeta');
                  };
                }
            ), // Profile
            FlatButton(
                child: Text("Streamlabs (Paypal,Etc"),
                onPressed: () async {
                  if (await canLaunch('https://streamlabs.com/lilyifeta/tip')) {
                    await launch('https://streamlabs.com/lilyifeta/tip');
                  };
                }
            ), //Donation// sched
            FlatButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pushNamed(context, '/Hallily');
              },
            ), //Kembali
          ],
        ),
      ),
    );
  }
}

class profilelily extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        title: Text('Lily Profile', style: TextStyle(color: Colors.pink.shade200),),
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
                  image: AssetImage('Image/placeholderlily.png')
              ),),
              Positioned(
                child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('Image/A-lily.jpg')
                ),),
            ],
          ),
          SizedBox(height: 20,),
          ListTileTheme(tileColor: Colors.lightBlue.shade50,
            child: ListTile(title: Text('Lily Ifeta', style: TextStyle(fontSize: 20,),), subtitle: Text('Virtual Angel'),),),
          ListTileTheme(tileColor: Colors.lightBlue.shade50,
            child: ListTile(title: Text('About Me'),
              subtitle:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text("Hayohaa !\nLily Ifeta here, I came to earth from heaven to destroy or maybe bless all human in this world . Of course also make you happy and cheerful everyday ~\nDon’t forget to be happy okay ?\n\nBe my cancimen and I will always makes you smile  U w U)7"),
              Text('Birthday : ',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('9 September',textAlign: TextAlign.end,),
              Text('Height : ',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
              Text('156Cm'),
              Text('Papa',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Reinly'),
                  Text('Background : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('A Problematic angel who thrown to earth. To make it back to heaven, she have to collect enough happiness from human.'),
              ],
            ),
          ),
    ),
          ListTile(
            title: Text('Bussiness inquiries and collaboration matters'),
          ),
          Center (
          child: FlatButton.icon(
            onPressed: () => _launchURL('lily.ifeta@gmail.com', 'Bussiness inquiries and collaboration', 'Hello Lily'),
            icon: Icon(Icons.mail, color: Colors.white), label: Text('Email Me', style: TextStyle(color: Colors.white)),
            color: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          ),
          ListTile(
            title: Text('Link Media'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: twtlily(),
                onPressed: () async {
                  if (await canLaunch('https://twitter.com/LilyIfeta')) {
                    await launch('https://twitter.com/LilyIfeta');
                  };
                },
              ),
              FlatButton(
                child: ytlily(),
                onPressed: () async {
                  if (await canLaunch('https://www.youtube.com/LilyIfeta')) {
                    await launch('https://www.youtube.com/LilyIfeta');
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

class ytlily extends StatelessWidget{
  ytlily({this.navigasi});

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

class twtlily extends StatelessWidget{
  twtlily({this.navigasi});

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