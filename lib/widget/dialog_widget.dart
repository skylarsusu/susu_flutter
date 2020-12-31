import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../page_index.dart';

class DialogWidget extends StatefulWidget {
  @override
  createState() => DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  String appName;
  String packageName;
  String version;
  String buildNumber;

  @override
  void initState() {
    super.initState();

    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subtitle1
        .copyWith(color: theme.textTheme.caption.color);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Dialog Widget")),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 22.0),
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => NetworkGiffyDialog(
                        image: Image.network(
                          "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          'Granny Eating Chocolate',
                          textAlign: TextAlign.center,
                          style: dialogTextStyle,
                        ),
                        description: Text(
                          'This is a granny eating chocolate dialog box. This library helps you easily create fancy giffy dialog.',
                          textAlign: TextAlign.center,
                        ),
                        onOkButtonPressed: () {},
                      ));
            },
            child: Text('Network giffy dialog'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AssetGiffyDialog(
                        image: Image.asset(
                          'images/timg.gif',
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          'Men Wearing Jackets',
                          style: dialogTextStyle,
                        ),
                        description: Text(
                          'This is a men wearing jackets dialog box. This library helps you easily create fancy giffy dialog.',
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                        onOkButtonPressed: () {},
                      ));
            },
            child: Text('Asset giffy dialog'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    title: Text('提示'),
                    //标题
                    titlePadding: EdgeInsets.all(20),
                    //标题的padding值
                    content: Text(
                      '是否想放弃学习Flutter',
                      style: dialogTextStyle,
                    ),
                    //弹框展示主要内容
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    //内容的padding值
                    actions: <Widget>[
                      //操作按钮数组
                      FlatButton(
                        onPressed: () {
                          print("取消");
                          Navigator.pop(context);
                        },
                        child: Text('取消'),
                      ),
                      FlatButton(
                        onPressed: () {
                          print('确定');
                          Navigator.pop(context);
                        },
                        child: Text('确定'),
                      ),
                    ],
                  );
                },
                barrierDismissible: false,
              );
            },
            child: Text("AlertDialog"),
          ),
          Divider(),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Info', style: dialogTextStyle), //标题
                      titlePadding: EdgeInsets.all(20), //标题的padding值
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.account_circle),
                          ),
                          title: Text('username@gmail.com'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.account_balance),
                          ),
                          title: Text('user02@gmail.com'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.add_circle),
                          ),
                          title: Text('add account'),
                          onTap: null,
                        ),
                      ],
                      contentPadding: EdgeInsets.all(0),
                    );
                  });
            },
            child: Text("SimpleDialog"),
          ),
          Divider(),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  // 设置点击 dialog 外部不取消 dialog，默认能够取消
                  barrierDismissible: false,
                  builder: (context) {
                    return AboutDialog(
                      applicationName: '$appName',
                      applicationIcon: Image.asset('images/flutter_logo.png',
                          width: 60.0, height: 60.0),
                      applicationVersion: '$version',
                      //版本号，默认为空
                      applicationLegalese: '版权所有：SCL',
                      children: <Widget>[
                        Text("具体的内容"),
                        Text('具体的布局'),
                      ],
                    );
                  });
            },
            child: Text("AboutDialog"),
          ),
          Divider(),
          AboutListTile(
              icon: CircleAvatar(
                  child: Icon(Icons.update, color: Colors.white, size: 20.0),
                  maxRadius: 15),
              child: Text('AboutListTile'),
              applicationName: '$appName',
              applicationIcon: Image.asset('images/flutter_logo.png',
                  width: 60.0, height: 60.0),
              applicationVersion: '$version',
              //版本号，默认为空
              applicationLegalese: '版权所有：SCL',
              aboutBoxChildren: <Widget>[
                Text("BoxChildren"),
                Text("box child 2")
              ]),
          Divider(),
          RaisedButton(
            onPressed: () {
              _showStatefulWidgetDialog(context);
            },
            child: Text('ProgressDialog'),
          ),
          Divider(),
          RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BaseDialog(
                          Column(children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: Text("自定义Dialog",
                                    style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 2,
                                        color:
                                            Theme.of(context).primaryColor))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text("Hello 自定义Dialog"))),
                            Container(
                                height: 50,
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop(this);
                                          },
                                          child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              alignment: Alignment.center,
                                              width: 100,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(0.4),
                                                        Theme.of(context)
                                                            .primaryColor
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              child: Text("关闭",
                                                  style: TextStyle(
                                                      letterSpacing: 3,
                                                      color: Colors.white))))
                                    ]))
                          ]),
                          140,
                          MediaQuery.of(context).size.width * .6);
                    });
              },
              child: Text('自定义Dialog')),
          Divider(),
          RaisedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    // Dialog 的背景色
                    barrierColor: Colors.grey.withOpacity(.4),
                    // 控制 Dialog 是否消失
                    barrierDismissible: true,
                    barrierLabel: "",
                    // Dialog 显示或者消失的时间，也就是动画的时间
                    transitionDuration: Duration(milliseconds: 400),
                    // RouteTransitionsBuilder 类型的构建方法，定义了 Dialog 的动画。
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.rotate(
                          angle: anim1.value * 360,
                          child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world")));
                    });
              },
              child: Text('旋转动画Dialog')),
          Divider(),
          RaisedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.scale(
                          scale: anim1.value,
                          child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world")));
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return;
                    });
              },
              child: Text('缩放动画Dialog')),
          Divider(),
          RaisedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.rotate(
                          angle: anim1.value * 360,
                          child: Opacity(
                              opacity: anim1.value,
                              child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  title: Text("Dialog"),
                                  content: Text("Hello world"))));
                    });
              },
              child: Text('旋转+渐变动画Dialog')),
          Divider(),
          RaisedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      return Transform.scale(
                          scale: anim1.value,
                          child: Opacity(
                            opacity: anim1.value,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world"),
                            ),
                          ));
                    });
              },
              child: Text('缩放+渐变动画Dialog')),
          Divider(),
          RaisedButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return;
                    },
                    barrierColor: Colors.grey.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 400),
                    transitionBuilder: (context, anim1, anim2, child) {
                      final curvedValue =
                          Curves.easeInOutBack.transform(anim1.value) - 1.0;
                      return Transform(
                          transform: Matrix4.translationValues(
                              0.0, curvedValue * 200, 0.0),
                          child: Opacity(
                            opacity: anim1.value,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: Text("Dialog"),
                              content: Text("Hello world"),
                            ),
                          ));
                    });
              },
              child: Text('曲线变换动画Dialog')),
          Divider(),
          Builder(
            builder: (context) => RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('收藏成功'),
                    action: SnackBarAction(label: '撤销', onPressed: () {}),
                    duration: Duration(milliseconds: 2000)));
              },
              child: Text('SnackBar'),
            ),
          ),
          Divider(),
          CupertinoButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('提示'),
                      //弹框标题
                      content: Text('是否想放弃学习Flutter', style: dialogTextStyle),
                      //弹框内容
                      actions: <Widget>[
                        //操作控件
                        CupertinoDialogAction(
                          onPressed: () {
                            //控件点击监听
                            print("我不会放弃的");
                            Navigator.pop(context, "取消");
                          },
                          child: Text('取消'), //控件显示内容
                          isDefaultAction: true,
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            print("我投降");
                            Navigator.pop(context, "确定");
                          },
                          child: Text('确定'),
                          isDestructiveAction: true,
                        ),
                      ],
                    );
                  });
            },
            child: Text("CupertinoAlertDialog"),
            color: CupertinoColors.activeBlue,
          ),
          Divider(),
          CupertinoButton(
            child: const Text('Alert with Title'),
            color: CupertinoColors.activeBlue,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text(
                      'Allow "Maps" to access your location while you are using the app?',
                      style: dialogTextStyle),
                  content: Text(
                      'Your current location will be displayed on the map and used '
                      'for directions, nearby search results, and estimated travel times.',
                      style: dialogTextStyle),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('Don\'t Allow'),
                      onPressed: () {
                        Navigator.pop(context, 'Disallow');
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('Allow'),
                      onPressed: () {
                        Navigator.pop(context, 'Allow');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(),
          CupertinoButton(
              child: const Text('Alert with Buttons'),
              color: CupertinoColors.activeBlue,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                      title: Text('Select Favorite Dessert'),
                      content: Text(
                          'Please select your favorite type of dessert from the'
                          'list below.Your selection will be used to customize the suggested list of eateries in your area.',
                          style: dialogTextStyle),
                      actions: items(context)))),
          Divider(),
          CupertinoButton(
              child: const Text('Alert Buttons Only'),
              color: CupertinoColors.activeBlue,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) =>
                      CupertinoAlertDialog(actions: items(context)))),
          Divider(),
          CupertinoButton(
            child: const Text('Action Sheet'),
            color: CupertinoColors.activeBlue,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
            onPressed: () {
              showCupertinoModalPopup<String>(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                      title: const Text('Favorite Dessert'),
                      message: Text(
                          'Please select the best dessert from the options below.',
                          style: dialogTextStyle),
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          child: const Text('Profiteroles'),
                          onPressed: () {
                            Navigator.pop(context, 'Profiteroles');
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('Cannolis'),
                          onPressed: () {
                            Navigator.pop(context, 'Cannolis');
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('Trifle'),
                          onPressed: () {
                            Navigator.pop(context, 'Trifle');
                          },
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text('Cancel'),
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                        },
                      )));
            },
          ),
        ],
      ),
    );
  }

  List<Widget> items(context) {
    List<Widget> widgets = [
      CupertinoDialogAction(
        child: const Text('Cheesecake'),
        onPressed: () {
          Navigator.pop(context, 'Cheesecake');
        },
      ),
      CupertinoDialogAction(
        child: const Text('Tiramisu'),
        onPressed: () {
          Navigator.pop(context, 'Tiramisu');
        },
      ),
      CupertinoDialogAction(
        child: const Text('Apple Pie'),
        onPressed: () {
          Navigator.pop(context, 'Apple Pie');
        },
      ),
      CupertinoDialogAction(
        child: const Text("Devil's food cake"),
        onPressed: () {
          Navigator.pop(context, "Devil's food cake");
        },
      ),
      CupertinoDialogAction(
        child: const Text('Banana Split'),
        onPressed: () {
          Navigator.pop(context, 'Banana Split');
        },
      ),
      CupertinoDialogAction(
        child: const Text('Oatmeal Cookie'),
        onPressed: () {
          Navigator.pop(context, 'Oatmeal Cookies');
        },
      ),
      CupertinoDialogAction(
          child: const Text('Chocolate Brownie'),
          onPressed: () => Navigator.pop(context, 'Chocolate Brownies')),
      CupertinoDialogAction(
          child: const Text('Cancel'),
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(context, 'Cancel'))
    ];
    return widgets;
  }

  _showStatefulWidgetDialog(BuildContext context) {
    var progress = 0.0;
    StateSetter stateSetter;

    Timer.periodic(Duration(milliseconds: 200), (timer) {
      // 计时器模拟进度增加
      progress += 0.01;
      if (stateSetter != null) {
        stateSetter(() {});
      }
      if (progress >= 1) {
        timer.cancel();
        stateSetter = null;
        Navigator.of(context).pop();
      }
    });

    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(builder: (ctx, state) {
              stateSetter = state;
              return Center(
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Card(
                          elevation: 24.0,
                          color: Colors.blue.withAlpha(240),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                    value: progress),
                                Gaps.vGap20,
                                Text("Loading...",
                                    style: TextStyle(color: Colors.white)),
                                Gaps.vGap5,
                                Text(
                                    "done ${((progress) * 100).toStringAsFixed(1)}%",
                                    style: TextStyle(color: Colors.white))
                              ]))));
            }),
        // 点击dialog之外是否关闭dialog
        barrierDismissible: false);
  }

  Future<void> _initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });

    debugPrint(
        'APP名称：$appName-====包名：$packageName=====版本名：$version======版本号：$buildNumber');
  }
}

class BaseDialog extends Dialog {
  //子控件
  final Widget widget;

  // 高
  final double height;

  //宽
  final double width;

  BaseDialog(this.widget, this.height, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Material(
                type: MaterialType.transparency,
                child: new Container(
                    height: this.height,
                    width: this.width,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                    child: this.widget))));
  }
}
