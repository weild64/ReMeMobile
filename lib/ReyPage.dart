import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:splashscreen/splashscreen.dart';

class Halrey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("All About Reynard"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Profile Reynard"),
              onPressed: () {
                Navigator.pushNamed(context, '/profilerey');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donorey');
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

class Donorey extends StatelessWidget {
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
                  if (await canLaunch('https://trakteer.id/reynardblanc')) {
                    await launch('https://trakteer.id/reynardblanc');
                  };
                }
            ), // Profile
            FlatButton(
                child: Text("Streamlabs (Paypal,etc"),
                onPressed: () async {
                  if (await canLaunch(
                      'https://streamlabs.com/reynardblanc/tip')) {
                    await launch('https://streamlabs.com/reynardblanc/tip');
                  };
                }
            ), //Donation// sched
            FlatButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halrey');
              },
            ), //Kembali
          ],
        ),
      ),
    );
  }
}

class profilerey extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text('Reynard Profile'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Image(
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.fill,
                  image: AssetImage('Image/rey.jpg')
              ),
              Positioned(
                child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('Image/A-rey.jpg')
                ),),
            ],
          ),
          SizedBox(height: 20,),
          ListTileTheme(tileColor: Colors.grey.shade50,
            child: ListTile(title: Text('Reynard Blanc', style: TextStyle(fontSize: 20,),), subtitle: Text('Virtual Musician'),),),
          ListTileTheme(tileColor: Colors.grey.shade50,
            child: ListTile(title: Text('About Me'),
              subtitle: Text("Hi!~ /ᐠ .⋏. ᐟﾉ\nFox Guy Virtual Musician, Reynard Blanc here~~\nI love to make music, so please listen to my musics xD\nBe one of my Reysteners won't you? ;3"),),),
          ListTile(
            title: Text('Bussiness inquiries and collaboration matters'),
          ),
          FlatButton.icon(
            onPressed: () => _launchURL('reynardblanc@gmail.com', 'Bussiness inquiries and collaboration', 'Hello Reynard'),
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
                child: twtrey(),
                onPressed: () async {
                  if (await canLaunch('https://twitter.com/ReynardBlanc')) {
                    await launch('https://twitter.com/ReynardBlanc');
                  };
                },
              ),
              FlatButton(
                child: ytrey(),
                onPressed: () async {
                  if (await canLaunch('https://www.youtube.com/channel/UCoUFv7APM1XOo4TUaWbRekw')) {
                    await launch('https://www.youtube.com/channel/UCoUFv7APM1XOo4TUaWbRekw');
                  };
                },
              ),
              FlatButton(
                child: fbrey(),
                onPressed: () async {
                  if (await canLaunch('https://www.facebook.com/Reynard-Blanc-Ch-111525344029201')) {
                    await launch('https://www.facebook.com/Reynard-Blanc-Ch-111525344029201');
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

class ytrey extends StatelessWidget{
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
            image: AssetImage('Image/yticon.png'),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}

class fbrey extends StatelessWidget{
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
            image: AssetImage('Image/fbicon.png'),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}

class twtrey extends StatelessWidget{
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
            image: AssetImage('Image/twittericon.png'),
            fit: BoxFit.fitHeight
        ),
      ),
    );
  }
}