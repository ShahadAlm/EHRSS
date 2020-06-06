import 'package:employee_db/screens/sidebar/sidebar_layout.dart';
import 'package:employee_db/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:employee_db/services/auth.dart';
import 'package:employee_db/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading= false;

  String email = '';
  String password = '';
  String error= '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink[700],
          elevation: 0.0,
          title: Text('Register to ESS-HR'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              textColor: Colors.white,
              onPressed: () => widget.toggleView(),
            ),
          ]),
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
        padding: const EdgeInsets.all(33.5),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Enter your email'),
                validator: (val) => val.isEmpty ? 'PLEASE ENTER AN EMAIL!' : null,
                onChanged: (val) {
                setState(() => email = val);
              }),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Enter your password'),
                obscureText: true,
                  validator: (val) => val.length < 6 ? 'ENTER A PASSWORD!' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
             TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Enter your name'),
                validator: (val) => val.isEmpty ? 'PLEASE ENTER YOUR NAME!' : null,
                onChanged: (val) {}),
      
              SizedBox(height: 20.0),
             TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Enter your phone number'),
                validator: (val) => val.isEmpty ? 'PLEASE ENTER YOUR PHONE NUMBER!' : null,
                onChanged: (val) {}),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[700],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                        setState((){ 
                         loading= false;
                          error= 'please supply a valid email';
                          });
                      }
                      else{
                        return
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
                      }
                    } 
                  }),
                 SizedBox(height: 12.0),
                 Text(
                   error, 
                   style: TextStyle(color: Colors.red, fontSize:14.0),
                 )
            ],
          ),
        ),
      ),
    );
  }
}
