import 'package:flutter/material.dart';
import '../Model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              DataTable(
                  columns: [
                    DataColumn(
                        label: Container(
                          width: 50,
                          child: Text('Title') ,
                        )
                    ),
                    DataColumn(label: Text('Author')),
                    DataColumn(
                        label: Container(
                          width: 200,
                          child: Text('Description') ,
                        )
                    ),
                  ],
                  rows: posts.map((e) => DataRow(
                      cells: [
                        DataCell(Text(e.title)),
                        DataCell(Text(e.author)),
                        DataCell(Text(e.description)),
                      ],
                  )
                  ).toList(),
              ),
            ],
          ),
      ),
    );
  }
}
