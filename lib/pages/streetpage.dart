import 'package:flutter/material.dart';
import 'package:seehaze/classes/aqireading.dart';
import 'package:seehaze/classes/getstreet.dart';

class StreetPage extends StatefulWidget {

  @override
  _StreetPageState createState() => _StreetPageState();
}

class _StreetPageState extends State<StreetPage> {
  double opac;
  Color color;
  int a;
  Map map;
  @override
  Widget build(BuildContext context) {
   var aqi = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: StreetView.getImage(width.round(),height.round()),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.done){
               calculate(aqi);
                var image = snapshot.data;
                return
                    ListView(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: width/4*3,
                          height: height,
                          color: Color.fromRGBO(241,242,190, 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(
                                  backgroundColor: Color.fromRGBO(185,194,126, 0.5),
                                  elevation: 0,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                ),
                              ),
                              slide('AIR QUALITY INDEX',Text(aqi.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: color
                                )
                                ),60),
                              SizedBox(height: 20,),
                              slide('STATUS',Text(map['quality']),60),
                              SizedBox(height: 20,),
                              slide(
                                'DESCRIPTION',
                                Text(
                                  map['precaution'],
                            //      textAlign: TextAlign.center,
                                  ),
                                120),
                              SizedBox(height: 120,),
                              Container(
                                child: Image.asset('assets/bottom.png',fit: BoxFit.cover,),
                              )
                            ],
                          ),
                        ),
                        fog(image[0],width, height),
                        fog(image[1],width, height),
                        fog(image[2],width, height),
                        fog(image[3],width, height),
                    ],
                );
              }
              return Center(child: CircularProgressIndicator(backgroundColor: Colors.blue,));
            },
          )
        ),
      ),   
    );
  }

  Widget fog(NetworkImage image,double width, double height){

    
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          child: Image(image: image,fit: BoxFit.cover,),
        ),
        Opacity(
          opacity: opac,
          child: Container(
            width: width,
            height: height,
            child: Image.asset('assets/fog.png',fit: BoxFit.cover)),
        ),
      ]
    );
  }

  calculate(int aqi){
     if(aqi<51){
       color = Colors.green;
      a = 0;
      opac = 0;
    }else if(aqi<101){
      color = Colors.yellow;
      a = 1;
      opac = 0.15;
    }else if(aqi<151){
      color = Colors.orange;
      a = 2;
      opac = 0.2;
    }else if(aqi<201){
      color = Colors.red;
      a = 3;
      opac = 0.5;
    }else if(aqi<301){
      color = Colors.purple;
      a = 4;
      opac = 0.7;
    }else{
     color = Color.fromRGBO(153, 0, 76, 1);
      a = 5;
      opac = 0.8;
    }
    map =AqiReading.map[a];
  }

  Widget slide(String title, Text text,double height){
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
          margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
          height: height,
          width: 700.0,
          color: Color.fromRGBO(185,194,126, 0.7),
          child: Center(child: text),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: 170,
          height: 30,
          color: Color.fromRGBO(116,138,116, 0.9),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'MontSerratBold'
              ),
              ),
            ),
        ),
      ],
    );
  }
}