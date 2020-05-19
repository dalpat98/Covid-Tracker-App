import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class WhoAdvice{

  Map decoded;

  WhoAdvice({this.decoded});

  Future<String> _readWhoData() async {
    return await rootBundle.loadString('Assets/who_advice.json');
  }

  Future<void> jsonreadfunction() async {
    String advicedata = await _readWhoData();
    decoded = jsonDecode(advicedata);

  }
  
}