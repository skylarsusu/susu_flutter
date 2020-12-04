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
  PublishSubject<String> _textFiledSubject;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textFiledSubject.close();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textFiledSubject = PublishSubject<String>();
    _textFiledSubject
        // .map((event) => 'item: $event')
    // .where((event) => event.length > 1)
    .debounceTime(Duration(milliseconds: 500))
    .listen((event) {
      print(event);
    });
    // _textFiledSubject.listen((value) {
    //   print(value);
    // });

    // _textFiledSubject.close();
/*
    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();//两个消息都可以听到，若两个消息挨着会听到后面的消息
    ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);//监听器可以听到所有的消息,maxSize: 2控制监听的最大信息量，此为后两个

    _subject.add('hello');
    _subject.add('hola');
    _subject.add('hi');
    _subject.listen((value) {
      print('listen 1 : $value');
    });
    // _subject.add('hello');

    _subject.listen((value) {
      print('listen 2 : $value');
    });
    // _subject.add('hola');

    // Observable<String> _observable = Observable(Stream);
    // Observable<String> _observable;

    _subject.close();

 */
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: TextField(
          onChanged: (value) {
            _textFiledSubject.add('input: $value');
          },
          onSubmitted: (value) {
            _textFiledSubject.add('submit: $value');
          },
          decoration: InputDecoration(
            labelText: 'Title',
            filled: true,
          ),

        )
    );
  }
}
