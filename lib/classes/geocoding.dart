import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class GeoCoding{

  static String url = "https://maps.googleapis.com/maps/api/geocode/json?address=";
  static String token = <API-KEY>;

  static Future<Map<String, dynamic>> getLatlng(String location) async {

    location.replaceAll(' ', '+');
    var response = await http.get(Uri.encodeFull(
      url + location + '&key=' + token
      ));
    Map map = json.decode(response.body);
    print(map['results'][0]['geometry']['location']);
    return map['results'][0]['geometry']['location'];
  }
}
