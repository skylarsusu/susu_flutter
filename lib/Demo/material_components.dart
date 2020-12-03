import 'package:flutter/material.dart';
import 'package:susu_flutter/Demo/PaginateDataTableDemo.dart';
import 'package:susu_flutter/Demo/card_demo.dart';
import 'package:susu_flutter/Demo/switch_demo_new.dart';
import 'form_demo.dart';
import 'checkbox_demo.dart';
import 'radio_demo.dart';
import 'slider_demo.dart';
import 'detetime_demo.dart';
import 'simple_dialog_demo.dart';
import 'expansion_panel_demo.dart';
import 'chip_demo.dart';
import 'data_table_demo.dart';
import 'PaginateDataTableDemo.dart';
import 'chip_demo.dart';
import 'stepper_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ListItem(title: 'StepperDemo', page: StepperDemo()),
          ListItem(title: 'CardDemo', page: CardDemo()),
          ListItem(title: 'PaginatedDataTableDemo', page: PaginateDataTableDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
          ListItem(title: 'ChipDemo', page: ChipDemo()),
          ListItem(title: 'ExpansionPanelDemo', page: ExpansionPanelDemo()),
          ListItem(title: 'SimpleDialog', page: SimpleDialogDemo()),
          ListItem(title: 'DateTimeDemo', page: DateTimeDemo()),
          ListItem(title: 'SliderDemo', page: SliderDemo()),
          ListItem(title: 'RadioDemo', page: RadioDemo()),
          ListItem(title: 'SwitchDemo', page: SwitchDemo()),
          ListItem(title: 'CheckBoxDemo', page: CheckBoxDemo()),
          ListItem(title: 'Form', page: FormDemo()),
          ListItem(title: 'PopupMenuButtonDemo', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'FloatingActionButtonDemo', page: FloatingActionButtonDemo()),
          ListItem(title: 'FloatingActionButtonDemo', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String currentMenuItem = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuBUtton'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(currentMenuItem),
                PopupMenuButton(
                    onSelected: (value) {
                      print(value);
                      setState(() {
                        currentMenuItem = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'Home',
                        child: Text('Home'),
                      ),
                      PopupMenuItem(
                        value: 'Discover',
                        child: Text('Discover'),
                      ),
                      PopupMenuItem(
                        value: 'Selected',
                        child: Text('Selected'),
                      ),
                    ]
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class ButtonDemo extends StatelessWidget {
  final Widget FlatButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FlatButton(
        onPressed: (){},
        child: Text('Button'),
        splashColor: Colors.grey,
        textColor: Colors.black87,
      ),
      FlatButton.icon(
        icon: Icon(Icons.add),
        onPressed: (){},
        label: Text('Button'),
        splashColor: Colors.grey,
        textColor: Colors.black87,
      ),
    ],
  );
  // final Widget RaisedButtonDemo =    Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Theme(
  //       data: Theme.of(context).copyWith(
  //         buttonColor: Theme.of(context).accentColor,
  //         buttonTheme: ButtonThemeData(
  //           textTheme: ButtonTextTheme.primary,
  //           // shape: BeveledRectangleBorder(
  //           //   borderRadius: BorderRadius.circular(6.0),
  //           // )
  //           shape: StadiumBorder(),
  //         ),
  //       ),
  //       child:  RaisedButton(
  //         onPressed: (){},
  //         child: Text('Button'),
  //         splashColor: Colors.grey,
  //         // textColor: Colors.grey,
  //         // color: Theme.of(context).primaryColor,
  //         // textTheme: ButtonTextTheme.primary,
  //       ),
  //     ),
  //
  //     SizedBox(width: 16.0),
  //     RaisedButton.icon(
  //       icon: Icon(Icons.add),
  //       onPressed: (){},
  //       label: Text('Button'),
  //       splashColor: Colors.grey,
  //       textColor: Theme.of(context).accentColor,
  //     ),
  //   ],
  // );

  // final Widget OutlineButtonDemo =       Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Theme(
  //       data: Theme.of(context).copyWith(
  //         buttonColor: Theme.of(context).accentColor,
  //         buttonTheme: ButtonThemeData(
  //           textTheme: ButtonTextTheme.primary,
  //           // shape: BeveledRectangleBorder(
  //           //   borderRadius: BorderRadius.circular(6.0),
  //           // )
  //           shape: StadiumBorder(),
  //         ),
  //       ),
  //       child:  OutlineButton(
  //         onPressed: (){},
  //         child: Text('Button'),
  //         splashColor: Colors.grey[100],
  //         borderSide: BorderSide(
  //           color: Colors.black,
  //         ),
  //         textColor: Colors.black87,
  //         highlightedBorderColor: Colors.grey,
  //         // textColor: Colors.grey,
  //         // color: Theme.of(context).primaryColor,
  //         // textTheme: ButtonTextTheme.primary,
  //       ),
  //     ),
  //
  //     SizedBox(width: 16.0),
  //     OutlineButton.icon(
  //       icon: Icon(Icons.add),
  //       onPressed: (){},
  //       label: Text('Button'),
  //       splashColor: Colors.grey,
  //       textColor: Theme.of(context).accentColor,
  //     ),
  //   ],
  // )

  final Widget FixedWidthButton =  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 130.0,
        child:  OutlineButton(
          onPressed: (){},
          child: Text('Button'),
          splashColor: Colors.grey[100],
          borderSide: BorderSide(
            color: Colors.black,
          ),
          textColor: Colors.black87,
          highlightedBorderColor: Colors.grey,
          // textColor: Colors.grey,
          // color: Theme.of(context).primaryColor,
          // textTheme: ButtonTextTheme.primary,
        ),
      )
    ],
  );
  final Widget ExpandedButton = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child:  OutlineButton(
          onPressed: (){},
          child: Text('Button'),
          splashColor: Colors.grey[100],
          borderSide: BorderSide(
            color: Colors.black,
          ),
          textColor: Colors.black87,
          highlightedBorderColor: Colors.grey,
          // textColor: Colors.grey,
          // color: Theme.of(context).primaryColor,
          // textTheme: ButtonTextTheme.primary,
        ),
      ),
      SizedBox(width: 16.0),
      Expanded(
        flex: 2,
        child:  OutlineButton(
          onPressed: (){},
          child: Text('Button'),
          splashColor: Colors.grey[100],
          borderSide: BorderSide(
            color: Colors.black,
          ),
          textColor: Colors.black87,
          highlightedBorderColor: Colors.grey,
          // textColor: Colors.grey,
          // color: Theme.of(context).primaryColor,
          // textTheme: ButtonTextTheme.primary,
        ),
      ),
    ],
  );
  // final Widget ButtonBarDemo =  Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Theme(
  //       data: Theme.of(context).copyWith(
  //           buttonTheme: ButtonThemeData(
  //               padding: EdgeInsets.symmetric(horizontal: 100.0)
  //           )
  //       ),
  //       child: ButtonBar(
  //         children: [
  //           OutlineButton(
  //             onPressed: (){},
  //             child: Text('Button'),
  //             splashColor: Colors.grey[100],
  //             borderSide: BorderSide(
  //               color: Colors.black,
  //             ),
  //             textColor: Colors.black87,
  //             highlightedBorderColor: Colors.grey,
  //             // textColor: Colors.grey,
  //             // color: Theme.of(context).primaryColor,
  //             // textTheme: ButtonTextTheme.primary,
  //           ),
  //           OutlineButton(
  //             onPressed: (){},
  //             child: Text('Button'),
  //             splashColor: Colors.grey[100],
  //             borderSide: BorderSide(
  //               color: Colors.black,
  //             ),
  //             textColor: Colors.black87,
  //             highlightedBorderColor: Colors.grey,
  //             // textColor: Colors.grey,
  //             // color: Theme.of(context).primaryColor,
  //             // textTheme: ButtonTextTheme.primary,
  //           ),
  //         ],
  //       ),
  //     ),
  //   ],
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                  },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'Home',
                          child: Text('Home'),
                      ),
                      PopupMenuItem(
                        value: 'Discover',
                        child: Text('Discover'),
                      ),
                      PopupMenuItem(
                        value: 'Selected',
                        child: Text('Selected'),
                      ),
                    ]
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}


class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _floatingActionButton = FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0)
        // ),
    );

    final _floatingActionButtonExtended = FloatingActionButton.extended(
      icon: Icon(Icons.add),
        onPressed: (){},
        label: Text('Add'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
   this.title,
   this.page,
});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
