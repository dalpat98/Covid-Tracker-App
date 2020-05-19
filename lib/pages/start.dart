import 'package:covidtracker/services/overview.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  void gotohome() async {
    Overview instance  = Overview(confirmed: 0, dead: 0, recovered:0); //creating object of overview class
    await instance.getoverview(); //will wait until this is fully executed
    Navigator.pushReplacementNamed(context, '/home',
        arguments: [instance.confirmed, instance.dead, instance.recovered]);
  }

  @override
  void initState() {
    super.initState();
    gotohome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('covid',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.grey[900],
                        letterSpacing: 1.0,
                      )),
                  Text('Tracker',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.grey[600],
                        letterSpacing: 1.0,
                      )),
                ],
              ),
              SizedBox(height: 300.0),
              Text('Developed with Love From India',
                  style: TextStyle(
                    color: Colors.grey[700],
                  )),
              Text('By DALPAT I',
                  style: TextStyle(
                    color: Colors.grey[700],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
