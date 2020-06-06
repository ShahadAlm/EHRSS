import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_db/models/employee.dart';
import 'package:employee_db/models/user.dart';
import 'package:employee_db/screens/home/admin/admin_page.dart';
import 'package:employee_db/screens/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference employeeCollection = Firestore.instance.collection('employee');

  Future<void> updateUserData(String name, String email, String department,int mobile, String state, String role) async {
    return await employeeCollection.document(uid).setData({
      'email': email,
      'name': name,
      'department': department,
      'mobile': mobile,
      'state' : state,
      'role' : role,
    });
  }
  // employee list from snapshot

  List<Employee> _employeeListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){

      return Employee(
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
        department: doc.data['depatment'] ?? '',
        mobile: doc.data['mobile'] ?? '',
        state: doc.data['state'] ?? '',
        role: doc.data['role'] ?? '',
        
      );
    }).toList();
  }

   // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(

      uid :uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      department: snapshot.data['department'],
      mobile: snapshot.data['mobile'],
      state: snapshot.data['state'],
      role: snapshot.data['role'],
      
    );}

    // get employee stream
  Stream<List<Employee>> get employee {
    return employeeCollection.snapshots()
      .map(_employeeListFromSnapshot);
  }

   // get user doc stream
  Stream<UserData> get userData {
    return employeeCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

  

  
  checkRole(DocumentSnapshot snapshot) {
    
    if (snapshot.data['role'] == 'admin') {
      return AdminPage();
    } else {
      return SideBarLayout();
    }
  }
Widget build(BuildContext context) {
   
    return FutureBuilder(
         future: Firestore.instance
                          .collection('employee')
                          .getDocuments(),
           builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return checkRole(snapshot.data);
          }
          return LinearProgressIndicator();
        },
      );
}
}