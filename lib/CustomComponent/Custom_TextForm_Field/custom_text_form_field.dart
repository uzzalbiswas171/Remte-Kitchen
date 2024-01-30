
import 'package:flutter/material.dart';
import 'package:r_kitchen/const.dart';

class CustomTextFormField extends StatefulWidget {
    CustomTextFormField({super.key,
      required this.maxline,
      required this.height,
      required this.hintext,
      required this.controller,
      required this.obscureText,
      this.suffix,


    });

  String ?  hintext;
  int ? maxline;
  double ?height;
    final TextEditingController? controller;
   late bool obscureText;
   Widget? suffix;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}


class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.height,
      width: double.infinity,
      margin: EdgeInsets.only(
          left: 15,right: 15
      ),
      child: TextFormField(
        obscureText: widget.obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter  numbers only";
          } else {
            return null;
          }
        },
        // final TextEditingController? controller;
          controller: widget.controller,
        maxLines: widget.maxline,

        decoration: InputDecoration(
          suffixIcon: widget.suffix,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: textFieldBoarderColorC,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(
                color:textFieldBoarderColorC,
                width: 2.0,
              ),
            ),
            hintText: "${widget.hintext}",
            errorStyle: TextStyle(
              fontSize: 0.1,
            ),
            contentPadding: EdgeInsets.only(left: 10,right: 0,top: 0,bottom: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
            )
        ),
      ),
    );
  }
}



class CustomTextFormFieldd extends StatefulWidget {
    CustomTextFormFieldd({super.key,
      required this.maxline,
      required this.height,
      required this.hintext,
      required this.controller,
      required this.obscureText,
      this.suffix,


    });

  String ?  hintext;
  int ? maxline;
  double ?height;
    final TextEditingController? controller;
   late bool obscureText;
   Widget? suffix;
  @override
  State<CustomTextFormFieldd> createState() => _CustomTextFormFielddState();
}


class _CustomTextFormFielddState extends State<CustomTextFormFieldd> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.height,
      width: double.infinity,
      margin: EdgeInsets.only(
          left: 15,right: 15
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: widget.obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter  numbers only";
          } else {
            return null;
          }
        },
        // final TextEditingController? controller;
          controller: widget.controller,
        maxLines: widget.maxline,

        decoration: InputDecoration(
          suffixIcon: widget.suffix,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: textFieldBoarderColorC,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(
                color:textFieldBoarderColorC,
                width: 2.0,
              ),
            ),
            hintText: "${widget.hintext}",
            errorStyle: TextStyle(
              fontSize: 0.1,
            ),
            contentPadding: EdgeInsets.only(left: 10,right: 0,top: 0,bottom: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
            )
        ),
      ),
    );
  }
}
