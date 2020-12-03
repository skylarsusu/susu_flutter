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
    return CounterProvider(
      count: Count,
      increaseCount: _inceraseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StatefulManagementdemo'),
          elevation: 0.0,
        ),
        body: CountWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _inceraseCount,
        ),
      ),
    );
  }
}

class CountWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}


class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final int  Count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;

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


class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

   CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  })  : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}