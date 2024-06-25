import 'package:flutter/material.dart';

class CustomeListTile extends StatelessWidget {
   CustomeListTile({super.key,this.title,this.icon,required this.ontap,this.arrowicon});
  IconData? icon;
  IconData? arrowicon;
  String? title;
   final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("$title",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
      trailing: IconButton(icon:Icon(arrowicon,),onPressed:ontap,color: Colors.black,),
      leading: CircleAvatar(backgroundColor:Colors.black,child: Icon(icon,color: Colors.white,),radius: 20),
    );
  }
}
