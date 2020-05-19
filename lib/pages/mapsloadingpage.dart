import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:covidtracker/services/maps.dart';

class MapsLoadingpage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<MapsLoadingpage> {
  void gotoabout() async {
    MapsData instance =
        MapsData(data: {}, countname: []); //creating object of overview class

    await instance.getdata(); //will wait until this is fully executed

    Navigator.pushReplacementNamed(context, '/mappage',
        arguments: [instance.data, instance.countname]);
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
