

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:r_kitchen/Controller/employee_provider.dart';

import '../const.dart';

class CustomHttp{
   getAllEmployeeHttp(BuildContext context)async{
    dynamic employees;
    String link="${BaseUrl}/api/v1/employees";
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

    String link="${BaseUrl}/api/v1/create";
    var body = new Map<String, dynamic>();
    body['employee_name'] = "$name";
    body['employee_salary'] = "$salary";
    body['employee_age'] = "$age";
    try{
      Response response=await http.post(Uri.parse(link),body: body);
      print(response.body);
      if(response.statusCode==200){
     final employees=jsonDecode(response.body);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         duration: Duration(seconds: 3),
         content: Text("Create Successful,.\nPlease Try to hit other Api after 1 min...")));
      }
     } catch(e){
       print("Create Employee Catch error ${e}");
     }
  }


  ///Delete data
   getDeleteIDHttp(BuildContext context,String id)async{
     print("delete iddddddddddddddddddddd ===> $id");
     dynamic employees;
     String link="${BaseUrl}/api/v1/delete/$id";
     try{
       Response response=await http.delete(Uri.parse(link));
       print(response.body);
       if(response.statusCode==200){
         employees=jsonDecode(response.body);
         Future.delayed(Duration(seconds: 70),() {
        //   Provider.of<EmployeeProvider>(context,listen: false).fetchAllEmployeeProvider(context);
         },);
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             duration: Duration(seconds: 2),
             content: Text("Delete Successful,\n This employee list will be upload after i min...")));
       }
     } catch(e){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             duration: Duration(seconds: 2),
               content: Text("Please Try to api hit after 1 min...")));
     }
     return employees;
   }

  ///Update  data
   getUpdateIDWiseDataHttp(BuildContext context,String name,String salary,String age,String id)async{
     print("delete iddddddddddddddddddddd ===> $id");
     dynamic updateEmployees;
     String link="${BaseUrl}/api/v1/update/$id";
     var body = new Map<String, dynamic>();
     body['employee_name'] = "$name";
     body['employee_salary'] = "$salary";
     body['employee_age'] = "$age";
     try{
       Response response=await http.put(Uri.parse(link));
       print(response.body);
       if(response.statusCode==200){
         updateEmployees=jsonDecode(response.body);
         Future.delayed(Duration(seconds: 70),() {
       //    Provider.of<EmployeeProvider>(context,listen: false).fetchAllEmployeeProvider(context);
         },);
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             duration: Duration(seconds: 3),
             content: Text("Update Successful,\nPlease Try to hit other Api after 1 min...")));
       }
     } catch(e){
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             duration: Duration(seconds: 2),
               content: Text("Please Try to api hit after 1 min...")));
     }
     return updateEmployees;
   }
}