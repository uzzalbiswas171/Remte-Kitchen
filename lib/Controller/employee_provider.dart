
import 'package:flutter/material.dart';
import 'package:r_kitchen/CustomHttp/custom_http.dart';

class EmployeeProvider with ChangeNotifier{
  List employee=[];
  fetchAllEmployeeProvider(BuildContext context)async{
    employee=await CustomHttp().getAllEmployeeHttp(context);
    notifyListeners();
  }
     ///Create Employee
  fetchCreateEmployeeProvider(BuildContext context,String name,String salary,String age)async{
    final data =await CustomHttp().fetchCreateEmployeehttp(context, name, salary, age);
    notifyListeners();
  }
}