import 'package:flutter/material.dart';

import '../../const/const.dart';

class Customematerialbutton extends StatelessWidget {
   Customematerialbutton({super.key,this.text,required this.ontap});
  String? text;
   final VoidCallback ontap;
   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: MaterialButton(onPressed:ontap,shape: BeveledRectangleBorder(
        side: BorderSide(width: 1,color: pinkcolor,style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(15),
      ),child: Text("$text",style: TextStyle(color: Colors.white),),
        color: Colors.black,),
    );
  }
}
