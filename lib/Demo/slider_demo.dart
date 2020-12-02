import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Slider(
                       value: _sliderItemA,
                       onChanged: (value) {
                         setState(() {
                           _sliderItemA = value;
                         });
                         debugPrint('value: $value');
                       },
                     activeColor: Theme.of(context).accentColor,
                     inactiveColor: Theme.of(context).accentColor.withOpacity(0.1),
                     min: 0.0,
                     max: 10.0,
                     divisions: 10,
                     label: '${_sliderItemA.toInt()}',

                   ),
                  ]
              ),
              Text('SliderValue: $_sliderItemA'),
            ],
          )
      ),
    );
  }
}
