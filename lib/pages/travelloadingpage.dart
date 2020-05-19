import 'package:covidtracker/services/travelinfo.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';


class Travelloadingpage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Travelloadingpage> { 
  void gototravel() async {
    TravelInfo instance = TravelInfo(
        countrynames: {},
        sortedcountrynames: []); //creating object of overview class

    await instance.gettravelinfo(); //will wait until this is fully executed
    
    Navigator.pushReplacementNamed(context, '/travelpage',
        arguments: [instance.countrynames, instance.sortedcountrynames]);
    //This will call /travel screen with the argument {},and []}
  }

  @override
  void initState() {
    super.initState();
    gototravel();
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
