import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:r_kitchen/Controller/employee_provider.dart';
import 'package:r_kitchen/View/Home/home_screen.dart';

class  SpalshScreen extends StatefulWidget {
  const  SpalshScreen({super.key});

  @override
  State< SpalshScreen> createState() => _SpaloshScreenState();
}

class _SpaloshScreenState extends State< SpalshScreen> {
  @override
  void initState() {

    Future.delayed(Duration(seconds: 3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
    Provider.of<EmployeeProvider>(context,listen: false).fetchAllEmployeeProvider(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome My \nAssinment",textAlign: TextAlign.center,style: GoogleFonts.poppins(
          fontSize: 25,
          color: Colors.black87,
          letterSpacing: 0.6,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
