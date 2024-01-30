
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:r_kitchen/Controller/employee_provider.dart';
import 'package:r_kitchen/CustomComponent/CustomText.dart';
import 'package:r_kitchen/View/Home/employees.dart';

import 'create_employee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
           backgroundColor: Colors.blue,
           centerTitle: true,title: Text("Welcome")),
      body: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue.shade100,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeScreen(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                    color: Colors.greenAccent.shade100,
                  ),
                  child: Center(child: Text("Employees",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 0.60
                  ),),),
                ),
              )),
              SizedBox(height: 10,),
              Expanded(child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEmployeeScreen(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.amber.shade200,
                  ),
                  child: Center(child: Text("Create Employee",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 0.60
                  ),),),
                ),
              )),

            ],
          ),
        ),
      ),
    );
  }
}



