import 'package:flutter/material.dart';

import '../../../const/const.dart';
import '../../widgets/custome_appbar.dart';


class HelpCenter  extends StatelessWidget {
  const HelpCenter ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomRight)),
          child: ListView(children: [
            //appbar
            Custome_appbar(image: "images/image.png",icon: Icons.arrow_back,middle: "Help Center",),

            //search
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.white,width: 1)),
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white)
                ),
              ),
            ),

            //text
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              margin: EdgeInsets.all(15),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2)
              ),
              child: Column(children: [
                ListTile(title: Text("Lorem ipsum dolor sit amet",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),trailing: IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){}),),
              SizedBox(height: 10,),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat."
                  " Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et."
                  " Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",style: TextStyle(color: Colors.white,fontSize: 14),)
              ]),
            ),

            //listtile
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(width: 2),),
                    child:ListTile(title: Text("Lorem ipsum dolor sit amet",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                      trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,),onPressed: (){}),),
                  ),),
            )
          ],),
        ),
      );
  }
}
