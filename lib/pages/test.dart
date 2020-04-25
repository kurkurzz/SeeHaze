// import 'package:flutter/material.dart';
// import 'package:seehaze/classes/geocoding.dart';
// import 'package:seehaze/classes/getaqi.dart';
// import 'package:seehaze/classes/getstreet.dart';
// import 'package:seehaze/pages/streetpage.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart' as Prediction;


// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {

//   TextEditingController textEditingController = TextEditingController();
//   GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: StreetView.token);
//   final homeScaffoldKey = GlobalKey<ScaffoldState>();
//   final searchScaffoldKey = GlobalKey<ScaffoldState>(); 
//   bool flag = true;

//   @override
//   Widget build(BuildContext context) {

//     double width = MediaQuery. of(context). size. width;
    
//     return SafeArea(
//       child: GestureDetector(
//         onTap: (){
//           FocusScope.of(context).requestFocus(new FocusNode());
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/space.png'),
//               fit: BoxFit.cover
//             ),
//           ),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             body: Column(
//               children: <Widget>[
//                 SizedBox(height: 110),
//                 Stack(
//                   alignment: Alignment.centerRight,
//                   children: <Widget>[
//                     Center(
//                       child: Container(
//                         padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
//                         width: width-60,
//                         child: Center(
//                           child: placesAutoCompleteTextField(),),
//                       ),
//                     ),

//                     Positioned(
//                       child: Container(
//                         margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
//                         width: 63,
//                         height: 63,
//                         child: RaisedButton(
//                           color: Colors.green,
//                             onPressed: () async {                   
//                               String check =  textEditingController.text; 
//                               String s = check.replaceAll(' ','');     
//                               if(s!=''){
//                                 StreetView.location = textEditingController.text;
//                                 int aqi = await AQI.getAQIfromLatlng(textEditingController.text);
//                                 print("Aqi reading for"+textEditingController.text+" is "+aqi.toString());
//                                 flag = await StreetView.isPresence();
//                                 if(flag){
//                                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StreetPage()));
//                                 }else{
//                                   print('Image not available');
//                                   setState(() {                            
//                                 });
//                                 }
//                               }else{
//                                 setState(() {                            
//                                 });
//                                 print('Please insert loacation.');
//                               }
//                             },
//                           shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                       )
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 10),
//                   Center(
//                     child: Container(
//                       child: !flag ? Text(
//                         'The location entered not have street image, Please enter more specific location.',
//                         textAlign: TextAlign.center,
//                         ) : Text(''),
//                     ),
//                   )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
    


   

//   }
//   placesAutoCompleteTextField() {
//     return GooglePlaceAutoCompleteTextField(
//       textEditingController: textEditingController,
//       googleAPIKey: StreetView.token,
//       inputDecoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
//         hintText: 'Location',
//         hintStyle: TextStyle(
//           color: Colors.black54,
//         ),      
//         focusColor: Colors.green,
//         filled: true,
//         fillColor: Colors.greenAccent,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.horizontal(left: Radius.circular(25), right:Radius.circular(0)),
//           borderSide: BorderSide(
//             color: Colors.transparent
//           )
//         ),
//         focusedBorder: OutlineInputBorder(       
//           borderRadius: BorderRadius.horizontal(left: Radius.circular(25), right:Radius.circular(0)),
//           borderSide: BorderSide(
//             color: Colors.transparent
//           )
//         ),
//       ),
//       debounceTime: 500 ,
    
//       itmClick: (prediction) {
//         textEditingController.text=prediction.description;
//         textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description.length));
//         }
//     );
  
//   }
// }