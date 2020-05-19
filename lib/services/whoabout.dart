import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class WhoAbout{

  Map decoded;

  WhoAbout({this.decoded});

  Future<String> _readWhoData() async {
    return await rootBundle.loadString('Assets/about_corona.json');
  }

  Future<void> jsonreadfunction() async {
    String advicedata = await _readWhoData();
    decoded = jsonDecode(advicedata);

  }
  
}