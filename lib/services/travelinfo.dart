import 'package:http/http.dart';
import 'dart:convert';

class TravelInfo {

  Map countrynames;
  List sortedcountrynames;

  TravelInfo({this.countrynames,this.sortedcountrynames});

  Future<void> gettravelinfo() async {
    try {
      //make a request
      Response response = await get(
          'https://www.trackcorona.live/api/travel'); //store => Instance of 'Response'
      //convert into dictionary

      Map rawtraveldata =
          jsonDecode(response.body); //Store => original json format api data

      // information = rawtraveldata['data'][0]['data'];
      for (int i = 0; i < rawtraveldata['data'].length; i++) {

        if(rawtraveldata['data'][i]['data']!="")  //only add the country with information
        countrynames[rawtraveldata['data'][i]['location']] =
            rawtraveldata['data'][i]['data'];
        //countrynames[(rawtraveldata['data'][i]['location'])];
      }
      sortedcountrynames = countrynames.keys.toList()..sort();
    } catch (e) {}
  }
}
 