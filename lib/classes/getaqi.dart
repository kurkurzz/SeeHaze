import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:seehaze/classes/geocoding.dart';

class AQI{


  static String url = "https://api.waqi.info/feed/";
  static String token = "e2ebab48683769aad5ce88fb20f74a6f69ad1d8d";

  static Future<int> getAQIfromName( String state ) async{
    var response = await http.get(Uri.encodeFull(
      url + state + '/?token=' + token
      ));
    Map map = json.decode(response.body);
    return map['data']['aqi'];
  }

  static Future<int> getAQIfromLatlng( String state ) async{

    Map latlng = await GeoCoding.getLatlng(state);

    var response = await http.get(Uri.encodeFull(
      url + '/geo:'+ latlng['lat'].toString() +';'+latlng['lng'].toString() +'/?token=' + token
      ));
    Map map = json.decode(response.body);
    print(map['data']['aqi']);
    return map['data']['aqi'];
  }
}