import 'package:covidtracker/services/statewise.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';


class StateWiseloadingpage extends StatefulWidget {

  final String page;
  StateWiseloadingpage({this.page});
  
  @override
  _StartState createState() => _StartState(page:page);
}

class _StartState extends State<StateWiseloadingpage> { 
  final String page;
  _StartState({this.page});

  void gotoStateWise() async {

    StateWiseOverview instance = StateWiseOverview(
        particular: []); //creating object of overview class

    await instance.getStatewiseinfo(); //will wait until this is fully executed
    
    Navigator.pushReplacementNamed(context, '/statewisepage',
        arguments: [instance.particular,page]);
    //This will call /travel screen with the argument {},and []} 
  }

  @override
  void initState() {
    super.initState();
    gotoStateWise();
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
