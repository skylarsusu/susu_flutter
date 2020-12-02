import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextFieldDemo(),
              RegisterForm(),
            ],
          ),
        ),
      )
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;

  void submitRegisterForm () {
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();

    debugPrint('username: $username');
    debugPrint('password: $password');

    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text('Registering...')),
    );
  }
  String validateUsername(value) {
    if(value.isEmpty){
      return 'UserName is required.';
    }
    return null;
  }

  String validatorPassword(value) {
    if(value.isEmpty){
      return 'UserName is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'UserName',
                helperText: '',
              ),
              onSaved: (value) {
                username = value;
              },
              validator: validateUsername,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'PassWord',
                helperText: '',
              ),
              onSaved: (value) {
                password = value;
              },
              validator: validatorPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction ,
            ),
            SizedBox(height: 32.0),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text('Register', style: TextStyle(color: Colors.white)),
                elevation: 0.0,
                onPressed: submitRegisterForm,
              ),
            )
          ],

        ));
  }
}


class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value) {
      //   debugPrint('input: $value');
      // },
      onSubmitted: (value) {
        debugPrint('submit: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title',
          // border: InputBorder.none,//无下划线
        // border: OutlineInputBorder(),
        filled: true,
      ),
    );
  }
}


class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
