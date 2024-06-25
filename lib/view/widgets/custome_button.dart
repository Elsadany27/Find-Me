import 'package:flutter/material.dart';

class CustomeButtonn extends StatelessWidget {
  CustomeButtonn({super.key,this.name_button,required this.ontap,this.color});
  String? name_button;
  final VoidCallback ontap;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff9A0CFE),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
            elevation: 20,
            animationDuration: Duration(milliseconds: 500),
            shadowColor: Colors.blue,
            padding: EdgeInsets.all(14),
            textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
        ),
        onPressed: ontap, child:Text("$name_button",style: TextStyle(color: Colors.white),));
  }
}
