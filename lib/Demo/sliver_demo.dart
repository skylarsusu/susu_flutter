import 'package:flutter/material.dart';
import 'package:susu_flutter/Model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('SSS'),
            // pinned: true,
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'flutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SliverSafeArea(
              sliver: SliverPadding(
                padding: EdgeInsets.all(8.0),
                sliver: SliverGridDemo(),
              )
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.only(bottom: 32.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(12.0),
                    elevation: 14.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child:  Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 16/9,
                          child: Text('sususu',textAlign: TextAlign.justify),
                          // color: Colors.pink,
                        ),
                        Positioned(
                            left: 32.0,
                            top: 32.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  posts[index].title,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white
                                  ),
                                ),
                                Text(
                                  posts[index].author,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    )
                  ),
                );
          },
          childCount: posts.length,
        ),
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   crossAxisSpacing: 8.0,
        //   mainAxisSpacing: 8.0,
        //   childAspectRatio: 0.8,
        // )
    );
  }
}


class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              child: Text('sususu',textAlign: TextAlign.justify),
              color: Colors.pink,
            );
          },
          childCount: posts.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.8,
        )
    );
  }
}