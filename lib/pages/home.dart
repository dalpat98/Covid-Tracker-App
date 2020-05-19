import 'package:covidtracker/pages/Worldwiseloadingpage.dart';
import 'package:covidtracker/pages/mapsloadingpage.dart';
import 'package:covidtracker/pages/statewiseloadingpage.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/pages/mainDrawer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:covidtracker/pages/travelloadingpage.dart';
import 'package:covidtracker/pages/adviceloadingpage.dart';
import 'package:covidtracker/pages/aboutloadingpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> overviewdata = [];

  Widget slider() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 150.0,
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.blue[50],
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Worldwiseloadingpage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.album,
                      size: 70,
                    ),
                    Text(
                      'World Wise',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.blue[50],
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateWiseloadingpage(page:'statewise'),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.album,
                      size: 70,
                    ),
                    Text(
                      'State Wise',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.blue[50],
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateWiseloadingpage(page:'citywise'),
                    ),
                  ); 
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.album,
                      size: 70,
                    ),
                    Text(
                      'City Wise',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    overviewdata = overviewdata.isNotEmpty
        ? overviewdata
        : ModalRoute.of(context).settings.arguments;

    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text(
            'Covid19  Live  Tracker',
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
        body: SlidingUpPanel(
          color: Colors.grey,
          maxHeight: 550.0,
          backdropEnabled: true,
          borderRadius: radius,
          panel: slider(),
          collapsed: Container(
            child: Center(
              child: Text(
                '-- NOVEL CORONAVIRUS --',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          body: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              overviewdata[0].toString(),
                              style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cookie'),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Text(
                              'Confirmed',
                              style: TextStyle(color: Colors.white70),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              overviewdata[1].toString(),
                              style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.red[300],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cookie'),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Text(
                              'Dead',
                              style: TextStyle(color: Colors.white70),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              overviewdata[2].toString(),
                              style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.green[400],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cookie'),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Text(
                              'Recovered',
                              style: TextStyle(color: Colors.white70),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.blue[50],
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapsLoadingpage()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.map,
                                  size: 50,
                                ),
                                Text(
                                  'Maps',
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.0,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.blue[50],
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Travelloadingpage()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.airplanemode_inactive,
                                  size: 50,
                                ),
                                Text(
                                  'Travel Bans',
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.0,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.blue[50],
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Aboutloadingpage()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.info,
                                  size: 50,
                                ),
                                Text(
                                  'About',
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.0,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.blue[50],
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Adviceloadingpage()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.local_library,
                                  size: 50,
                                ),
                                // SizedBox(height: 10,),
                                Text(
                                  'Advice',
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.0,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
