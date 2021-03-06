import 'package:flutter/material.dart';
import 'package:covidtracker/pages/travelsearchbox.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List countrynamefortravel = []; //will contain [{},[]];  one map and one list

  @override
  Widget build(BuildContext context) {
    countrynamefortravel = countrynamefortravel.isNotEmpty
        ? countrynamefortravel
        : ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Travel Information',
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.grey[300],
              elevation: 3,
              child: InkWell(
                onTap: () {
                  showSearch(
                      context: context,
                      delegate: Datasearch(countrynamefortravel[1],
                          countrynamefortravel[0], []));
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                      Text(
                        '   Search',
                        style: TextStyle(
                            color: Colors.grey[700],
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            for (int i = 0; i < countrynamefortravel[1].length; i++)
              ListTile(
                title: Text(
                  countrynamefortravel[1][i],
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'BalooTamma2'),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/travelparticular',
                      arguments: [
                        countrynamefortravel[1][i],
                        countrynamefortravel[0][countrynamefortravel[1][i]]
                      ]);
                },
              ),
          ],
        ),
      ),
    );
  }
}
