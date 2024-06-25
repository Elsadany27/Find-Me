import 'dart:convert';

import 'package:findme/controller/HomeOriginController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../widgets/CustomeMaterialButton.dart';
import '../../widgets/custome_options.dart';

class PinPosts extends StatelessWidget {
  const PinPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeOriginrController>(
  builder: (context, provider, child) {
  return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //appbar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: pinkcolor,)),
              Text("Pin Posts Page",style: TextStyle(color: pinkcolor,fontSize: 18),),
              Image.asset("images/image.png",width: 120,color: pinkcolor,)
            ],),SizedBox(height: 20,),

          //posts
          Container(
              height: 650,
              child: FutureBuilder(
                future: provider.getAllPinPosts(),
                builder: (context, snapshot) =>snapshot.hasData?ListView.builder(
                  itemCount: snapshot.data?.data!.length,
                  itemBuilder:(context, index) => Card(
                    color: Colors.black,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,color: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //options
                          Container(
                            alignment: Alignment.topRight,
                            child:IconButton(onPressed: (){
                              provider.idpost=snapshot.data!.data![index].id;
                              showModalBottomSheet(context: context, builder:(context)=>Container(
                                padding: EdgeInsets.all(20),
                                height: 250,
                                color: Colors.black,
                                child: Column(children: [
                                  CustomeOptions(ontap: (){
                                    provider.deletePost(context);
                                  },name: "Delete",icon: Icons.delete,),SizedBox(height: 15,),
                                  CustomeOptions(ontap: (){
                                    provider.unpinPosts(context);
                                  },name: "Unpin",icon: Icons.delete_forever_sharp,),SizedBox(height: 15,),
                                ],),
                              ));
                            },icon: Icon(Icons.more_horiz,color: Colors.white,),) ,
                          ),
                          //profile logo
                          // Row(children: [
                          //   CircleAvatar(backgroundImage: AssetImage("images/google.png"),),SizedBox(width: 10,),
                          //   Text("${post[index].name}",style: TextStyle(color: Colors.white),)
                          // ],),
                          //image people injured
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 8),
                              width: 200,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(image: MemoryImage(base64Decode("${snapshot.data!.data![index].photo.toString()}")),
                                    fit:BoxFit.fill ),
                              ),
                            ),
                          ),
                          //content
                          Text("${snapshot.data!.data![index].address}",style: TextStyle(color: Colors.white),),SizedBox(height: 20,),
                          Center(child: Text("${snapshot.data!.data![index].descripation}",style: TextStyle(color: Colors.white),)),SizedBox(height: 12,),

                          //chat & comment
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Customematerialbutton(text: "Comment",ontap: (){},),
                              Customematerialbutton(text: "Chatting",ontap: (){},),
                            ],),

                          // Text("${provider.iduser}",style: TextStyle(color: Colors.white,fontSize: 20),),
                          // Text("${provider.idpost}",style: TextStyle(color: Colors.white,fontSize: 20),),


                        ],),
                    ),
                  ),):snapshot.hasError?Center(child: Text("Error",style: TextStyle(fontSize: 50,color: Colors.white),)):
                Center(child: CircularProgressIndicator()),
              ))
        ],
      ),
    );
  },
);
  }
}
