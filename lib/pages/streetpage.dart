import 'package:flutter/material.dart';
import 'package:seehaze/classes/getstreet.dart';

class StreetPage extends StatefulWidget {

  @override
  _StreetPageState createState() => _StreetPageState();
}

class _StreetPageState extends State<StreetPage> {

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
                var image = snapshot.data;
                return
                    ListView(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: width/4*3,
                          height: height,
                          color: Colors.blue,
                        ),
                        fog(image[0],width, height,aqi),
                        fog(image[1],width, height,aqi),
                        fog(image[2],width, height,aqi),
                        fog(image[3],width, height,aqi),
                        // Image(image: image[1],fit: BoxFit.cover),
                        // Image(image: image[2],fit: BoxFit.cover),
                        // Image(image: image[3],fit: BoxFit.cover),
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

  Widget fog(NetworkImage image,double width, double height,int aqi){

    double opac;
    if(aqi<100){
      opac = 0;
    }else if(aqi<200){
      opac = 0.4;
    }else{
      opac = 0.7;
    }

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
}