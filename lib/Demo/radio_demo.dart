import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
    debugPrint('value = $value');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('RadioGroupValue: $_radioGroupA'),
              SizedBox(height: 16.0,),
              RadioListTile(
                  value: 0,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioValueChanged,
                activeColor: Colors.black,
                title: Text('OptionA'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_1),
                selected: _radioGroupA == 0,
              ),
              RadioListTile(
                  value: 1,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioValueChanged,
                activeColor: Colors.black,
                title: Text('OptionB'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_2),
                selected: _radioGroupA == 1,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // Radio(
                   //     value: 1,
                   //     groupValue: _radioGroupA,
                   //     onChanged: _handleRadioValueChanged,
                   //   activeColor: Colors.black,
                   // ),
                   //  Radio(
                   //     value: 0,
                   //     groupValue: _radioGroupA,
                   //     onChanged: _handleRadioValueChanged,
                   //   activeColor: Colors.black,
                   // ),
                  ]
              ),
            ],
          )
      ),
    );
  }
}
