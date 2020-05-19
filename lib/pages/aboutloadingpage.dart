import 'package:covidtracker/services/whoabout.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';


class Aboutloadingpage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Aboutloadingpage> {
  void gotoabout() async {
    WhoAbout instance = WhoAbout(
        decoded: {}); //creating object of overview class

    await instance.jsonreadfunction(); //will wait until this is fully executed
    
    Navigator.pushReplacementNamed(context, '/about',
        arguments: instance.decoded);
    //This will call /travel screen with the argument {},and []}
  }

  @override
  void initState() {
    super.initState();
    gotoabout();
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
