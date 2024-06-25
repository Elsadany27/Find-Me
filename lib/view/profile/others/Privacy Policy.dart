import 'package:flutter/material.dart';
import '../../../const/const.dart';
import '../../widgets/custome_appbar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomRight)),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            //appbar
            // Custome_appbar_without_image(middle: "Privacy Policy",icon: Icons.arrow_back),
                Custome_appbar(image: "images/image.png",icon: Icons.arrow_back,middle: "Privacy Policy",),

                //text one
            SizedBox(height: 1,),
            Text("Your privacy is important",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),SizedBox(height: 10,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                " Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                "Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(fontSize: 12,color: Colors.white),),SizedBox(height: 15,),

                //text two
                SizedBox(height: 30,),
                Text("Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(color: Colors.white),),

                //last Text
                SizedBox(height: 40,),
                Text("Data controllers and contract partners",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),SizedBox(height: 40,),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",style: TextStyle(fontSize: 15,color: Colors.white),),SizedBox(height: 15,),

              ]),
      ),
      );
  }
}
