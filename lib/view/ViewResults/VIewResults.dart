import 'dart:convert';

import 'package:findme/controller/RecognizationResultsCntroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';

class ViewResults extends StatelessWidget {
  const ViewResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<Recognizationresultscntroller>(
  builder: (context, provider, child) {
  return Column(
        children: [
          //appbar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 70,),
              Text("All Information",style: TextStyle(color: pinkcolor,fontSize: 18),),
              Image.asset("images/image.png",width: 120,color: pinkcolor,)
            ],),SizedBox(height: 20,),

          //posts
          Container(
              height: 650,
              child: FutureBuilder(
                future: provider.allResults(context),
                builder: (context, snapshot) =>snapshot.hasData?ListView.builder(
                  itemCount: snapshot.data?.data!.length ?? 0,
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
                          Text("${snapshot.data!.data![index].address}",style: TextStyle(color: Colors.white),),SizedBox(height: 5,),
                          Text("${snapshot.data!.data![index].name}",style: TextStyle(color: Colors.white),),SizedBox(height: 5,),
                          Text("Phone 1: ${snapshot.data!.data![index].phoneNumber1}",style: TextStyle(color: Colors.white),),SizedBox(height: 5,),
                          Text("Phone 2: ${snapshot.data!.data![index].phoneNumber2}",style: TextStyle(color: Colors.white),),SizedBox(height: 5,),
                          Text("similarityPercent: ${snapshot.data!.data![index].similarityPercent}",style: TextStyle(color: Colors.white),),SizedBox(height: 5,),
                          Center(child: Text("${snapshot.data!.data![index].nationalId}",style: TextStyle(color: Colors.white),)),SizedBox(height: 12,),


                          // Text("${provider.iduser}",style: TextStyle(color: Colors.white,fontSize: 20),),


                        ],),
                    ),
                  ),
                ):snapshot.hasError?Center(child: Text("Error",style: TextStyle(fontSize: 50,color: Colors.white),
                )):
                Center(child: CircularProgressIndicator()),
              ))
        ],
      );
  },
),
    );
  }
}
