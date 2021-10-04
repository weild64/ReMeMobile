import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:async';
import 'page/EpelPage.dart';
import 'page/LilyPage.dart';
import 'page/ReyPage.dart';
import 'page/ChloePage.dart';
import 'settings.dart';
import 'page/WartegPage.dart';

const warteg_url = 'https://s.id/wartegepel';

void main() {
  runApp(new MaterialApp(
      home: new SplashScreenPage(),
      title: "Warteg Evelyn",
      routes: <String, WidgetBuilder>{
        '/Halawal': (BuildContext context) => new Halawal(),
        '/Halepel': (BuildContext context) => new Halepel(),
        '/Hallily': (BuildContext context) => new Hallily(),
        '/Halrey': (BuildContext context) => new Halrey(),
        '/Halchloe': (BuildContext context) => new Halchloe(),
        '/Halwarteg': (BuildContext context) => new Halwarteg(),
        /* '/Halsettings' : (BuildContext context) => new Halsettings(),*/
        '/SchedTableEpel': (BuildContext context) => new SchedTableEpel(),
        '/SchedTableLily': (BuildContext context) => new SchedTableLily(),
        '/SchedTableRey': (BuildContext context) => new SchedTableRey(),
        '/SchedTableChloe': (BuildContext context) => new SchedTableChloe(),
        '/SchedTableRadio': (BuildContext context) => new SchedTableRadio(),
        '/SchedTablePodcast': (BuildContext context) => new SchedTablePodcast(),
        '/SchedTableMakrab': (BuildContext context) => new SchedTableMakrab(),
        '/Donoepel': (BuildContext context) => new Donoepel(),
        '/Donolily': (BuildContext context) => new Donolily(),
        '/Donorey': (BuildContext context) => new Donorey(),
        '/Donochloe': (BuildContext context) => new Donochloe(),
        '/profileepel': (BuildContext context) => new profileepel(),
        '/profilerey': (BuildContext context) => new profilerey(),
        '/profilechloe': (BuildContext context) => new profilechloe(),
        '/profilelily': (BuildContext context) => new profilelily(),
        /*'/notifsett' : (BuildContext context) => new notifsett(),*/
        '/aboutwarteg': (BuildContext context) => new aboutwarteg(),
      }));
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 7,
      navigateAfterSeconds: new Halawal(),
      title: new Text(
        'Welcome To Warteg Mobile',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      ),
      image: new Image.asset('Image/logo.gif'),
      photoSize: 150.0,
      backgroundColor: Colors.cyan.shade200,
      loadingText: Text('The DualSim(P) team'),
    );
  }
}

class Halawal extends StatefulWidget {
  Halawal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _Halawal();
}

class _Halawal extends State<Halawal> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[500],
          title: new Text('Warteg Evelyn'),
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
                    ;
                  }),
              ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('About Us'),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    //applicationIcon: Icon(Icons.info_rounded),
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
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              /* SizedBox(
                height: 160,
                width: double.infinity,
                child: Carousel(
                    dotSize: 4.0,
                    animationDuration: Duration(milliseconds: 1400),
                    dotIncreasedColor: Colors.black,
                    dotColor: Colors.grey.shade600,
                    dotSpacing: 10,
                    dotPosition: DotPosition.bottomLeft,
                    dotBgColor: Colors.transparent,
                    images: [
                      Image.asset('Image/A-epel.jpg', fit: BoxFit.cover,),
                      Image.asset('Image/A-rey.jpg', fit: BoxFit.cover,),
                      Image.asset('Image/A-lily.jpg', fit: BoxFit.cover,),
                      Image.asset('Image/A-chloe.jpg', fit: BoxFit.cover,),
                    ]
                ),
              ),*/
              FlatButton(
                child: new ButtonEpel(
                    /*icon: Icons.add_a_photo, teks:"All About Evelyn"*/), //icon dan teks disable
                onPressed: () async {
                  Navigator.pushNamed(context, '/Halepel');
                },
              ), //button epel
              FlatButton(
                child: new ButtonLily(
                    /*icon: Icons.add_a_photo, teks:"All About Lily Ifeta"*/),
                onPressed: () {
                  Navigator.pushNamed(context, '/Hallily');
                },
              ), //button lily
              FlatButton(
                child: new ButtonReynard(
                    /*icon: Icons.add_a_photo, teks:"All About Reynard Blanc"*/),
                onPressed: () {
                  Navigator.pushNamed(context, '/Halrey');
                },
              ), //button rey
              FlatButton(
                child: new ButtonChloe(
                    /*icon: Icons.add_a_photo, teks:"All About Chloe pawapua"*/),
                onPressed: () {
                  Navigator.pushNamed(context, '/Halchloe');
                },
              ), //button chloe
              FlatButton(
                child: new ButtonWarteg(
                    /*icon: Icons.add_a_photo, teks:"All About Chloe pawapua"*/),
                onPressed: () {
                  Navigator.pushNamed(context, '/Halwarteg');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchEmail() async {
  launch(
      "mailto:thedualsimp@gmail.com?subject=Feedback App&body=This App need ....");
}

class ButtonPlacement extends StatelessWidget {
  ButtonPlacement({this.icon, this.teks, this.navigasi});

  final IconData icon;
  final String teks;
  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(5.0),
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Icon(
              icon,
              size: 70.0,
              color: Colors.cyan,
            ),
            new Text(
              teks,
              style: TextStyle(fontSize: 25.0),
            ),
            //new Image.asset('Image/Epel.jpg')
          ],
        ),
      ),
    );
  }
}

class ButtonEpel extends StatelessWidget {
  ButtonEpel({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(1.0),
      color: Colors.pinkAccent,
      child: new Card(
        child: new Column(
          children: <Widget>[new Image.asset('Image/BannerEpel_02.png')],
        ),
      ),
    );
  }
}

class ButtonLily extends StatelessWidget {
  ButtonLily({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.blue,
      child: new Card(
        child: new Column(
          children: <Widget>[new Image.asset('Image/BannerLily_02.png')],
        ),
      ),
    );
  }
}

class ButtonReynard extends StatelessWidget {
  ButtonReynard({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.grey,
      child: new Card(
        child: new Column(
          children: <Widget>[new Image.asset('Image/BannerRey_02.png')],
        ),
      ),
    );
  }
}

class ButtonChloe extends StatelessWidget {
  ButtonChloe({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.green,
      child: new Card(
        child: new Column(
          children: <Widget>[new Image.asset('Image/BannerChloe_02.png')],
        ),
      ),
    );
  }
}

class ButtonWarteg extends StatelessWidget {
  ButtonWarteg({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.blueAccent,
      child: new Card(
        child: new Column(
          children: <Widget>[new Image.asset('Image/BannerWarteg_02.png')],
        ),
      ),
    );
  }
}

class profileepelbase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileepel(),
    );
  }
}

class profilereybase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profilerey(),
    );
  }
}

class profilechloebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profilechloe(),
    );
  }
}

class profilelilybase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profilelily(),
    );
  }
}
