import 'package:employee_db/screens/sidebar/sidebar_layout.dart';
import 'package:employee_db/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:employee_db/shared/constants.dart';
import 'package:employee_db/screens/home/authenticate/first_page.dart';

import 'package:employee_db/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.4, 1, 0.9],
            colors: [
              Color(0xFFe0ebec),
              Color(0xFFdcd1d5),
              Color(0xFFc8a6b1),
              Color(0xFFa81743),
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 33.0),
          alignment: Alignment.center,
          child: new ListView(children: <Widget>[
            new Image.asset(
              'assest/img/logo1.png',
            ),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Enter your email',
                        icon: new Icon(
                          Icons.person,
                          color: Colors.pink[700],
                        ),
                      ),
                      validator: (val) =>
                          val.isEmpty ? 'PLEASE ENTER AN EMAIL!' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20.0),
                  TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Enter your password',
                        icon: new Icon(
                          Icons.lock_outline,
                          color: Colors.pink[700],
                        ),
                      ),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'ENTER A PASSWORD 6+ CHARS LONG'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      }),
                  SizedBox(height: 20.0),
                   Container(
                  decoration: BoxDecoration(
                    color: Colors.pink[700],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                 child: FlatButton(
                      color: Colors.pink[700],
                      child: Text(
                        'sign in',
                        style: TextStyle(color: Colors.white , fontSize: 18.0),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                              setState(()=> SideBarLayout());
                          if (result == null) {
                            setState((){ 
                             error = 'COULD NOT SIGN IN WITH THOSE CREDENTIALS';
                             loading =false;
                          });
                           }else{Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
                          }
                        }
                      }),),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                 
                   FlatButton(
                    onPressed: () => widget.toggleView(),
                    child: Text(
                      'Not registered ? Sign Up',
                      style: TextStyle(color: Colors.pink[700], fontSize: 18.0),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingScreen()));
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.pink[700],
                    iconSize: 30.0,
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
