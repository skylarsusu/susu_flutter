import 'package:flutter/material.dart';
import '../Model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {

  int _sortColumnIndex ;
  bool _sortAscending = true;
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
                sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  // onSelectAll: (bool value) {//全选
                  //
                  // },
                  columns: [
                    DataColumn(
                        label: Container(
                          width: 50,
                          child: Text('Title') ,
                        ),
                      onSort: (int columnIndex, bool ascending) {
                          setState(() {
                            _sortAscending = ascending;
                            _sortColumnIndex = columnIndex;
                          });
                          debugPrint('columnIndex : $columnIndex , ascending : $ascending');

                          posts.sort((a, b) {
                            if(!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }

                            return a.title.length.compareTo(b.title.length);
                          });
                      }
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
                    selected: e.selected,
                      onSelectChanged: (value) {
                      setState(() {
                        if(e.selected != value){
                          e.selected = value;
                        }
                      });

                      },
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
