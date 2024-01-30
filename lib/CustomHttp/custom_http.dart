

import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
}