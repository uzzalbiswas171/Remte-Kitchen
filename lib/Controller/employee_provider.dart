
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
  ///Delete Employee
   dynamic deleteemployees;
  getDeleteIDProvider(BuildContext context,String id)async{
    final deleteemployees =await CustomHttp().getDeleteIDHttp(context, id);
    notifyListeners();
  }
  ///Delete Employee
   dynamic updateEmployees;
  getUpdateIDWiseProvider(BuildContext context,String name,String salary,String age,String id)async{
    final updateEmployees =await CustomHttp().getUpdateIDWiseDataHttp(context, name, salary, age, id);
    notifyListeners();
  }
}