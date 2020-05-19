import 'package:http/http.dart';
import 'dart:convert';
import 'dart:collection';

class StateWiseOverview {

  Map data ={}; //will contain {'location':['confirmed',dead','recovered']}
  List particular;

  StateWiseOverview({this.particular});

  Future<void> getStatewiseinfo() async {
    try {
      //make a request
      Response response = await get(
          'https://www.trackcorona.live/api/countries'); //store => Instance of 'Response'
      //convert into dictionary

      Map res = jsonDecode(response.body);

      //get properties from json
      for (int i = 0; i < res['data'].length; i++) {
        data[res['data'][i]['location']] = res['data'][i]['confirmed'];
      }
      //contain {'location':'confirmed'}

      var sortedKeys = data.keys.toList(growable: false)
        ..sort((k1, k2) => data[k2].compareTo(data[k1]));
      LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
          key: (k) => k, value: (k) => data[k]);
          
      particular = sortedMap.keys.toList();
       //contain country names sorted according to confirmed cases
    } catch (e) {
    }
  }
}
 