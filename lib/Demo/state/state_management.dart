import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


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
    return ScopedModel(
      model: CounterModel(),
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
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
          label: Text('${model.count}'),
          onPressed: model.increaseCount,
      ),
    );
  }
}


class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementdemo'),
          elevation: 0.0,
        ),
        body: CountWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
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

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}