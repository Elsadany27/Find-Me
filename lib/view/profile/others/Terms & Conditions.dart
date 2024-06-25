import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../widgets/custome_appbar.dart';


class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.all(10),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomRight)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            //appbar
                SizedBox(height: 15,),
                Custome_appbar(image: "images/image.png",icon: Icons.arrow_back,middle: "Terms & Conditions",),


                //text one
            SizedBox(height: 30,),
            Text("Lorem ipsum dolor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),SizedBox(height: 15,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra."
                " Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra."
                " Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(fontSize: 15,color: Colors.white),),SizedBox(height: 45,),

            //text two
            Text("Lorem ipsum dolor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),SizedBox(height: 10,),
            Text("Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",style: TextStyle(fontSize: 12,color: Colors.white),),SizedBox(height: 20,),

            //container
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 1,color: Colors.white),color: Colors.black),
              child: Text("Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(color: Colors.white),),
            ),

            //last text
            SizedBox(height: 20,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(color: Colors.white),)
          ]),
        ),
      );
  }
}
