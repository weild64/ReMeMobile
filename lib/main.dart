import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/settings.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'EpelPage.dart';
import 'LilyPage.dart';
import 'ReyPage.dart';
import 'ChloePage.dart';
import 'settings.dart';
import 'package:firebase_database/firebase_database.dart';

const warteg_url = 'https://s.id/wartegepel';

void main(){
  runApp(new MaterialApp(
      home: new SplashScreenPage(),
      title: "Warteg Evelyn",
      routes: <String, WidgetBuilder>{
        '/Halawal' : (BuildContext context) => new Halawal(),
        '/Halepel' : (BuildContext context) => new Halepel(),
        '/Hallily' : (BuildContext context) => new Hallily(),
        '/Halrey' : (BuildContext context) => new Halrey(),
        '/Halchloe' : (BuildContext context) => new Halchloe(),
        '/Halwarteg' : (BuildContext context) => new Halwarteg(),
        '/Halsettings' : (BuildContext context) => new Halsettings(),
        '/SchedTable' : (BuildContext context) => new SchedTable(),
        '/Donoepel' : (BuildContext context) => new Donoepel(),
        '/Donolily' : (BuildContext context) => new Donolily(),
        '/Donorey' : (BuildContext context) => new Donorey(),
        '/Donochloe' : (BuildContext context) => new Donochloe(),
        '/profileepel' : (BuildContext context) => new profileepel(),
        '/profilerey' : (BuildContext context) => new profilerey(),
        '/profilechloe' : (BuildContext context) => new profilechloe(),
        '/profilelily' : (BuildContext context) => new profilelily(),
        '/notifsett' : (BuildContext context) => new notifsett(),

      }
  ));
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Halawal(),
      title: new Text(
        'Welcome To Warteg Mobile',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      ),
      image: new Image.asset('Image/page2.jpg'),
      photoSize: 150.0,
      backgroundColor: Colors.cyan.shade200,
      loaderColor: Colors.green,
      loadingText: Text('The DualSim(P) team'),
    );
  }
}


class Halawal extends StatefulWidget {
  Halawal({Key key, this.title}) :super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _Halawal();
}
class _Halawal extends State<Halawal> {
  final databaseReference = FirebaseDatabase.instance.reference();
  final AuthService _auth = AuthService();

  void readData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void createRecord(){
    databaseReference.child("2").set({
      'title': 'Mastering EJB',
      'description': 'Programming Guide for J2EE'
    });
    databaseReference.child("3").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
  }

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
    )) ?? false;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[500],
          title:
          new Text('Warteg Evelyn'),
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
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: new ButtonEpel(/*icon: Icons.add_a_photo, teks:"All About Evelyn"*/),//icon dan teks disable
                onPressed: () async {
                  Navigator.pushNamed(context, '/Halepel');
                  //readData();
                  //createRecord();
                  /*dynamic result = await _auth.signInAnon();
                  if(result == null){
                    print('error');
                  }else{
                    print(result);
                  }*/
                },
              ),//button epel
              FlatButton(
                child: new ButtonLily(/*icon: Icons.add_a_photo, teks:"All About Lily Ifeta"*/),
                onPressed: (){
                  Navigator.pushNamed(context, '/Hallily');
                },
              ),//button lily
              FlatButton(
                child: new ButtonReynard(/*icon: Icons.add_a_photo, teks:"All About Reynard Blanc"*/),
                onPressed: (){
                  Navigator.pushNamed(context, '/Halrey');
                },
              ),//button rey
              FlatButton(
                child: new ButtonChloe(/*icon: Icons.add_a_photo, teks:"All About Chloe pawapua"*/),
                onPressed: (){
                  Navigator.pushNamed(context, '/Halchloe');
                },
              ),//button chloe
              FlatButton(
                child: new ButtonWarteg(/*icon: Icons.add_a_photo, teks:"All About Chloe pawapua"*/),
                onPressed: (){
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

class Halwarteg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Warteg Epelz Page"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Jadwal Podcast"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Jadwal Radio"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Donation
            ElevatedButton(
              child: Text("Jadwal Makrab"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// sched
            ElevatedButton(
                child: Text("Donation"),
                onPressed: () async {
                  if (await canLaunch('https://trakteer.id/wartegepelz')){
                    await launch('https://trakteer.id/wartegepelz');
                  };
                }
            ),
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
            new Icon(icon, size: 70.0, color: Colors.cyan,),
            new Text(teks, style: TextStyle(fontSize: 25.0),),
            //new Image.asset('Image/Epel.jpg')
          ],
        ),
      ),
    );
  }
}

class ButtonEpel extends StatelessWidget{
  ButtonEpel({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      //width: 600.0, //testing fixed size button
      //height: 100.0,
      padding: new EdgeInsets.all(1.0),
      /*decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Image/BannerEpel.png'),
          fit: BoxFit.cover,)
      ),*/ //testing background image
      color: Colors.pinkAccent,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Image.asset('Image/BannerEpel.png')
          ],
        ),
      ),
    );
  }
}

class ButtonLily extends StatelessWidget{
  ButtonLily({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.blue,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Image.asset('Image/BannerLily.png')
          ],
        ),
      ),
    );
  }
}

class ButtonReynard extends StatelessWidget{
  ButtonReynard({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.grey,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Image.asset('Image/BannerRey.png')
          ],
        ),
      ),
    );
  }

}

class ButtonChloe extends StatelessWidget{
  ButtonChloe({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.green,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Image.asset('Image/BannerChloe.png')
          ],
        ),
      ),
    );
  }
}

class ButtonWarteg extends StatelessWidget{
  ButtonWarteg({this.navigasi});

  final String navigasi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(0.0),
      color: Colors.blueAccent,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Image.asset('Image/BannerWarteg.png')
          ],
        ),
      ),
    );
  }
}

class profileepelbase extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: profileepel(),
    );
  }
}

class profilereybase extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: profilerey(),
    );
  }
}

class profilechloebase extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: profilechloe(),
    );
  }
}

class profilelilybase extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: profilelily(),
    );
  }
}