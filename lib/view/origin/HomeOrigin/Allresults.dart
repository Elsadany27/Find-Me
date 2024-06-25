import 'package:findme/const/const.dart';
import 'package:flutter/material.dart';

import '../../widgets/TextFormFieldjoo.dart';
import '../../widgets/custome_appbar.dart';
import '../../widgets/custome_button.dart';
import 'data.dart';

class AllResults extends StatelessWidget {
  AllResults({super.key});
  SizedBox size=SizedBox(height: 20,);
  TextEditingController id=TextEditingController();

  List<data> Data=[
    data(name: "Youssef",address: "2 cairo1",id: "122354444",birthday: "2/7/2002",job: "Engineer",Marital_status: "Single"),
    data(name: "Youssef",address: "2 cairo1",id: "122354444",birthday: "2/7/2002",job: "Engineer",Marital_status: "Single"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Custome_appbar(image: "images/image.png",icon: Icons.arrow_back,middle: "All Results",),


              Container(
                color: Colors.black,
                height: 680,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(color: Colors.white,thickness: 2,),
                  itemCount: Data.length,
                  itemBuilder:(context, index) => Card(
                    elevation: 20,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.black,
                    child:
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("My Data ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white) ,),
                          CircleAvatar(backgroundImage: AssetImage("images/image.png"),radius: 20,)],),
                      Container(
                        color: pinkcolor,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("ID: ${Data[index].id}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),SizedBox(height: 10,),
                            Text("name: ${Data[index].name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),SizedBox(height: 10,),
                            Text("Address: ${Data[index].address}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),SizedBox(height: 10,),
                            Text("Birthday: ${Data[index].birthday}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),SizedBox(height: 10,),
                            Text("Marital status: ${Data[index].Marital_status}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),SizedBox(height: 10,),
                            Text("Job: ${Data[index].job}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),SizedBox(height: 10,),
                          ],),
                      )

                    ],),),),
              ),


            ])
        ),
      ),
    );
  }
}
