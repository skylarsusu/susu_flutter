import 'dart:async';

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
  StreamSubscription _streamDemoSubscription;
  // Stream<String> _streamDemo;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    // TODO: implement dispose
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('create a stream');
    // _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();

    _sinkDemo = _streamDemo.sink;
    print('start listening on a stream');

    _streamDemoSubscription = _streamDemo.stream.listen((event) {
      setState(() {
        _data = event;
      });
      print('$event');
    },
      onError: (error){
        print('error: $error');
      },
      onDone: (){
        print('done!');
      }
    );

    _streamDemo.stream.listen((event) {
      print('onDataTwo: $event');
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
    await Future.delayed(Duration(seconds: 5));
    // throw 'Something happened';
    return 'hello ~';
  }

  void _addDataToStream() async{

    String data = await fetchData();
    _sinkDemo.add(data);
    // _streamDemo.add(data);
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }
  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }
  void _cancelStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
                initialData: '...',
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: _addDataToStream,
                  child: Text('Add'),
                ),
                FlatButton(
                    onPressed: _pauseStream,
                    child: Text('Pause'),
                ),
                FlatButton(
                    onPressed: _resumeStream,
                    child: Text('Resum'),
                ),           FlatButton(
                    onPressed: _cancelStream,
                    child: Text('cancel'),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}

