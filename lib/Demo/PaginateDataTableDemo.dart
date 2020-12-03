import 'package:flutter/material.dart';
import '../Model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _post = posts;
  int _selectedCount = 0;
  @override
  // TODO: implement rowCount
  int get rowCount => _post.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    return DataRow(
        cells: [
          DataCell(Text(_post[index].title)),
          DataCell(Text(_post[index].author)),
          DataCell(Text(_post[index].description)),
        ]
    );
  }

}

class PaginateDataTableDemo extends StatefulWidget {
  @override
  _PaginateDataTableDemoState createState() => _PaginateDataTableDemoState();
}

class _PaginateDataTableDemoState extends State<PaginateDataTableDemo> {

  int _sortColumnIndex ;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginateDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PaginatedDataTable(
              header: Text('Text'),
              rowsPerPage: 5,
              source: _postDataSource,
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

            ),
          ],
        ),
      ),
    );
  }
}
