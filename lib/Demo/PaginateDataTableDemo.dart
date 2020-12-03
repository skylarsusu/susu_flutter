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
    final Post post = _post[index];
    return DataRow(
      // selected: _post[index].selected,
      //   onSelectChanged: (value) {
      //      if(post.selected != value){
      //        post.selected = value;
      //      }
      //   },
        cells: [
          DataCell(Text(_post[index].title)),
          DataCell(Text(_post[index].author)),
          DataCell(Text(_post[index].description)),
        ]
    );
  }

  void _sort(getField(post), bool ascending) {
    _post.sort((a,b) {
      if(!ascending){
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
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
                      _postDataSource._sort((post) => post.title.length, ascending);
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
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
