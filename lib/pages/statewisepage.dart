import 'package:flutter/material.dart';
import 'package:covidtracker/pages/statewisesearchbox.dart';
import 'package:covidtracker/pages/statewiseparticularloadingpage.dart';

class StateWisePage extends StatefulWidget {
  @override
  _StateWisePageState createState() => _StateWisePageState();
}

class _StateWisePageState extends State<StateWisePage> {
  List countrynameforstate =
      []; //will contain particular=[];  one map and one list

  @override
  Widget build(BuildContext context) {
    countrynameforstate = countrynameforstate.isNotEmpty
        ? countrynameforstate
        : ModalRoute.of(context).settings.arguments;

    String text;

    if (countrynameforstate[1] == 'statewise')
      text = 'State Wise Information';
    else
      text = 'City Wise Information';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            text,
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
                      delegate: Datasearchforstate(countrynameforstate[0],
                          countrynameforstate[1].toString(), []));
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
            for (int i = 0; i < countrynameforstate[0].length; i++)
              ListTile(
                title: Text(
                  countrynameforstate[0][i],
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'BalooTamma2'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateWiseParticularloadingpage(
                          country: countrynameforstate[0][i].toString(),
                          page: countrynameforstate[1].toString()),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
