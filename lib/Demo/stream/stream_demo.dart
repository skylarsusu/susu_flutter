import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('create a stream');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('start listening on a stream');
    _streamDemo.listen((event) {
      print('$event');
    },
      onError: (error){
        print('error: $error');
      },
      onDone: (){
        print('done!');
      }
    );
    print('Initialize conplete');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    // throw 'Something happened';
    return 'hello ~';
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

