import 'package:http/http.dart';
import 'dart:convert';
import 'dart:collection';

class StateWiseParticularOverview {
  String page;
  String country ;
  String countrycode ;
  Map data ={}; //will contain {'location':['confirmed',dead','recovered']}
  Map temp; //will contain sorted data
  List particular;
  StateWiseParticularOverview({this.country,this.page,this.temp, this.particular});

  Future<void> getdata() async {
    try {
      Response countcode =await get('https://www.trackcorona.live/api/countries');

      Map cons = jsonDecode(countcode.body);
      //make a request
      for (int i = 0; i < cons['data'].length; i++) {
        if(cons['data'][i]['location'] == country){
          countrycode = cons['data'][i]['country_code'];
          break;
        }
        else continue;
      }
      if(page == 'statewise')
      {
        Response response =
            await get('https://www.trackcorona.live/api/provinces');

        Map res = jsonDecode(response.body);

        //get properties from json
        for (int i = 0; i < res['data'].length; i++) {
          if(res['data'][i]['country_code'] == countrycode)
          data[res['data'][i]['location']] = res['data'][i]['confirmed'];
          else continue;
        }
        var sortedKeys = data.keys.toList(growable: false)
          ..sort((k1, k2) => data[k2].compareTo(data[k1]));
        LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
            key: (k) => k, value: (k) => data[k]);

        for (int i = 0; i < res['data'].length; i++) {
          if(res['data'][i]['country_code'] == countrycode)
          data[res['data'][i]['location']] = [
            res['data'][i]['confirmed'],
            res['data'][i]['dead'],
            res['data'][i]['recovered']
          ];
        }
        sortedMap.forEach((k, v) => temp[k] = data[k]);
        particular = temp.keys.toList();
      }
      else if(page == 'citywise')
      {
        Response response =
            await get('https://www.trackcorona.live/api/cities');

        Map res = jsonDecode(response.body);

        //get properties from json
        for (int i = 0; i < res['data'].length; i++) {
          if(res['data'][i]['country_code'] == countrycode)
          data[res['data'][i]['location']] = res['data'][i]['confirmed'];
          else continue;
        }
        var sortedKeys = data.keys.toList(growable: false)
          ..sort((k1, k2) => data[k2].compareTo(data[k1]));
        LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys,
            key: (k) => k, value: (k) => data[k]);

        for (int i = 0; i < res['data'].length; i++) {
          if(res['data'][i]['country_code'] == countrycode)
          data[res['data'][i]['location']] = [
            res['data'][i]['confirmed'],
            res['data'][i]['dead'],
            res['data'][i]['recovered']
          ];
        }
        sortedMap.forEach((k, v) => temp[k] = data[k]);
        particular = temp.keys.toList();
      }
    } catch (e) {
    }
  }
}
