
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_db/models/task.dart';
import 'package:employee_db/services/firestoreServices.dart';

class TaskState extends StatefulWidget  {
  final Task task;
  TaskState(this.task);
  @override
  _ChangeTaskState createState() => _ChangeTaskState();
}

class _ChangeTaskState extends State<TaskState> {
  FirestoreService fireServ = new FirestoreService();

  TextEditingController _taskNameController;
  TextEditingController _taskDetailsController;
  TextEditingController _taskDateController;
  TextEditingController _taskStateController;
  
  String taskState;
  String taskVal;

  getTaskState(taskState){
    this.taskState=taskState;
  }


 createData(){
    DocumentReference ds=Firestore.instance.collection('todolist').document(taskState);
    Map<String,dynamic> tasks={
   
          "taskState":taskState,
    };

    ds.setData(tasks).whenComplete((){
      print("task updated");
    });



  

 }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          _myAppBar(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              children: <Widget>[
             
                 Column(
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(left: 16.0, right: 16.0),
                       child: TextField(
                         controller: _taskStateController,
                     decoration: InputDecoration(labelText: "State: "),
                       ),
                ),
                   ],
                 ),
                SizedBox(
                  height: 10.0,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0xFFFA7397),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        )),
                    // This button results in adding the contact to the database
                    RaisedButton(
                        color: Color(0xFFFA7397),
                        onPressed: () {
                          fireServ.createTODOTask(_taskNameController.text, _taskDetailsController.text,_taskDateController.text,_taskStateController.text,taskVal).then((_) {
                           Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white,
                        ))
                    )],
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget _myAppBar() {
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
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  'Request',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }}
