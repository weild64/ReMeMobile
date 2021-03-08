import 'package:flutter/gestures.dart';
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
                Navigator.pushNamed(context, '/profileepel');
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
              child: Text("Back"),
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

class profileepel extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text('Evelyn Profile', style: TextStyle(color: Colors.lightBlue),),
      ),
      body: Column(
        children: <Widget>[
          Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Image(
              height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.fill,
                image: AssetImage('Image/Epel.jpg')
            ),
            Positioned(
              child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('Image/A-epel.jpg')
                ),),
             ],
        ),
        SizedBox(height: 20,),
          ListTileTheme(tileColor: Colors.pink.shade50,
            child: ListTile(title: Text('Evelyn -Vtuber-', style: TextStyle(fontSize: 20,),), subtitle: Text('Virtual Moodbooster kalian'),),),
          ListTileTheme(tileColor: Colors.pink.shade50,
            child: ListTile(title: Text('About Me'),
            subtitle: Text("my name is Evelyn but you can call me Epel!,\nI'm here for become your virtual mood booster through my Youtube contents~ ᕦ( ᐛ )ᕡ,\nPlease be one of my #Epelable friends because I can't do this without you guys~(  >ㅅ<)b,\nID/EN OK! 日本語は少しだけ分かります。"),),),
          ListTile(
            title: Text('Bussiness inquiries and collaboration matters'),
          ),
          FlatButton.icon(
              onPressed: () => _launchURL('evelyn.vtuber@gmail.com', 'Bussiness inquiries and collaboration', 'Hello Evelyn'),
            icon: Icon(Icons.mail, color: Colors.white), label: Text('Email Me', style: TextStyle(color: Colors.white)),
            color: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          Text(''),
          Text(''),
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