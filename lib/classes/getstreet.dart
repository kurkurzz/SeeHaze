import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StreetView{

  static String url = "https://maps.googleapis.com/maps/api/streetview";
  static String token = "AIzaSyARNF6LBf1fGG5kc4TCbPTiKxUXOJ1Q8SM";
  static String location;



  static Future<List<NetworkImage>> getImage(int width, int height) async {
    location.replaceAll(' ', '+');
    String ssize = width.toString() +'x'+height.toString();
    return 
    [
      NetworkImage(
      url+'?size='+ssize+'&location='+location+'&heading=0'
      +'&key='+token
      ),
      NetworkImage(
      url+'?size='+ssize+'&location='+location+'&heading=90'
      +'&key='+token
      ),
      NetworkImage(
      url+'?size='+ssize+'&location='+location+'&heading=180'
      +'&key='+token
      ),
      NetworkImage(
      url+'?size='+ssize+'&location='+location+'&heading=270'
      +'&key='+token
      ),
   ];
  }

  static Future<bool> isPresence() async{
    location.replaceAll(' ', '+');
    var response = await http.get(Uri.encodeFull(
      url+'/metadata?location=' + location +'&source=outdoor'+ '&key=' + token
      ));
    Map map = json.decode(response.body);
    print(map);
    if(map['status']=='OK'){
      return true;
    }return false;
    
  }
  
}


