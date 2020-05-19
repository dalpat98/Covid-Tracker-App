import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<AboutUs> {
  _githubURL() async {
    const url = 'https://github.com/dalpat98';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _linkedinURL() async {
    const url = 'https://www.linkedin.com/in/dalpat-i-b5b451166/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _instagramURL() async {
    const url = 'https://www.instagram.com/dalpat_chaudhary__/?hl=en';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _twitterURL() async {
    const url = 'https://twitter.com/DalpatDc';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Map decoded = {};

  @override
  Widget build(BuildContext context) {
    decoded = decoded.isNotEmpty
        ? decoded
        : ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          title: Text(
            'About Us', //will display country name
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
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.indigo[50],
              elevation: 15,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('Assets/Images/aboutus1.jpg'),
                    ),
                    Text(
                      'Dalpat I',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'FLUTTER DEVELOPER',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150.0,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      decoded['data'][3]['subtitle'],
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
            Card(
              margin: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.indigo[50],
              elevation: 15,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Follow Me on :',
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 5,
                          color: Colors.teal.shade100,
                          onPressed: () {
                            _githubURL();
                          },
                          child: Text(
                            'Github',
                            style: TextStyle(
                              color: Colors.grey[700],
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 5,
                          color: Colors.teal.shade100,
                          onPressed: () {
                            _linkedinURL();
                          },
                          child: Text(
                            'LinkedIn',
                            style: TextStyle(
                              color: Colors.grey[700],
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 5,
                          color: Colors.teal.shade100,
                          onPressed: () {
                            _twitterURL();
                          },
                          child: Text(
                            'Twitter',
                            style: TextStyle(
                              color: Colors.grey[700],
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 5,
                          color: Colors.teal.shade100,
                          onPressed: () {
                            _instagramURL();
                          },
                          child: Text(
                            'Instagram',
                            style: TextStyle(
                              color: Colors.grey[700],
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
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
