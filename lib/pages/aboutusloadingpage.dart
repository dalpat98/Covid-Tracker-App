import 'package:covidtracker/services/whoabout.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';


class AboutUsloadingpage extends StatefulWidget {
  final String page;
  AboutUsloadingpage({this.page});
  @override
  _StartState createState() => _StartState(page: page);
}

class _StartState extends State<AboutUsloadingpage> {
  final String page;
  _StartState({this.page});

  void gotoabout() async {
    WhoAbout instance = WhoAbout(
        decoded: {});

    await instance.jsonreadfunction();

    if(page =='aboutus'){
      Navigator.pushReplacementNamed(context, '/aboutus',
        arguments: instance.decoded);
    }
    else if(page =='contactus'){
      Navigator.pushReplacementNamed(context, '/contactus',
        arguments: instance.decoded);
    }
    else{
      Navigator.pushReplacementNamed(context, '/copyright',
        arguments: instance.decoded);
    }
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
