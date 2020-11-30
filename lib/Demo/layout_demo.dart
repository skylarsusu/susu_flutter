import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return IconBadge(Icons.pool);
    // return Column(
    //   children: [
    //     IconBadge(Icons.pool,size: 32.0,)
    //   ],
    return Container(
      child: Column(//Row
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         ConstrainedBox(
           constraints: BoxConstraints(
             minHeight: 200.0,
             maxWidth: 200.0,
           ),
           child: Container(
             color: Color.fromRGBO(3, 54, 255, 1.0),
           ),
         )
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  AspectRatio(
      aspectRatio: 1.0/1.0,
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(Icons.ac_unit, color: Colors.white, size: 32),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(3, 54, 255, 1.0),
              // borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 54, 255, 1.0),
                    ]
                )
            ),
            child: Icon(Icons.brightness_1, color: Colors.white, size: 32),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 20.0,
          child:  Icon(Icons.brightness_1, color: Colors.white, size: 20),
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {
    this.size = 64.0
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size,
      height: size,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}