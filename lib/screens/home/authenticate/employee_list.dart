import 'package:employee_db/models/employee.dart';
import 'package:employee_db/screens/home/authenticate/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    
    final employee = Provider.of<List<Employee>>(context)??[];
    
  
  


    return ListView.builder(
      itemCount: employee.length,
      itemBuilder: (context, index){
        return ProfilePage(employee: employee[index]);
      },
      
    );
  }
}