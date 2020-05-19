import 'package:covidtracker/services/particularstatewise.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';

class StateWiseParticularloadingpage extends StatefulWidget {
  final String country;
  final String page;
  StateWiseParticularloadingpage({this.country,this.page});

  @override
  _StartState createState() => _StartState(countryname: country,page: page);
}

class _StartState extends State<StateWiseParticularloadingpage> {

  final String countryname;
  final String page;
  _StartState({this.countryname,this.page});

  void gotoStateWiseParticular() async {
    StateWiseParticularOverview instance = StateWiseParticularOverview(
        country: countryname,
        page:page,
        temp: {},
        particular: []); //creating object of overview class
    print(countryname);
    await instance.getdata(); //will wait until this is fully executed

    Navigator.pushReplacementNamed(context, '/statewiseparticular',
        arguments: [instance.country,instance.temp, instance.particular]);
    //This will call /travel screen with the argument {},and []}
  }

  @override
  void initState() {
    super.initState();
    gotoStateWiseParticular();
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
