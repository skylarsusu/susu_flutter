import 'package:flutter/material.dart';

class StatefulManagementDemo extends StatefulWidget {
  @override
  _StatefulManagementDemoState createState() => _StatefulManagementDemoState();
}

class _StatefulManagementDemoState extends State<StatefulManagementDemo> {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulManagementdemo'),
        elevation: 0.0,
      ),
      body: Counter(Count),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            Count += 1;
          });

          print('count: $Count');
        },
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int  Count;
  Counter(this.Count);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text('$Count'),
      ),
    );
  }
}


class StateManagementDemo extends StatelessWidget {
  int Count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementdemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Chip(
          label: Text('$Count'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Count += 1;
          print('count: $Count');
        },
      ),
    );
  }
}
//点击按钮数字并不会发生变化，因为是StatelessWidget