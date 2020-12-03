import 'dart:ui';

import 'package:flutter/material.dart';
import '../Model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((e) => Card(
            child: Column(
              children: [
                AspectRatio(
                    aspectRatio: 16/9,
                  child: Icon(Icons.map),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                  ),
                  title: Text(e.title),
                  subtitle: Text(e.author),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(e.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: [
                      FlatButton(
                          onPressed: () {},
                          child: Text('LIke'.toUpperCase()),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('read'.toUpperCase()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )).toList(),
        ),
      ),
    );
  }
}
