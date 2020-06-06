//import 'package:employee_db/screens/home/authenticate/first_page.dart';
import 'package:employee_db/screens/home/authenticate/register.dart';
import 'package:employee_db/screens/home/authenticate/sign_in.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
   
    if (showSignIn){
      return SignIn(toggleView : toggleView);
    }else{
      return Register(toggleView : toggleView);
    }
  }
}