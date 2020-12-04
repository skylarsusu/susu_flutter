import 'package:flutter/material.dart';


class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: ActionChip(
        label: Text('0'),
        onPressed: (){
          _counterBloc.log();
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
        onPressed: () {
          _counterBloc.log();
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
  void log() {
    print('Bloc');
  }
}
