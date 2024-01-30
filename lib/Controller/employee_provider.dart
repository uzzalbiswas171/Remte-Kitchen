
import 'package:flutter/material.dart';
import 'package:r_kitchen/CustomHttp/custom_http.dart';

class EmployeeProvider with ChangeNotifier{
  List employee=[];
  fetchAllEmployeeProvider(BuildContext context)async{
    employee=await CustomHttp().getAllEmployeeHttp(context);
    notifyListeners();
  }
}