import 'package:findme/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeCardHome extends StatelessWidget {
  CustomeCardHome({super.key,this.bcolor,this.icon,this.text,required this.ontap});
  Color? bcolor;
  IconData? icon;
  String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [pinkcolor, Colors.black],begin: Alignment.bottomRight,end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(15),
            color: bcolor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(icon,size: 35,color: Colors.white,),
          SizedBox(height: 10,),
          Text("$text",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),)
        ],),
      ),
    );
  }
}
