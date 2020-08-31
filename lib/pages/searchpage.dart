import 'package:flutter/material.dart';
import 'package:seehaze/classes/geocoding.dart';
import 'package:seehaze/classes/getaqi.dart';
import 'package:seehaze/classes/getstreet.dart';
import 'package:seehaze/pages/streetpage.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart' as Prediction;


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {

  TextEditingController textEditingController = TextEditingController();
  GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: StreetView.token);
  bool flag = true;
  @override
  void initState() {
    textEditingController.text = '';
    super.initState();
  }


  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: (){
             FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/search2.png'),
                  fit: BoxFit.fill
                ),
              ),
              child: Scaffold(
                resizeToAvoidBottomPadding: false,
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Column(
                  children: <Widget>[
                    SizedBox(height: 110),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                            width: width-60,
                            child: Center(
                              child: placesAutoCompleteTextField(),),
                          ),
                        ),

                        Positioned(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            width: 63,
                            height: 63,
                            child: RaisedButton(
                              child: Icon(Icons.search,color: Colors.black54,),
                              color: Color.fromRGBO(185,194,126, 1),
                                onPressed: () async {
                                  setState(() {
                                    flag=true;
                                  });                   
                                  String check =  textEditingController.text; 
                                  String s = check.replaceAll(' ','');     
                                  if(s!=''){
                                    StreetView.location = textEditingController.text;
                                    int aqi = await AQI.getAQIfromLatlng(textEditingController.text);
                                    print("Aqi reading for"+textEditingController.text+" is "+aqi.toString());
                                    flag = await StreetView.isPresence();
                                    if(flag){
                                //      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StreetPage(aqi: 310,)));
                                      Navigator.pushNamed(context, '/street',arguments: aqi);
                                    }else{
                                      print('Image not available');
                                      setState(() {                            
                                    });
                                    }
                                  }else{
                                    setState(() {                            
                                    });
                                    print('Please insert loacation.');
                                  }
                                },
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),

                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          child: !flag ? Text(
                            'The location entered does not have street image, Please enter more specific location.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10
                            ),
                            ) : Text(''),
                        ),
                      )
                  ],
                
              ),
            ),
        ),
          ),
      ),
    );
  }
  placesAutoCompleteTextField() {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: textEditingController,
      googleAPIKey: StreetView.token,
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
        hintText: 'Location',
        hintStyle: TextStyle(
          color: Colors.black54,
        ),      
        focusColor: Color.fromRGBO(241,242,190, 1),
        filled: true,
        fillColor: Color.fromRGBO(241,242,190, 1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(25), right:Radius.circular(0)),
          borderSide: BorderSide(
            color: Colors.transparent
          )
        ),
        focusedBorder: OutlineInputBorder(       
          borderRadius: BorderRadius.horizontal(left: Radius.circular(25), right:Radius.circular(0)),
          borderSide: BorderSide(
            color: Colors.transparent
          )
        ),
      ),
      debounceTime: 500 ,
    
      itmClick: (prediction) {
        textEditingController.text=prediction.description;
        textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description.length));
        }
    );
  
  }
}