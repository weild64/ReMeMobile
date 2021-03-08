import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:splashscreen/splashscreen.dart';

class Halchloe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("All About Chloe"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Profile Chloe"),
              onPressed: () {
                Navigator.pushNamed(context, '/profilechloe');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Donochloe');
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
                Navigator.pushNamed(context, '/Halchloe');
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
        backgroundColor: Colors.yellow.shade300,
        title: Text('Chloe Profile', style: TextStyle(color: Colors.green),),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Image(
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.fill,
                  image: AssetImage('Image/chloe.jpg')
              ),
              Positioned(
                child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('Image/A-chloe.jpg')
                ),),
            ],
          ),
          SizedBox(height: 20,),
          ListTileTheme(tileColor: Colors.yellow.shade50,
            child: ListTile(title: Text('Chloe Pawapua', style: TextStyle(fontSize: 20,),), subtitle: Text('Virtual Magician'),),),
          ListTileTheme(tileColor: Colors.yellow.shade50,
            child: ListTile(title: Text('About Me'),
              subtitle: Text("Kawahionapua~ \nI am a wizard who are not talented in magic, Chloe Pawapua.\nGive me information about how to life because I want to prevent extinction of Pawapua clan, it's wizard clan, my clan.\nYou can also join Pawapua clan anyway. ehehe.."),),),
          ListTile(
            title: Text('Bussiness inquiries and collaboration matters'),
          ),
          FlatButton.icon(
            onPressed: () => _launchURL('chloepawapua@gmail.com', 'Bussiness inquiries and collaboration', 'Hello Chloe'),
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