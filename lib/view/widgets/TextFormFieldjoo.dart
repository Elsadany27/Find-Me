import 'package:flutter/material.dart';

import '../../const/const.dart';

class CustomeTextformfield extends StatelessWidget {
  CustomeTextformfield(
      {super.key, this.name, this.icon, this.controller, this.label,this.color,this.sIcon,this.textcolor});

  String? name, label;
  Icon? icon;
  Icon? sIcon;
  TextEditingController? controller;
  Color? color,textcolor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value==null){
          return "field is null";
        }
      },
      style: TextStyle(color: textcolor),
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: color,
          suffixIcon: sIcon,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 2, color: Colors.white60),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 1, color: Colors.white)),

          prefixIcon: icon,
          hintText: name,
          hintStyle: TextStyle(color: textcolor,fontSize: 12),
          labelText: label,
          labelStyle: TextStyle(color: textcolor)),
    );
  }
}
