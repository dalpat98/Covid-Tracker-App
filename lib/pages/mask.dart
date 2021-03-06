import 'package:flutter/material.dart';

class Mask extends StatefulWidget {

  @override
  _MythbusterState createState() => _MythbusterState();
}

class _MythbusterState extends State<Mask> {
  Map decoded = {};

  @override
  Widget build(BuildContext context) {

    decoded = decoded.isNotEmpty
        ? decoded
        : ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            'When To Use Masks', //will display country name
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
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            for (int i = 0; i < decoded['topics'][1]['questions'].length; i++)
              Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.white,
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        decoded['topics'][1]['questions'][i]['title'],
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        decoded['topics'][1]['questions'][i]['subtitle'],
                        style: TextStyle(
                          color: Colors.grey[700],
                          letterSpacing: 1.0,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
