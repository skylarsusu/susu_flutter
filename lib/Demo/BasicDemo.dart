import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  TextDemo();
    // return

  }
}

class TextDemo extends StatelessWidget {
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

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
        text: TextSpan(
            text: 'susu',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 34.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100,
            ),
            children: [
              TextSpan(
                  text: '.net',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey,
                  )
              )
            ]
        )
    );
  }
}