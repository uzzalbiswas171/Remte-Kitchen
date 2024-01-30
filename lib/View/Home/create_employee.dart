import 'package:flutter/material.dart';
import 'package:r_kitchen/CustomComponent/Custom_TextForm_Field/custom_text_form_field.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({super.key});

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final _employee_name=TextEditingController();
  final _employee_age=TextEditingController();
  final _employee_salary=TextEditingController();
  bool obscureText=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CustomTextFormField(maxline: 1, height: 50, hintext: "Enter name", controller: _employee_name, obscureText: obscureText),
             CustomTextFormField(maxline: 1, height: 50, hintext: "Enter name", controller: _employee_name, obscureText: obscureText),
             CustomTextFormField(maxline: 1, height: 50, hintext: "Enter name", controller: _employee_name, obscureText: obscureText),
           ],
        ),
      ),
    );
  }
}
