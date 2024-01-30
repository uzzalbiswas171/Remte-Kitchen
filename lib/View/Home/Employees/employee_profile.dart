import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r_kitchen/CustomComponent/CustomText.dart';

class EmployeeProfileScreen extends StatefulWidget {
    EmployeeProfileScreen({Key? key,required this.Single_employee}) : super(key: key);
   final Single_employee;
  @override
  State<EmployeeProfileScreen> createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.arrow_back),color: Colors.blue,),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:  Text("Profile",style: GoogleFonts.poppins(
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
        color: Colors.blue.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 160,
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.green.shade100,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.orange.shade200,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:  AssetImage("image/uzzal.jpg"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 36,
                      right: 36,
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 10,
                        child: Icon(Icons.add, size: 20,color: Colors.white,),
                      )),
                ],
              ),
            ),
          Container(
            padding: EdgeInsets.all(
               20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom15TExt(text: "Name : ${widget.Single_employee["employee_name"]}"),
                Divider(),
                Custom15TExt(text: "Salary : ${widget.Single_employee["employee_salary"]} BDT"),
                Divider(),
                Custom15TExt(text: "Age : ${widget.Single_employee["employee_age"]} years"),
                Divider(),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
