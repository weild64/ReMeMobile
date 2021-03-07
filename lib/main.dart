import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

const warteg_url = 'https://s.id/wartegepel';

void main(){
  runApp(new MaterialApp(
    home: new Halawal(),
    title: "Warteg Evelyn",
    routes: <String, WidgetBuilder>{
      '/Halawal' : (BuildContext context) => new Halawal(),
      '/Halepel' : (BuildContext context) => new Halepel(),
      '/Hallily' : (BuildContext context) => new Hallily(),
      '/Halrey' : (BuildContext context) => new Halrey(),
      '/Halchloe' : (BuildContext context) => new Halchloe(),
      '/Halsettings' : (BuildContext context) => new Halsettings(),
      '/SchedTable' : (BuildContext context) => new SchedTable()
    }
  ));
}

class Halawal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        leading: new Icon(Icons.home),
        title: new Center(
          child: new Text('Warteg Evelyn'),
        ),
        actions: <Widget>[new Icon(Icons.search)],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          FlatButton(
            child: new ButtonEpel(/*icon: Icons.add_a_photo, teks:"All About Evelyn"*/),//icon dan teks disable
               onPressed: (){
                Navigator.pushNamed(context, '/Halepel');
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
                child: new ButtonPlacement(icon: Icons.add_a_photo, teks:"Settings"),
                onPressed: (){
                  Navigator.pushNamed(context, '/Halsettings');
                },
              ),//button setting
      ],
    ),
    ),
    );
  }
}

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
              Navigator.pushNamed(context, '/Halawal');
            },
          ),// Profile
          ElevatedButton(
            child: Text("Donation"),
            onPressed: () {
              Navigator.pushNamed(context, '/Halawal');
            },
          ), //Donation
          ElevatedButton(
            child: Text("Schedule"),
            onPressed: () {
              Navigator.pushNamed(context, '/SchedTable');
            },
          ),// sched
          ElevatedButton(
            child: Text("Kembali"),
            onPressed: () {
              Navigator.pushNamed(context, '/Halawal');
            },
          ), //Kembali
        ],
      ),
    ),
  );
}
}

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
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Donation
            ElevatedButton(
              child: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// sched
            ElevatedButton(
              child: Text("Kembali"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Kembali
          ],
        ),
      ),
    );
  }
}

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
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Donation
            ElevatedButton(
              child: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// sched
            ElevatedButton(
              child: Text("Kembali"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Kembali
          ],
        ),
      ),
    );
  }
}

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
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// Profile
            ElevatedButton(
              child: Text("Donation"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Donation
            ElevatedButton(
              child: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// sched
            ElevatedButton(
              child: Text("Kembali"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Kembali
          ],
        ),
      ),
    );
  }
}

class Halsettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Settings"),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          children: <Widget>[
            FlatButton(
              child: Text("Setting Alarm"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// Profile
            FlatButton(
              child: Text("About Us"),
              onPressed: (){
                showAboutDialog(context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: 'Warteg Epel Project',
                  applicationVersion: '0.0.2',
                  applicationLegalese: 'Dibuat Oleh DuoSimpTeam',
                  children: <Widget> [
                    Text('Tentang Kami Duo Simp, Kami Terdiri dari Dua orang Berinisialkan Renkyushi dan Zafkiel'),
                  ],
                );
              },
            ), //Donation
            FlatButton(
              child: Text("Schedule"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ),// sched
            FlatButton(
              child: Text("Kembali"),
              onPressed: () {
                Navigator.pushNamed(context, '/Halawal');
              },
            ), //Kembali
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

class SchedTable extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter DataTable Example'),
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