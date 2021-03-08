import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:splashscreen/splashscreen.dart';

class Hallily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("All About Lily"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Profile Lily"),
              onPressed: () {
                Navigator.pushNamed(context, '/profilelily');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donolily');
              },
            ), //Donation
            ElevatedButton(
              child: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
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
      backgroundColor: Colors.lightBlueAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.shade100,
        title: Text('Lily Profile', style: TextStyle(color: Colors.pink.shade200),),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Image(
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.fill,
                  image: AssetImage('Image/lily.jpg')
              ),
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
              subtitle: Text("Hayohaa !\nLily Ifeta here, I came to earth from heaven to destroy or maybe bless all human in this world . Of course also make you happy and cheerful everyday ~\nDon’t forget to be happy okay ?\n\nBe my cancimen and I will always makes you smile  U w U)7"),),),
          ListTile(
            title: Text('Bussiness inquiries and collaboration matters'),
          ),
          FlatButton.icon(
            onPressed: () => _launchURL('lily.ifeta@gmail.com', 'Bussiness inquiries and collaboration', 'Hello Lily'),
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