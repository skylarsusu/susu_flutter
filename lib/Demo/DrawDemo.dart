import 'package:flutter/material.dart';

class DrawDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('susu',style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('1122@163.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://huaban.com/pins/877248115/'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              // image: DecorationImage(
              //   image: NetworkImage('https://resourses.ninghao.org/images/childhood-in-a-picture.jpg'),
              //   fit: BoxFit.cover,
              //   colorFilter: ColorFilter.mode(Colors.yellow[400], BlendMode.hardLight),
              // )
            ),

          ),
          ListTile(
            title: Text('Message',textAlign: TextAlign.right),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favourite',textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Setting',textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}