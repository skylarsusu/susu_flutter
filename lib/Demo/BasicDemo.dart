import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  final String _author = '李白';
  final String _title = '将进酒';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
        '《 $_author 》-- $_title 。HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello',
        textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}