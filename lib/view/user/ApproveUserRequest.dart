import 'dart:convert';

import 'package:findme/controller/RecognizationResultsCntroller.dart';
import 'package:findme/controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../ViewResults/VIewResults.dart';
import '../widgets/custome_appbar.dart';

class ApproveRequestPage extends StatelessWidget {
  const ApproveRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<HomeUserController>(
      builder: (context, provider, child) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //appbar
                  Custome_appbar(image: "images/image.png",middle: "Approved Requests",icon: Icons.arrow_back,),
                  FutureBuilder(
                      future:provider.allApproveRequestuser(context),
                      builder: (context, snapshot) =>Container(
                        // decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomLeft)),
                        height: 550,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(color: Colors.white,thickness: 2,),
                          itemCount:snapshot.data?.data!.length ?? 0,
                          itemBuilder: (context, index) =>snapshot.hasData? //details
                          ListTile(
                            shape:OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 2)),
                            // isThreeLine: true,
                            onTap: (){
                              Provider.of<Recognizationresultscntroller>(context,listen: false).idapprove=snapshot.data!.data![index].id;
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ViewResults() ,));
                            },
                            tileColor: textformcolor,
                            title: Text("${snapshot.data?.data![index].descripation}",style: TextStyle(color: Colors.white,fontSize: 15),),
                            subtitle: Text("${snapshot.data?.data![index].id}",style: TextStyle(color: Colors.white,fontSize: 15),),
                            trailing: Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: MemoryImage(base64Decode("${snapshot.data!.data![index].photo.toString()}")))
                              ),
                            ),
                          ):snapshot.hasError?
                          Center(child: Text("Error",style:TextStyle(fontSize: 50,color: Colors.white),)):Center(child: CircularProgressIndicator()),),
                      )),

                  // Text("${Provider.of<Recognizationresultscntroller>(context,listen: false).idapprove}",style: TextStyle(color: Colors.white,fontSize: 20),),


                ],
              ),
            ));
      },
    );
  }
}
