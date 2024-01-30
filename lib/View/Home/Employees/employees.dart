import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:r_kitchen/CustomComponent/Custom_TextForm_Field/custom_text_form_field.dart';
import 'package:r_kitchen/CustomComponent/custom_button.dart';
import 'package:r_kitchen/View/Home/Employees/employee_profile.dart';
import 'package:r_kitchen/View/Home/home_screen.dart';

import '../../../Controller/employee_provider.dart';
import '../../../CustomComponent/CustomText.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  final _employee_name=TextEditingController();
  final _employee_age=TextEditingController();
  final _employee_salary=TextEditingController();
  bool obscureText=false;
  final _formKeyy=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final employee=Provider.of<EmployeeProvider>(context).employee;
    print("cccccccccccccccccccccccccccccccccccccccccccccccccccc ${employee}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.arrow_back),color: Colors.blue,),
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
      body: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Container(
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
                    color: Colors.blue.shade100.withOpacity(0.7)
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom15TExt(text: "Name : ${employee[index]["employee_name"]}"),
                      Custom15TExt(text: "Salary : ${employee[index]["employee_salary"]}"),
                      Custom15TExt(text: "Age : ${employee[index]["employee_age"]}"),
                      Container(height: 35,width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(onPressed: () {
                             Provider.of<EmployeeProvider>(context,listen: false).getDeleteIDProvider(context, "${employee[index]["id"]}");
                            }, child: Icon(Icons.delete)),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(onPressed: () {
                              _employee_name.text="${employee[index]["employee_name"]}";
                              _employee_age.text="${employee[index]["employee_age"]}";
                              _employee_salary.text="${employee[index]["employee_salary"]}";
                              showDialog(context: context, builder: (context) {
                             return   AlertDialog(title: Custom15TExt(text: "Update Employee"),actions: [
                                  CustomTextFormField(maxline: 1, height: 50, hintext: "Enter name", controller: _employee_name, obscureText: obscureText),
                                  CustomTextFormField(maxline: 1, height: 50, hintext: "Enter Age", controller: _employee_age, obscureText: obscureText),
                                  CustomTextFormField(maxline: 1, height: 50, hintext: "Enter Salary", controller: _employee_salary, obscureText: obscureText),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: CustomButton(onTap: () {
                                        Provider.of<EmployeeProvider>(context,listen: false).getUpdateIDWiseProvider(context, _employee_name.text, _employee_salary.text, _employee_age.text, "${employee[index]["id"]}");

                                        Flushbar(
                                          flushbarPosition: FlushbarPosition.TOP,
                                          title:  "Creating Employee",
                                          message:  "Please Wait ...",
                                          duration:  Duration(seconds: 1),
                                        )..show(context);

                                        setState(() {
                                          _employee_name.text="";
                                          _employee_age.text="";
                                          _employee_salary.text="";
                                        });
                                        Future.delayed(Duration(seconds: 3),() {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmployeeScreen(),));
                                        },);

                                    }, text: "Save", button_text_fontSize: 16, button_height: 50, customButton_color: Colors.red),
                                  )
                                ],);
                              },);
                            }, child: Icon(Icons.edit)),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeProfileScreen(
                                Single_employee: employee[index],
                              ),));
                            }, child: Text("View"))
                          ],
                        ),
                      )
                    ]
                ),
              );
            },),
        ),
      ),
floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
floatingActionButton:FloatingActionButton(
  child: Icon(Icons.home,size: 30,color: Colors.white,),
  backgroundColor: Colors.redAccent,
  onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
},) ,
    );
  }
}
