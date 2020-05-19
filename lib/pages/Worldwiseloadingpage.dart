import 'package:covidtracker/services/worldwise.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';

class Worldwiseloadingpage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Worldwiseloadingpage> {
  void gotoworldwise() async {
    WorldWiseOverview instance = WorldWiseOverview(
        temp: {}, particular: []); //creating object of overview class

    await instance.getdata(); //will wait until this is fully executed

    Navigator.pushReplacementNamed(context, '/worldwise',
        arguments: [instance.temp,instance.particular]);
    //This will call /travel screen with the argument {},and []}
  }

  @override
  void initState() {
    super.initState();
    gotoworldwise();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: AwesomeLoader(
          loaderType: AwesomeLoader.AwesomeLoader3,
          color: Colors.black,
        ),
      ),
    );
  }
}
