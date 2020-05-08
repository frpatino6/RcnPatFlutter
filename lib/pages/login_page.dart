import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _validate = false;
  String _userName = "";
  String _pws = "";

  String tokenId;

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: Image.asset('assets/images/rcntevision.png'),
      ),
    );
    final title = Text(
      'App para conductores',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
        fontSize: 25.0,
      ),
    );
    return Scaffold(
        key: _scaffoldKey,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2, // takes 30% of available width
              child: logo,
            ),
            Expanded(
              flex: 1, // takes 30% of available width
              child: title,
            ),
            Expanded(
              flex: 7, // takes 70% of available width
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[_cardTipo1(context)],
                ),
              ),
            ),
          ],
        ));
  }

  _cardTipo1(BuildContext contextCard) {
    final email = TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        initialValue: '',
        validator: (value) {
          print(value);
          if (value.isEmpty) {
            return 'Por favor ingrese el nombre de usuario';
          }
          return null;
        },
        onChanged: (value) {
          _userName = value;
        },
        decoration: InputDecoration(
          errorText: _validate ? 'Value Can\'t Be Empty' : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Email',
          labelText: 'Ingrese usuario',
          prefixIcon: Icon(Icons.account_circle),
        ));

    final password = TextFormField(
        autofocus: false,
        initialValue: '',
        obscureText: true,
        onChanged: (value) {
          _pws = value;
        },
        validator: (value) {
          print(value);
          if (value.isEmpty) {
            return 'Por favor ingrese la contrasena';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'password',
          labelText: 'Ingrese password',
          prefixIcon: Icon(Icons.lock_outline),
        ));

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () {
          _validateUserPws(contextCard);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Ingresar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Card(
      elevation: 50.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              email,
              SizedBox(height: 18.0),
              password,
              SizedBox(height: 5.0),
              loginButton,
            ],
          ),
        ),
      ),
    );
  }

  _validateUserPws(context) {
    if (!_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      final snackBar = SnackBar(
        content: Text('Erro al autenticar'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        elevation: 50.0,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      if (_userName != '' && _pws != '')
        Navigator.pushNamed(context, 'listServices');
    }
  }
}
