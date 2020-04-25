import 'package:flutter/material.dart';
import 'package:seehaze/classes/geocoding.dart';
import 'package:seehaze/classes/getaqi.dart';
import 'package:seehaze/classes/getstreet.dart';
import 'package:seehaze/pages/embedmappage.dart';
import 'package:seehaze/pages/intropage.dart';
import 'package:seehaze/pages/searchpage.dart';
import 'package:seehaze/pages/streetpage.dart';
import 'package:seehaze/pages/test.dart';
import 'package:page_transition/page_transition.dart';


void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    // NetworkImage image = streetview.getImage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       // cursorColor: 
       // highlightColor: 
      // primaryColor: 
    //  splashColor: 
      ),
      debugShowCheckedModeBanner: false,
      title: 'SeeHaze',
      onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/search':
              return PageTransition(
                duration: Duration(milliseconds: 100),
                child: SearchPage(),
                type: PageTransitionType.fade,
                settings: settings,
              );
              break;
            case '/street':
              return PageTransition(
                duration: Duration(milliseconds: 100),
                child: StreetPage(),
                type: PageTransitionType.fade,
                settings: settings,
              );
              break;  

            default:
              return null;
          }
        },
        initialRoute: '/',
        routes: {'/':(context)=>IntroPage()},
 //     home: SearchPage(),
    );
  }
}
