import 'package:employee_db/screens/home/user/note_details.dart';
import 'package:flutter/material.dart';
import 'package:employee_db/models/crud.dart';

class ShowNoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowNoteListState();
  }
}

class ShowNoteListState extends State<ShowNoteList> {
  var count;
  var note;
  AsyncSnapshot<dynamic> snapshot;

  CrudMethods crudObj = new CrudMethods();

  @override
  void initState() {
    crudObj.getData().then((result) {
      note = result;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Check Feedback'),
        backgroundColor: Colors.pink[700],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                crudObj.getData().then((result) {
                  note = result;
                });
              });
              getNoteList();
            },
          )
        ],

      ),
      body: getNoteList(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.pink[700],
      //   onPressed: () {
      //     debugPrint('FAB CLICKED');
      //     navigateToDetail(note, 'Add Note');
      //   },
      //   tooltip: 'Add Note',
      //   child: Icon(Icons.add),
      // ),
    );
  }

  Widget getNoteList() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    if (note != null) {
      return StreamBuilder(
        stream: note,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: getPriorityColor(
                          snapshot.data.documents[i].data['notePriority']),
                      child: getPriorityIcon(
                          snapshot.data.documents[i].data['notePriority']),
                    ),
                    title: Text(
                      snapshot.data.documents[i].data['noteTitle'],
                      style: titleStyle,
                    ),
                    subtitle: Text(
                      snapshot.data.documents[i].data['noteDescription'],
                      style: titleStyle,
                    ),
                    trailing: GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // dialogTrigger(context, 'Delete Note', 'Are You Sure?')
                        //     .whenComplete(() {

                        // });
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Delete Note',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Text('Are You Sure?'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    textColor: Colors.blue,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Yes'),
                                    textColor: Colors.blue,
                                    onPressed: () {
                                      crudObj.deleteData(snapshot
                                          .data.documents[i].documentID);
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                        debugPrint('deleted');
                      },
                    ),
                    onTap: () {
                      navigateToDetail(
                          snapshot.data.documents[i].documentID, 'Update Data');
                    },
                  ),
                );
              },
            );
          }
        },
      );
    } else {
      crudObj.getData().then((result) {
        note = result;
      });
      return Text('Loading please wait....!');
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.pinkAccent;
        break;
      case 2:
        return Colors.pink[100];
        break;
       case 3:
        return Colors.pink[200];
        break;  
      default:
        return Colors.pink;
        break;
    }
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.play_arrow);
        break;
      default:
        return Icon(Icons.play_arrow);
        break;
    }
  }

  void navigateToDetail(selectedID, String title) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => NoteDetail(selectedID, title)));

    if (result == true) {
      crudObj.getData().then((result) {
        note = result;
      });
    }
  }

  Future<bool> dialogTrigger(
      BuildContext context, dialogTitle, dialogDescription) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              dialogTitle,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            content: Text(dialogDescription),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }


  
}




