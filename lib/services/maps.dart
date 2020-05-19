import 'package:http/http.dart';
import 'dart:convert';

class MapsData {
  Map data ; //will contain {'location':['lat','long','confirmed',dead','recovered']}
  List countname;
  MapsData({this.data,this.countname});

  Future<void> getdata() async {
    try {
      //make a request
      Response response =
          await get('https://www.trackcorona.live/api/countries');
      //convert into dictionary

      Map res = jsonDecode(response.body);

      for (int i = 0; i < res['data'].length; i++) {
        data[res['data'][i]['location']] = [
          res['data'][i]['latitude'],
          res['data'][i]['longitude'],
          res['data'][i]['confirmed'],
          res['data'][i]['dead'],
          res['data'][i]['recovered']
        ];
        countname.add(res['data'][i]['location']);
      }
    } catch (e) {
    }
  }
}
