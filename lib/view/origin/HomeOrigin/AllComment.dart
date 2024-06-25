import 'dart:convert';

import 'package:findme/controller/HomeOriginController.dart';
import 'package:findme/view/widgets/custome_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';

class AllCommentPage extends StatelessWidget {
  const AllCommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeOriginrController>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Colors.black,
            body:Column(
              children: [
                //appbar
                Custome_appbar(image: "images/image.png",middle: "All Posts",icon: Icons.arrow_back,),
                FutureBuilder(
                  future: provider.getAllComment(),
                  builder: (context, snapshot) =>Container(
                    height: 700,
                    child: ListView.separated(
                        itemBuilder: (context, index) => snapshot.hasData?
                        Column(
                          children: [
                            Row(children: [
                              CircleAvatar(backgroundImage:MemoryImage(base64Decode("${snapshot.data!.data!.actor!.photo.toString()}")) ,),
                              Text("${snapshot.data!.data!.actor!.name}",style: TextStyle(color: Colors.white,fontSize: 15),)
                            ],),
                            ListTile(
                              shape:OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 2)),
                              // isThreeLine: true,
                              onTap: (){},
                              tileColor: textformcolor,
                              title: Text("${snapshot.data?.data!.comments![index].content}",style: TextStyle(color: Colors.white,fontSize: 15),),
                            
                            ),
                          ],
                        )
                            :snapshot.hasError?Center(child: Text("Error",style: TextStyle(fontSize: 50,color: Colors.white),)):
                        Center(child: CircularProgressIndicator()),

                        separatorBuilder: (context, index) => Divider(thickness: 2,color: Colors.white,),
                        itemCount: snapshot.data?.data!.comments!.length ?? 0),
                  ),
                ),
              ],
            )
          ),
        );
      },
    );
  }
}
