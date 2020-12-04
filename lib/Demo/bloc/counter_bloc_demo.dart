import 'dart:async';
import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: (){
              // _counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        },

      )
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
        onPressed: () {
          // _counterBloc.log();
          _counterBloc.counter.add(1);
        },
      child: Icon(Icons.add),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc;
  const CounterProvider({
    Key key,
    @required Widget child,
    this.bloc,
  })  : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;
  CounterBloc() {
    _counterActionController.stream.listen((event) {
      print('event: $event');
      _count = event + _count;
      _counterController.add(_count);
    });

  }


  void disponse() {
      _counterActionController.close();
      _counterController.close();
  }


  void log() {
    print('Bloc');

  }
}
