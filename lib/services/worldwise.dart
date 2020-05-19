import 'package:http/http.dart';
import 'dart:convert';
import 'dart:collection';

class WorldWiseOverview {
  Map data ={}; //will contain {'location':['confirmed',dead','recovered']}
  Map temp; //will contain sorted data
  List particular;
  WorldWiseOverview({this.temp, this.particular});

  Future<void> getdata() async {
    try {
      //make a request
      Response response =
          await get('https://www.trackcorona.live/api/countries');
      //convert into dictionary

      Map res = jsonDecode(response.body);

      //get properties from json
      for (int i = 0; i < res['data'].length; i++) {
        data[res['data'][i]['location']] = res['data'][i]['confirmed'];
      }

      var sortedKeys = data.keys.toList(growable: false)
        ..sort((k1, k2) => data[k2].compareTo(data[k1]));
      LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
          key: (k) => k, value: (k) => data[k]);
  
      for (int i = 0; i < res['data'].length; i++) {
        data[res['data'][i]['location']] = [
          res['data'][i]['confirmed'],
          res['data'][i]['dead'],
          res['data'][i]['recovered']
        ];
      }
      sortedMap.forEach((k, v) => temp[k] = data[k]);
      particular = temp.keys.toList();
    } catch (e) {
    }
  }
}
