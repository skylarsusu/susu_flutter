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
        children: [
          IconBadge(Icons.pool),
          IconBadge(Icons.beach_access),
          IconBadge(Icons.airplanemode_active),
        ],
      ),
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