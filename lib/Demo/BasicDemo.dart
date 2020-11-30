import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.pool, size: 32.0,color: Colors.white),
            // color: Color.fromRGBO(255, 54, 255, 1.0),
            padding: EdgeInsets.only(left: 24.0, right: 8.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 54, 255, 1.0),
              border: Border.all(
                color: Colors.indigoAccent[100],
                width: 3.0,
                style: BorderStyle.solid,
              ),
              // borderRadius: BorderRadius.circular(16.0),//四角都是圆角
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(64.0),
              //   bottomLeft: Radius.circular(64.0),
              //
              // ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(6.0,7.0),
                  color: Color.fromRGBO(15, 20, 188, 1.0),
                  blurRadius: 25.0,
                  spreadRadius: -9.0,
                )
              ],
              shape: BoxShape.circle,
              // gradient: RadialGradient(
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 28, 128, 1.0),
              //   ]
              // ),
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 28, 128, 1.0),
                    ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                )


            ),
          )
        ],
      ),
    );
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