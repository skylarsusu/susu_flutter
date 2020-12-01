import 'package:flutter/material.dart';
import '../Model/post.dart';
import 'post_show.dart';

class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index){
    // return Text(posts[index].title);
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
              ),

              // Image.network(posts[index].imageUrl),
              // SizedBox(height: 16.0),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 16.0),
            ],
          ),
          Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: () {
                    // debugPrint('Tap');
                    Navigator.of(context).push(
                     MaterialPageRoute(builder: (context) => PostShow(post: posts[index])),
                    );
                  },
                ),
              )
          )
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}