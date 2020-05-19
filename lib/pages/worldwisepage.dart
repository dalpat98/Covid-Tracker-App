import 'package:flutter/material.dart';

class WorldWise extends StatefulWidget {
  @override
  _WorldWiseState createState() => _WorldWiseState();
}

class _WorldWiseState extends State<WorldWise> {
  List worlddata = []; //will contain [{},[]];  one map and one list

  List<Widget> _buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.centerLeft,
        width: 200.0,
        height: 60.0,
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        margin: EdgeInsets.all(2.0),
        child:
            Text(worlddata[1][index], style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: <Widget>[
          for (int i = 0; i < 3; i++)
            Container(
              alignment: Alignment.centerLeft,
              width: 100.0,
              height: 60.0,
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              margin: EdgeInsets.all(2.0),
              child: Text(worlddata[0][worlddata[1][index]][i].toString(),
                  style: Theme.of(context).textTheme.headline6),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildheadRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: 100.0,
            height: 50.0,
            color: Colors.yellow[300],
            margin: EdgeInsets.all(2.0),
            child: Text('Confirmed', style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 50.0,
            color: Colors.redAccent,
            margin: EdgeInsets.all(2.0),
            child: Text('Dead', style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 100.0,
            height: 50.0,
            color: Colors.greenAccent,
            margin: EdgeInsets.all(2.0),
            child: Text('Recovered', style: Theme.of(context).textTheme.headline6),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    worlddata = worlddata.isNotEmpty
        ? worlddata
        : ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text(
            'World Wise Information',
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.grey[300],
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Scroll this way',
                        style: TextStyle(
                            color: Colors.grey[700],
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8.0),
                        width: 200.0,
                        height: 50.0,
                        color: Colors.blue[300],
                        margin: EdgeInsets.all(2.0),
                        child: Text('Location',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildCells(worlddata[1].length),
                      ),
                    ],
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildheadRows(1),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildRows(worlddata[1].length),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
