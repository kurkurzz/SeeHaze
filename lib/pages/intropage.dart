import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  final controller = PageController(viewportFraction: 1);
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: 
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView.builder(
              itemCount: 3,
              controller: controller,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      child: Image.asset(
                        "assets/intro2${index.toString()}.png",
                      //  fit: BoxFit.cover,
                      fit: BoxFit.fill,
                      ),
                    ),
                  
                   index==2?Positioned(
                      bottom: 180,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: 180,
                            height: 180,
                            child: RaisedButton(
                              color: Color.fromRGBO(241,242,190, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(180),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, '/search');
                              },
                            ) ,
                          ),
                          Container(
                            width: 167,
                            height: 167,
                            child: RaisedButton(
                              elevation: 0,
                              color: Color.fromRGBO(185,194,126, 1),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, '/search');
                              },
                              child: Center(
                                child: Text(
                                  'START NOW!',
                                  style: TextStyle(
                                    fontFamily: 'MontSerratBold',
                                    color: Colors.white,
                                    fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ): Container()
                  ],
                );
              }
            ),
            Positioned(
              bottom: 20,
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  dotColor: Color.fromRGBO(241,242,190, 1) ,
                  activeDotColor: Color.fromRGBO(185,194,126, 1),
                  spacing: 30
                ),
              ),
            ),
          ],
       ),
      ),
    );
  }
  
}