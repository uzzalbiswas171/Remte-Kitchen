import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:r_kitchen/Controller/employee_provider.dart';
import 'package:r_kitchen/CustomComponent/Custom_TextForm_Field/custom_text_form_field.dart';
import 'package:r_kitchen/CustomComponent/custom_button.dart';

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
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.blue,
            onPressed: () {
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:  Text( "Create Employees",style: GoogleFonts.poppins(
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
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Center(
                   child: Text("Create Employee",style: GoogleFonts.poppins(
                     fontSize: 30,fontStyle: FontStyle.italic,
                     letterSpacing: 0.40,
                     fontWeight: FontWeight.bold
                   ),),
                 ),
                 SizedBox(height: 10,),
                 CustomTextFormField(maxline: 1, height: 50, hintext: "Enter name", controller: _employee_name, obscureText: obscureText),
                 CustomTextFormField(maxline: 1, height: 50, hintext: "Enter Age", controller: _employee_age, obscureText: obscureText),
                 CustomTextFormField(maxline: 1, height: 50, hintext: "Enter Salary", controller: _employee_salary, obscureText: obscureText),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: CustomButton(onTap: () {
                     if(_formKey.currentState!.validate()){
                       Provider.of<EmployeeProvider>(context,listen: false).fetchCreateEmployeeProvider(context, _employee_name.text, _employee_salary.text, _employee_age.text);
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
                     }else{
                       Flushbar(
                         flushbarPosition: FlushbarPosition.TOP,
                         title:  "Error",
                         message:  "Please Fill all the field",
                         duration:  Duration(seconds: 1),
                       )..show(context);
                     }

                     }, text: "Save", button_text_fontSize: 16, button_height: 50, customButton_color: Colors.red),
                 )
               ],
            ),
          ),
        ),
      ),
    );
  }
}
