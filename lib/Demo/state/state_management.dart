import 'package:flutter/material.dart';

class StatefulManagementDemo extends StatefulWidget {
  @override
  _StatefulManagementDemoState createState() => _StatefulManagementDemoState();
}

class _StatefulManagementDemoState extends State<StatefulManagementDemo> {
  int Count = 0;
  void _inceraseCount() {
    setState(() {
      setState(() {
        Count += 1;
      });

      print('count: $Count');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulManagementdemo'),
        elevation: 0.0,
      ),
      body: CountWrapper(Count, _inceraseCount),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _inceraseCount,
      ),
    );
  }
}

class CountWrapper extends StatelessWidget {
  final int  Count;
  final VoidCallback increaseCount;

  CountWrapper(this.Count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(Count, increaseCount),
    );
  }
}


class Counter extends StatelessWidget {
  final int  Count;
  final VoidCallback increaseCount;

  Counter(this.Count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return ActionChip(
        label: Text('$Count'),
        onPressed: increaseCount,
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