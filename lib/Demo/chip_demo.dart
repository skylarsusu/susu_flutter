import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];
  String _action = 'Nothing';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text('Life'),
                ),
                // SizedBox(width: 8.0,),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                // SizedBox(width: 8.0,),
                Chip(
                  label: Text('Susu-susu'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('苏'),
                  ),
                ),
                Chip(
                  label: Text('suxiaobao'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('牛'),
                  ),
                ),
                Chip(
                    label: Text('City'),
                  onDeleted: (){},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                Divider(//浅灰色分割线
                  color: Colors.red,
                  height: 32.0,
                  // indent: 32.0,//缩进
                ),

                Wrap(
                  spacing: 8.0,
                  children: _tags.map((e) => Chip(
                      label: Text(e),
                    onDeleted: () {
                        setState(() {
                          _tags.remove(e);
                        });
                    },
                  )).toList(),
                ),
                Divider(//浅灰色分割线
                  color: Colors.red,
                  height: 32.0,
                  // indent: 32.0,//缩进
                ),

                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),

                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((e) => ActionChip(
                      label: Text(e),
                    onPressed: () {
                        setState(() {
                          _action = e;
                        });
                    },
                    // onDeleted: () {
                    //     setState(() {
                    //       _tags.remove(e);
                    //     });
                    // },
                  )).toList(),
                )
              ],

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
          });
        },
      ),
    );
  }
}
