
import 'package:findme/view/user/DetailsUser/Male_data.dart';
import 'package:flutter/material.dart';

import 'female.dart';


class DetailsUserPage extends StatelessWidget {
  const DetailsUserPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.only(top: 450,right: 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/gi.jpeg"),fit: BoxFit.fill)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Your Sex",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(icon: Icon(Icons.male,size: 80,color: Colors.white,),onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MaleData(),));
              },),SizedBox(width: 20,),
              IconButton(icon: Icon(Icons.female,size: 80,color: Colors.white,),onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FemaleData(),));
              },),SizedBox(width: 20,),
            ],)
          ],
        ),
      ),
    );
  }
}


