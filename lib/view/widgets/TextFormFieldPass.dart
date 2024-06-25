import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../../controller/LoginRegisterController.dart';



class CustomeTextPass extends StatelessWidget {
  CustomeTextPass({super.key,this.name,this.icon,this.controller,this.color,this.coloricon,this.textcolor});

  TextEditingController? controller;
  String? name;
  Icon? icon;
  Color? color,coloricon,textcolor;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginRegisterController>(
      builder: (context, provider, child) {
        return TextFormField(

          validator: (value) {
            if(value==null){
              return "field is null";
            }
            if(value.length<8){
              return "Password must be at least 8 characters";
            }
            if(value.length>=8){

            }
          },
          obscureText:provider.state,
          style: TextStyle(color: textcolor),
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: color,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(width: 2, color: Colors.white60),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 2, color: kPrimaryColorFillTxtField)
            ),
            prefixIcon: Icon(Icons.lock,color: coloricon,),
            hintText: name,
            hintStyle: TextStyle(color: textcolor),
            suffixIcon: InkWell(
                onTap: () => provider.ChangeState(),
                child: icon),

          ),
        );
      },
    );;
  }
}
