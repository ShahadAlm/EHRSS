
import 'package:employee_db/screens/home/authenticate/chat.dart';
import 'package:employee_db/screens/home/user/event_screen.dart';
import 'package:employee_db/screens/home/user/note_list.dart';
import 'package:employee_db/screens/home/user/request_page.dart';
import 'package:employee_db/shared/navigation_bloc.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget with NavigationStates {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: new ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 380.0,
                  width: double.infinity,
                  color: Colors.pink[700],
                ),
                Positioned(
                  bottom: 50.0,
                  right: 100.0,
                  child: Container(
                    width: 400.0,
                    height: 400.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200.0),
                        color: Colors.pink[400].withOpacity(0.5)),
                  ),
                ),
                Positioned(
                  bottom: 100.0,
                  left: 150.0,
                  child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.0),
                      color: Colors.blue[100].withOpacity(0.5),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'What you ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'desire',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' to do'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Column(
                      children: <Widget>[
                        //////// FIRST  ROW
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
/////////////////////////////////////////////////////////////// first square
                            Container(
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                    height: 125.0,
                                    width: (MediaQuery.of(context).size.width /
                                            2.0) -
                                        20.0,
                                    child: Center(
                                        child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Image.asset(
                                              'assest/img/timetable.png',
                                              fit: BoxFit.cover,
                                              width: 50.0,
                                              height: 50.0),
                                        ),
                                        SizedBox(height: 1.0),
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EventScreen()),
                                              );
                                            },
                                            child: Text('Scheduled events',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ))),
                                      ],
                                    ))),
                              ),
                            )
                            ///////////////////////////////////////////////////////////////// second square
                            ,
                            Container(
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                    height: 125.0,
                                    width: (MediaQuery.of(context).size.width /
                                            2.0) -
                                        20.0,
                                    child: Center(
                                        child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Image.asset(
                                              'assest/img/download.png',
                                              fit: BoxFit.cover,
                                              width: 50.0,
                                              height: 50.0),
                                        ),
                                        SizedBox(height: 1.0),
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                      NoteList()),
                                              );
                                            },
                                            child: Text('Feedback',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ))),
                                      ],
                                    ))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
//////////////////////////////////////////////////////////////////////////////////////// second rows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
/////////////////////////////////////////////////////////////// first square
                            Container(
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                    height: 125.0,
                                    width: (MediaQuery.of(context).size.width /
                                            2.0) -
                                        20.0,
                                    child: Center(
                                        child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Image.asset(
                                              'assest/img/request.png',
                                              fit: BoxFit.cover,
                                              width: 50.0,
                                              height: 50.0),
                                        ),
                                        SizedBox(height: 1.0),
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Reqepage(),)
                                              );
                                            },
                                            child: Text('Request ',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                ))),
                                      ],
                                    ))),
                              ),
                            )
                            ///////////////////////////////////////////////////////////////// second square
                            ,
                            Container(
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                    height: 125.0,
                                    width: (MediaQuery.of(context).size.width /
                                            2.0) -
                                        20.0,
                                    child: Center(
                                        child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Image.asset(
                                              'assest/img/chat.png',
                                              fit: BoxFit.cover,
                                              width: 50.0,
                                              height: 50.0),
                                        ),
                                        SizedBox(height: 1.0),
                                        FlatButton(
                                            onPressed: ()async {
                                              var materialPageRoute = MaterialPageRoute(
                                                    builder: (context) =>
                                                    Chat()
                                                  );
                                              Navigator.push(
                                                  context,
                                                  materialPageRoute);
                                            },
                                            child: Text('Connect with HR',
                                                style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.black,
                                                ))),
                                      ],
                                    ))),
                              ),
                            )
                          ],
                        )
////////////////////////////////////////////////////////////////////////
                        ,
                        SizedBox(height: 6.0)
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: Image.asset(
                'assest/img/logo2.png',
                fit: BoxFit.cover,
                // width: 180.0,
                //  height: 100.0
              ),
            ),
          ],
        )
      ],
    ));
  }
}
