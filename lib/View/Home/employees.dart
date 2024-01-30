import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Controller/employee_provider.dart';
import '../../CustomComponent/CustomText.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {


  @override
  void initState() {
    Provider.of<EmployeeProvider>(context,listen: false).fetchAllEmployeeProvider(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final employee=Provider.of<EmployeeProvider>(context).employee;
    print("cccccccccccccccccccccccccccccccccccccccccccccccccccc ${employee}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:  Text( "Employees",style: GoogleFonts.poppins(
            fontSize: 18,
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
            color: Colors.black87
        ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: employee.length,
          itemBuilder:(context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: 15,right: 15,top: 10
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.red
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom15TExt(text: "Name : ${employee[index]["employee_name"]}"),
                    Custom15TExt(text: "Salary : ${employee[index]["employee_salary"]}"),
                    Custom15TExt(text: "Age : ${employee[index]["employee_age"]}"),
                  ]
              ),
            );
          },),
      ),

    );
  }
}
