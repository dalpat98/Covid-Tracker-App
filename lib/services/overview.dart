import 'package:http/http.dart';
import 'dart:convert';

class Overview {
  int confirmed;
  int dead;
  int recovered ; 

  Overview({this.confirmed, this.dead, this.recovered});

  Future<void> getoverview() async {
    try {
      //make a request
      Response response =
          await get('https://www.trackcorona.live/api/countries');
      //convert into dictionary

      Map data = jsonDecode(response.body);

      //get properties from json
      for (int i = 0; i < data['data'].length; i++) {
        confirmed += data['data'][i]['confirmed'];
        dead += data['data'][i]['dead'];
        recovered += data['data'][i]['recovered'];
      }
    } catch (e) {
    }
  }
}
