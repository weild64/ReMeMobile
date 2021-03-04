import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(){
  runApp(new MaterialApp(
    home: new Halawal(),
    title: "Home",
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
        child: new ListView(

          children: <Widget>[

            new ButtonPlacement(icon: Icons.add_a_photo, teks:"All About Evelyn"),
            new ButtonPlacement(icon: Icons.add_a_photo, teks:"All About Reynard Blanc"),
            new ButtonPlacement(icon: Icons.add_a_photo, teks:"All About Lily Ifeta"),
            new ButtonPlacement(icon: Icons.add_a_photo, teks:"All About Chloe Pawapua"),
            new ButtonPlacement(icon: Icons.add_a_photo, teks:"Jadwal Warteg Event"),
            new ButtonPlacement(icon: Icons.add_a_photo, teks:"Settings"),

          ],
        ),
      ) ,
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
            new Text(teks, style: TextStyle(fontSize: 25.0),)

          ],
        ),
      ),
    );
  }
}
