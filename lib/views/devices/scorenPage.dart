import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';
class ScorenPage extends StatefulWidget {
  const ScorenPage({Key? key,required this.name,required this.colorShade,required this.color}) : super(key: key);
  final String name;
  final Color color;
  final Color colorShade;
  @override
  _ScorenPageState createState() => _ScorenPageState();
}
class _ScorenPageState extends State<ScorenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
         child: Column(
           children: [
             Text(widget.name,style: TextStyle(fontSize: 20,color: widget.colorShade)),
             SizedBox(height: 10),
             Text("RPM",style: TextStyle(fontSize: 15,color: Colors.black)),
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
               child: SfSlider(
                 min: 0.0,
                 max: 100.0,
                 activeColor: widget.color,
                 value: _value,
                 interval: 20,
                 showTicks: true,
                 showLabels: true,
                 enableTooltip: true,
                 minorTicksPerInterval: 1,
                 onChanged: (dynamic value){
                   setState(() {
                     _value = value;
                   });
                 },
               ),
             ),
             Divider(thickness: 2.0,height: 20),
             SizedBox(height: 30),
             Text("Torque",style: TextStyle(fontSize: 17,color: Colors.black)),
             SizedBox(height: 6),
             SleekCircularSlider(
             appearance: CircularSliderAppearance(
               customColors: CustomSliderColors(
                 trackColor: Colors.black45,
                progressBarColors: [widget.colorShade,widget.color],
                dynamicGradient: true
               )
             ),
             onChange: (dynamic value) {
               setState(() {
                 _value = value;
               });
             }),
             Divider(thickness: 2.0,height: 20),
             Text("Pedal",style: TextStyle(fontSize: 17,color: Colors.black)),
             SfSlider.vertical(
               min: 0.0,
               max: 100.0,
               activeColor: widget.color,
               value: _value,
               interval: 20,
               showTicks: true,
               showLabels: true,
               enableTooltip: true,
               minorTicksPerInterval: 1,
               onChanged: (dynamic value){
                 setState(() {
                   _value = value;
                 });
               },
             ),
           ],
         ),
       )
    );
  }
}
double _value = 50.0;

