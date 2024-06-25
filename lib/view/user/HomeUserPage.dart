import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:findme/const/const.dart';
import 'package:findme/controller/HomeOriginController.dart';
import 'package:findme/view/origin/HomeOrigin/community.dart';
import 'package:findme/view/user/ApproveUserRequest.dart';
import 'package:findme/view/widgets/CustomeMaterialButton.dart';
import 'package:findme/view/widgets/custome_appbar.dart';
import 'package:findme/view/widgets/custome_card_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../origin/HomeOrigin/Allresults.dart';
import 'DisapproveRequestPage.dart';
import 'Search_by_photo.dart';
import '../origin/HomeOrigin/postsdata.dart';

class Homeuserpage extends StatelessWidget {
   Homeuserpage({super.key});
   String? idpostt;

   List<posts> post=[
     posts(name: "Youssef elsadany",location: "cairo",phone: "01156378215",image:"images/facebook.png"),
     posts(name: "Youssef ",location: "cairo",phone: "01156378215",image:"images/google.png"),
     posts(name: "Youssef elsadany",location: "cairo",phone: "01156378215",image:"images/google.png"),
   ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<HomeOriginrController>(context).getAllPosts(),
      builder: (context, snapshot) =>snapshot.hasData?Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            //appbar
            SizedBox(height: 15,),
            Custome_appbar(image: "images/image.png",middle: "",),

            //some of posts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Posts",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Community(),));
              },child: Text("View All Posts",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),),)

            ],),
          CarouselSlider.builder(
              itemCount:2,
              itemBuilder:(context, index, realIndex) => Card(
                elevation: 20,
                shadowColor: pinkcolor,
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
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(image: MemoryImage(base64Decode("${snapshot.data!.data![index].photo}")),fit: BoxFit.fill)
                          ),
                        ),
                      ),SizedBox(height: 15,),
                      //content
                      Text("${snapshot.data!.data![index].address}",style: TextStyle(color: Colors.white,fontSize: 8),),SizedBox(height: 5,),
                      Text("${snapshot.data!.data![index].descripation}",style: TextStyle(color: Colors.white,fontSize: 15),),SizedBox(height: 10,),

                    ],),
                ),
              ),
              options: CarouselOptions(
                aspectRatio:1.50,
                // animateToClosest: true,
                // enlargeCenterPage: true,
                autoPlayCurve: Curves.decelerate,
                autoPlay: true,
                viewportFraction: .70,
                enlargeFactor: 80,
                autoPlayAnimationDuration: Duration(seconds: 3),
                autoPlayInterval: Duration(seconds: 3),
              )),

            //search
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomeCardHome(ontap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllResults(),));},text: "All Results",icon: Icons.file_present,bcolor: pinkcolor,),
                CustomeCardHome(ontap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPhot(),));},text: "search By Image",icon: Icons.image,bcolor: pinkcolor,),
              ],),SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomeCardHome(ontap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApproveRequestPage(),));},text: "Approve Requests",icon: Icons.verified_outlined,bcolor: pinkcolor,),
                CustomeCardHome(ontap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisapproveRequestPage(),));},text: "Disapprove Requests",icon: Icons.remove_circle,bcolor: pinkcolor,),
              ],),
          ],),
        ),
      ):snapshot.hasError?Center(child: Text("Error",style: TextStyle(color: Colors.white,fontSize: 40),)):
      Center(child: CircularProgressIndicator()),
    );
  }
}
