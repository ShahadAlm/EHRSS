import 'package:employee_db/screens/wrapper.dart';
import 'package:employee_db/services/auth.dart';
import 'package:employee_db/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
          home:Wrapper(), //wrapper
        ),
    );
  }
}
