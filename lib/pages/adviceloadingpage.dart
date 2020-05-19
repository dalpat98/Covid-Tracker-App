import 'package:covidtracker/services/whoadvice.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';


class Adviceloadingpage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Adviceloadingpage> {
  void gotoadvice() async {
    WhoAdvice instance = WhoAdvice(
        decoded: {}); //creating object of overview class

    await instance.jsonreadfunction(); //will wait until this is fully executed
    
    Navigator.pushReplacementNamed(context, '/advice',
        arguments: instance.decoded);
    //This will call /travel screen with the argument {},and []}
  }

  @override
  void initState() {
    super.initState();
    gotoadvice();
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
