
import 'package:employee_db/models/user.dart';
import 'package:employee_db/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:employee_db/models/employee.dart';
import 'package:provider/provider.dart';
import 'package:employee_db/shared/navigation_bloc.dart';
import 'package:employee_db/shared/loading.dart';

class ProfilePage extends StatefulWidget  with NavigationStates {
  final Employee employee;
  ProfilePage({this.employee});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String department = '';
  int mobile;
  String state = '';
  String role = '';
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return new Scaffold(
        body: new Container(
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
                child: StreamBuilder<UserData>(
                    stream: DatabaseService(uid: user.uid).userData,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                      UserData userData = snapshot.data;
                      return Form(
                        key: _formKey,
                        child: new ListView(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                new Container(
                                  height: 250.0,
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
                                  child: new Column(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.0, top: 20.0),
                                          child: new Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              new Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.black,
                                                size: 22.0,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 25.0),
                                                child: new Text('PROFILE',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.0,
                                                        fontFamily:
                                                            'sans-serif-light',
                                                        color: Colors.black)),
                                              )
                                            ],
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: new Stack(
                                            fit: StackFit.loose,
                                            children: <Widget>[
                                              new Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  new Container(
                                                      width: 140.0,
                                                      height: 140.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image:
                                                            new DecorationImage(
                                                          image: new ExactAssetImage(
                                                              'assest/img/as.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 90.0, right: 100.0),
                                                  child: new Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      new CircleAvatar(
                                                        backgroundColor:
                                                            Colors.pink[700],
                                                        radius: 25.0,
                                                        child: new Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                                new Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFc8a6b1),
                                        Color(0xFFa81743),
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 25.0),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Employee Information',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    _status
                                                        ? _getEditIcon()
                                                        : new Container(),
                                                  ],
                                                )
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Name',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Flexible(
                                                  child: new TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        hintText:
                                                            'Enter your name',
                                                      ),
                                                      enabled: !_status,
                                                      autofocus: !_status,
                                                      initialValue:
                                                          userData.name,
                                                      validator: (val) => val
                                                              .isEmpty
                                                          ? 'Please enter your name!'
                                                          : null,
                                                      onChanged: (val) {
                                                        setState(() => name =
                                                            val);
                                                      }),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Email ',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Flexible(
                                                  child: new TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  "Enter Email ID"),
                                                      enabled: !_status,
                                                      initialValue:
                                                          userData.email,
                                                      validator: (val) => val
                                                              .isEmpty
                                                          ? 'Please enter email!'
                                                          : null,
                                                      onChanged: (val) {
                                                        setState(() => email =
                                                            val);
                                                      }),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Mobile',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Flexible(
                                                  child: new TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  "Enter Mobile Number"),
                                                      enabled: !_status,
                                                      validator: (val) => val
                                                              .isEmpty
                                                          ? 'Please enter mobile number!'
                                                          : null,
                                                      onChanged: (val) {
                                                        setState(() => mobile =
                                                            userData.mobile);
                                                      }),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    child: new Text(
                                                      ' Department',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  flex: 2,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: new Text(
                                                      'State',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  flex: 2,
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10.0),
                                                    child: new TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Enter department"),
                                                        enabled: !_status,
                                                        validator: (val) => val
                                                                .isEmpty
                                                            ? 'Please enter department!'
                                                            : null,
                                                        onChanged: (val) {
                                                          setState(() =>
                                                              department = 
                                                           val  );
                                                        }),
                                                  ),
                                                  flex: 2,
                                                ),
                                                Flexible(
                                                  child: new TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  "Enter State"),
                                                      enabled: !_status,
                                                      validator: (val) => val
                                                              .isEmpty
                                                          ? 'Please enter state!'
                                                          : null,
                                                      onChanged: (val) {
                                                        setState(() => state =
                                                           val);
                                                      }),
                                                  flex: 2,
                                                ),
                                              ],
                                            )),
                                        // !_status ? _getActionButtons() : new Container(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 25.0,
                                              right: 25.0,
                                              top: 45.0),
                                          child: new Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.0),
                                                  child: Container(
                                                      child: new RaisedButton(
                                                    child: new Text("Save"),
                                                    textColor: Colors.pink[700],
                                                    color: Colors.pink[50],
                                                    onPressed: () async {
                                                      if (_formKey.currentState.validate()) {
                                                        await DatabaseService( uid: user.uid)
                                                            .updateUserData(
                                                              name ?? snapshot.data.name,
                                                              email ?? snapshot.data.email,
                                                              department ?? snapshot.data.department,
                                                              mobile ?? snapshot.data.mobile,
                                                              state ?? snapshot.data.state,
                                                              role ?? snapshot.data.role,
                                                            );
                                                        // Navigator.pop(context);
                                                      }
                                                    },
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    20.0)),
                                                  )),
                                                ),
                                                flex: 2,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Container(
                                                      child: new RaisedButton(
                                                    child: new Text("Cancel"),
                                                    textColor: Colors.pink[700],
                                                    color: Colors.pink[50],
                                                    onPressed: () {
                                                      setState(() {
                                                        _status = true;
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                new FocusNode());
                                                      });
                                                    },
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    20.0)),
                                                  )),
                                                ),
                                                flex: 2,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                  );
                }else{
                      return Loading();
                    }}))));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.pink[700],
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
