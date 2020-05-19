import 'package:flutter/material.dart';

class TravelParticular extends StatefulWidget {
  @override
  _TravelParticularState createState() => _TravelParticularState();
}

class _TravelParticularState extends State<TravelParticular> {
  List infotobedisplayed = [];

  @override
  Widget build(BuildContext context) {
    infotobedisplayed = infotobedisplayed.isNotEmpty
        ? infotobedisplayed
        : ModalRoute.of(context).settings.arguments;
 
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            infotobedisplayed[0], //will display country name
            style: TextStyle(
              fontFamily: 'BalooTamma2',
              fontSize: 25.0,
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[900],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                infotobedisplayed[1], //will display country information
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'BalooTamma2',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
