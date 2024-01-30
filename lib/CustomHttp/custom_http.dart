

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../const.dart';

class CustomHttp{
   getAllEmployeeHttp(BuildContext context)async{
    dynamic employees;
    String link="${BaseUrl}${Employees}";
    try{
      Response response=await http.get(Uri.parse(link));
      print(response.body);
      if(response.statusCode==200){
      employees=jsonDecode(response.body)["data"];
      }
     } catch(e){
       print("Get All Employee Catch error ${e}");
     }
     return employees;
  }

  /// Create employee
   fetchCreateEmployeehttp(BuildContext context,String name,String salary,String age)async{

    String link="${BaseUrl}${Employees}";
    var body = new Map<String, dynamic>();
    body['employee_name'] = "$name";
    body['employee_salary'] = "$salary";
    body['employee_age'] = "$age";
    try{
      Response response=await http.post(Uri.parse(link),);
      print(response.body);
      if(response.statusCode==200){
     final employees=jsonDecode(response.body);

      }
     } catch(e){
       print("Create Employee Catch error ${e}");
     }
  }
}