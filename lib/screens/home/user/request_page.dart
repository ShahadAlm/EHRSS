import 'dart:async';
import 'package:employee_db/models/task.dart';
import 'package:employee_db/screens/home/user/task_screen.dart';
import 'package:employee_db/screens/sidebar/sidebar_layout.dart';
import 'package:employee_db/services/firestoreServices.dart';
import 'package:employee_db/shared/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Reqepage extends StatefulWidget  with NavigationStates {
  @override
  _Reqepage createState() => _Reqepage();
}

class _Reqepage extends State<Reqepage> {
  List<Task> items;
  FirestoreService fireServ = new FirestoreService();
  StreamSubscription<QuerySnapshot> todoTasks;

  @override
  void initState() {
    super.initState();

    items=new List();

    todoTasks?.cancel();
    todoTasks=fireServ.getTaskList().listen((QuerySnapshot snapshot){
        final List<Task> tasks=snapshot.documents
        .map((documentSnapshot) => Task. fromMap(documentSnapshot.data))
        .toList();

        setState(() {
        this.items = tasks;
      });
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          _myAppBar(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Stack(children: <Widget>[
                    // The containers in the background
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Colors.white,
                              elevation: 14.0,
                              shadowColor: Color(0x802196F3),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[

                                      todoType('${items[index].tasktype}'),
                                      Text(
                                        '${items[index].taskname}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[

                                          


                                          Text(
                                            '${items[index].taskdate}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            '${items[index].tasktState}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ]);
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFa81743),
        child: Icon(
          FontAwesomeIcons.listUl,
          color: Color(0xFFdcd1d5),
        ),
        onPressed: () {
          //Navigator.push(context,MaterialPageRoute(builder: (context) => TaskScreen()),
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskScreen(Task('', '', '', '', '')),
                fullscreenDialog: true),
          );
        },
      ),
    );
  }


  Widget todoType(String icontype) {
    IconData iconval;
    Color colorval;
    switch (icontype) {
      case 'Vacation':
        iconval = FontAwesomeIcons.prescription;
        colorval = Color(0xff4158ba);
        break;
      case 'Loan':
        iconval = FontAwesomeIcons.book;
        colorval = Color(0xfffb537f);
        break;
      case 'Permission':
        iconval = FontAwesomeIcons.pen;
        colorval = Color(0xff4caf50);
        break;
      case 'Sick Leave':
        iconval = FontAwesomeIcons.home;
        colorval = Color(0xff9962d0);
        break;
      default:
         iconval = FontAwesomeIcons.tasks;
         colorval = Color(0xff0dc8f5);
      //
    }
    return CircleAvatar(
      backgroundColor: colorval,
      child: Icon(iconval, color: Colors.white, size: 20.0),
    );
  }

  Widget _myAppBar(context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xFFa81743),
              const Color(0xFFdcd1d5),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    ),
                    onPressed: () {  {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    SideBarLayout()),
                                                        //TimeTable()),
                                              );
                                            }
                      //
                    }),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  'Request ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     child: IconButton(
            //         icon: Icon(
            //           FontAwesomeIcons.search,
            //           color: Colors.white,
            //         ),
            //         onPressed: () {
            //           //
            //         }),
            //   ),
            // ),
          ],
        )),
      ),
    );
  }
}