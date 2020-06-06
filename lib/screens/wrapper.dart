import 'package:employee_db/models/user.dart';
import 'package:employee_db/screens/home/authenticate/first_page.dart';
import 'package:employee_db/screens/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user= Provider.of<User>(context);
    

    // return either home or first widgets
    if (user== null){
      return OnboardingScreen();
    } else{
      return SideBarLayout();
    }
  }
}