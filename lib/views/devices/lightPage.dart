

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
class LightPage extends StatefulWidget {
  const LightPage({Key? key}) : super(key: key);

  @override
  _LightPageState createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            padding: EdgeInsetsDirectional.only(end: 50),
            child: Image.asset('assets/images/lightbar.jpg',fit: BoxFit.fitWidth,
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
        body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
                right: 120,
                top: 80,
                child: buildSleekCircularSlider(),),
            Positioned(
                top: 190,
                left: 10,
                child: buildSleekCircularSlider(),),
            Positioned(
                top: 340,
                left: 40,
                child: buildSleekCircularSlider(),),
            Positioned(
                top: 190,
                right: 10,
                child: buildSleekCircularSlider(),),
            Positioned(
                top: 340,
                right: 40,
                child: buildSleekCircularSlider(),),
          ],
        ),
      )
    );
  }

  SleekCircularSlider buildSleekCircularSlider() {
    return SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                      animationEnabled: true,
                      angleRange: 360,
                       customColors: CustomSliderColors(
                         trackColor: Color(0xFF090672),
                         progressBarColors: [Colors.black,Colors.white]
                       ),
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 7,
                      trackWidth: 7
                    )
                  ),
                  onChange: (double value) {
                    print(value);
                  });
  }
}
