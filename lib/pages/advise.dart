import 'package:flutter/material.dart';

class Advice extends StatefulWidget {
  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {
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
            'Advice', //will display country name
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
            //add search box here
            Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.white,
              elevation: 25,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/mythbuster',
                      arguments: decoded);
                }, //search box ontap method
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Myth busters',
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
                  Navigator.pushReplacementNamed(context, '/mask',
                      arguments: decoded);
                }, //search box ontap method
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'When to use masks',
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
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        decoded['title'],
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
                        decoded['subtitle'],
                        style: TextStyle(
                          color: Colors.grey[700],
                          letterSpacing: 1.0,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            for (int i = 0; i < decoded['basics'].length; i++)
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
                        decoded['basics'][i]['title'],
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
                        decoded['basics'][i]['subtitle'],
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
