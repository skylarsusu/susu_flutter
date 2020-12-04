import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // PublishSubject<String> _subject = PublishSubject<String>();
    BehaviorSubject<String> _subject = BehaviorSubject<String>();

    _subject.listen((value) {
      print('listen 1 : $value');
    });
    _subject.add('hello');

    _subject.listen((value) {
      print('listen 2 : $value');
    });
    _subject.add('hola');
    // Observable<String> _observable = Observable(Stream);
    // Observable<String> _observable;

    _subject.close();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
