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
                    Image.asset(
                      "assets/space${index.toString()}.png",
                      fit: BoxFit.cover,
                    ),
                  
                   index==2?Positioned(
                      bottom: 50,
                      child: Container(
                        color: Colors.white,
                        width: 50,
                        height: 50,
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/search');
                          },
                        ),
                      ),
                    ): Container()
                  ],
                );
              }
            ),
            Positioned(
              bottom: 20,
              child: Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: SwapEffect(
                    dotColor: Color.fromRGBO(241,242,190, 1) ,
                    activeDotColor: Color.fromRGBO(185,194,126, 1),
                    spacing: 40
                  ),
                ),
              ),
            ),
          ],
       ),
      ),
    );
  }
  
}