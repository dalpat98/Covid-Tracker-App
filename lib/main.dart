import 'package:covidtracker/pages/contactus.dart';
import 'package:covidtracker/pages/copyright.dart';
import 'package:covidtracker/pages/mappage.dart';
import 'package:covidtracker/pages/statewisepage.dart';
import 'package:covidtracker/pages/statewiseparticular.dart';
import 'package:covidtracker/pages/about.dart';
import 'package:covidtracker/pages/aboutus.dart';
import 'package:covidtracker/pages/advise.dart';
import 'package:covidtracker/pages/mask.dart';
import 'package:covidtracker/pages/mythbuster.dart';
import 'package:covidtracker/pages/overviewabout.dart';
import 'package:covidtracker/pages/prevention.dart';
import 'package:covidtracker/pages/symptoms.dart';
import 'package:covidtracker/pages/worldwisepage.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/pages/start.dart';
import 'package:covidtracker/pages/home.dart';
import 'package:covidtracker/pages/travelpage.dart';
import 'package:covidtracker/pages/travelparticular.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/start',
        routes: {
          '/start': (context) => Start(),
          '/home': (context) => Home(),
          '/travelpage': (context) => TravelPage(),
          '/travelparticular': (context) => TravelParticular(),
          '/advice': (context) => Advice(),
          '/about': (context) => About(),
          '/aboutus': (context) => AboutUs(),
          '/contactus': (context) => ContactUs(),
          '/copyright': (context) => CopyRight(),
          '/mythbuster': (context) => Mythbuster(),
          '/mask': (context) => Mask(),
          '/overview': (context) => Overviewabout(),
          '/prevention': (context) => Prevention(),
          '/symptoms': (context) => Symptoms(),
          '/worldwise': (context) => WorldWise(),
          '/statewisepage': (context) => StateWisePage(),
          '/statewiseparticular': (context) => StateWiseParticular(),
          '/mappage': (context) => Mappage(),
        }));
