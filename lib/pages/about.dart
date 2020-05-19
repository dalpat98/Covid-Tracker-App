import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<About> {
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
            'About',
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
            Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              elevation: 25,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/overview',
                      arguments: decoded);
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Overview',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              elevation: 25,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/prevention',
                      arguments: decoded);
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Preventions',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              elevation: 25,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/symptoms',
                      arguments: decoded);
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Symptoms',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              elevation: 25,
              child: Image.asset('Assets/Images/aboutimage.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
