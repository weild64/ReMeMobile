import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
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

class Halepel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: new AppBar(title: new Text("All About Epel", style: TextStyle(color: Colors.lightBlue),),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.lightBlue),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );},),
        backgroundColor: Colors.pink.shade100,),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink.shade100,
                onPrimary: Colors.lightBlue,
                elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 53, vertical: 10),
              ),
              icon: Icon(Icons.assignment_ind),
              label: Text("Profile Epel"),
              onPressed: () {
                Navigator.pushNamed(context, '/profileepel');
              },
            ),
            Spacer(flex: 1),// Profile
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink.shade100,
                onPrimary: Colors.lightBlue,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              ),
              icon: Icon(Icons.attach_money_rounded),
              label: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donoepel');
              },
            ),
            Spacer(flex: 1),//Donation
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink.shade100,
                onPrimary: Colors.lightBlue,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              ),
              icon: Icon(Icons.calendar_today_outlined),
              label: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/SchedTableEpel');
              },
            ),
            Spacer(flex: 1),// sched
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink.shade100,
                onPrimary: Colors.lightBlue,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 73, vertical: 10),
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

class SchedTableEpel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('ScheduleEpel').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return MaterialApp(
              home: Scaffold(
                  backgroundColor: Colors.pink.shade50,
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text('Evelyn Livestream/Premier Schedule', style: TextStyle(color: Colors.lightBlue),),
                backgroundColor: Colors.pink.shade100,),
                body: ListView(children: <Widget>[
                  Text(''),
                 Center(
                  child: Text(
                    'Evelyn Schedule (GMT +7)',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
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

class profileepel extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.lightBlue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.pink.shade100,
        title: Text('Evelyn Profile', style: TextStyle(color: Colors.lightBlue),),
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
                image: AssetImage('Image/placeholderepel.png')
            ),
            ),
            Positioned(
              child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('Image/A-epel.jpg')
              ),
            ),
             ],
        ),
        SizedBox(height: 20,),
          ListTileTheme(tileColor: Colors.pink.shade50,
            child: ListTile(title: Text('Evelyn -Vtuber-', style: TextStyle(fontSize: 20,),),
              subtitle: Text('Virtual College Student'),),),
          ListTileTheme(tileColor: Colors.pink.shade50,
            child: ListTile(title: Text('About Me'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My name is Evelyn but you can call me Epel!,\nI'm here for become your virtual mood booster through my Youtube contents~ ᕦ( ᐛ )ᕡ,\nPlease be one of my #Epelable friends because I can't do this without you guys~(  >ㅅ<)b,\nID/EN OK! 日本語は少しだけ分かります。\n",),
                  Text('Birthday : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('1 December',textAlign: TextAlign.end,),
                  Text('Height : ',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                  Text('160Cm + 5Cm (Ahoge)'),
                  Text('Papa & Mama',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Reinly & Nabs'),
                  Text('Background : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Normal college student who aspire to become everyone's mood booster, so she become a Vtuber. Very normal Student. Totally normal. Not Receh at all."),
            ],
              ),
            ),
          ),
          ListTile(
            title: Text('Bussiness inquiries and collaboration matters'),
          ),
          Center(
          child: FlatButton.icon(
              onPressed: () => _launchURL('evelyn.vtuber@gmail.com', 'Bussiness inquiries and collaboration', 'Hello Evelyn'),
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
                child: twtepel(),
                onPressed: () async {
                  if (await canLaunch('https://twitter.com/EvelynVtuber')) {
                    await launch('https://twitter.com/EvelynVtuber');
                  };
                },
              ),
              FlatButton(
                child: ytepel(),
                onPressed: () async {
                  if (await canLaunch('https://www.youtube.com/channel/UCMxxFFeuhFQ30quuePTym0A')) {
                    await launch('https://www.youtube.com/channel/UCMxxFFeuhFQ30quuePTym0A');
                  };
                },
              ),
              FlatButton(
                child: fbepel(),
                onPressed: () async {
                  if (await canLaunch('https://web.facebook.com/evelyn.vtuberr')) {
                    await launch('https://web.facebook.com/evelyn.vtuberr');
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

class ytepel extends StatelessWidget{
  ytepel({this.navigasi});

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

class fbepel extends StatelessWidget{
  fbepel({this.navigasi});

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
            image: AssetImage('Image/fbicon.png'),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}

class twtepel extends StatelessWidget{
  twtepel({this.navigasi});

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