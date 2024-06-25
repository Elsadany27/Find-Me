import 'package:flutter/material.dart';

import '../../const/const.dart';

class CustomeOptions extends StatelessWidget {
   CustomeOptions({super.key,this.name,this.icon,required this.ontap});
  String? name;
  IconData? icon;
   final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color:textformcolor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1,)
      ),
      height: 50,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 200,child: Row(children: [Icon(icon,color: Colors.white,),SizedBox(width: 15,),
            Text("$name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white)),]),),
          IconButton(onPressed: ontap, icon: Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white,))
        ],),
    );
  }
}
