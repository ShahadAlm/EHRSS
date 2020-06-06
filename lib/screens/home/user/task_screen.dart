
import 'package:employee_db/models/task.dart';
import 'package:employee_db/services/firestoreServices.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';


class TaskScreen extends StatefulWidget  {
  final Task task;
  TaskScreen(this.task);
  @override
  _TaskScreenState createState() => _TaskScreenState();
}



class _TaskScreenState extends State<TaskScreen> {
  FirestoreService fireServ = new FirestoreService();

  TextEditingController _taskNameController;
  TextEditingController _taskDetailsController;
  TextEditingController _taskDateController;
  TextEditingController _taskStateController;

  int _myTaskType = 0;
  DateTime _dateTime;

  
  String taskVal;
  void _handleTaskType(int value) {
    setState(() {
      _myTaskType = value;
      switch (_myTaskType) {
        case 1:
         taskVal='Vacation';
          break;
        case 2:
           taskVal='Loan';
          break;
        case 3:
           taskVal='Permission';
          break;
        case 4:
           taskVal='Sick Leave';
          break;
        case 5:
           taskVal='Others';
          break;
      }
    });
  }
  

  @override
  void initState() {
    super.initState();

    _taskNameController = new TextEditingController(text: widget.task.taskname);
     _taskDetailsController = new TextEditingController(text: widget.task.taskdetails);
     _taskDateController = new TextEditingController(text: widget.task.taskdate);
     _taskStateController = new TextEditingController(text: widget.task.tasktState);
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
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    controller: _taskNameController,
                    decoration: InputDecoration(labelText: "Task: "),
                    
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0,),
                  child: TextField(
                    maxLines: 4,
                    controller: _taskDetailsController,
                    decoration: InputDecoration(labelText: "Details:  ")
                   
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child:  Column(children: <Widget>[    RaisedButton(  
                                    child: Text('Select a date'),
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                               initialDate:  DateTime.now(),
                      firstDate:
                           DateTime.now().subtract( Duration(days: 1)),
                      lastDate:  DateTime(2021))
                                          .then((date) {
                                        setState(() {
                                          _dateTime = date;
                                        });
                                      });
                                    },
                                  ) 
                                 , Text(_dateTime == null
                                      ? 'No date selected yet !'
                                      :  new DateFormat('dd-MM-yyyy').format(_dateTime)),
                                      ],),
                                 

                ),
               
                
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'Select Your Request Type:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _myTaskType,
                          onChanged: _handleTaskType,
                          activeColor: Color(0xff4158ba),
                        ),
                        Text(
                          'Vacation',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: _myTaskType,
                          onChanged: _handleTaskType,
                          activeColor: Color(0xfffb537f),
                        ),
                        Text(
                          'Loan',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 3,
                          groupValue: _myTaskType,
                          onChanged: _handleTaskType,
                          activeColor: Color(0xff4caf50),
                        ),
                        Text(
                          'Permission',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 4,
                          groupValue: _myTaskType,
                          onChanged: _handleTaskType,
                          activeColor: Color(0xff9962d0),
                        ),
                        Text(
                          'Sick Leave',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 5,
                          groupValue: _myTaskType,
                          onChanged: _handleTaskType,
                          activeColor: Color(0xff0dc8f5),
                        ),
                        Text(
                          'Others',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
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
                  'New Tasks',
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
  }
}