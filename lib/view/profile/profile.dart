import 'dart:convert';
import 'package:findme/controller/HomeOriginController.dart';
import 'package:findme/view/login/login.dart';
import 'package:findme/view/profile/settings/EditProfile.dart';
import 'package:findme/view/profile/settings/changepassword.dart';
import 'package:findme/view/profile/settings/language.dart';
import 'package:findme/view/profile/settings/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const/const.dart';
import '../../controller/ProfileController.dart';
import '../widgets/custome_appbar.dart';
import '../widgets/custome_listTile.dart';
import 'others/Help Center.dart';
import 'others/Privacy Policy.dart';
import 'others/Terms & Conditions.dart';



class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
  builder: (context, provider, child) {
  return FutureBuilder(
    future: provider.profiledetailss(context),
    builder: (context, snapshot) =>snapshot.hasData?Scaffold(
      backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: 800,decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomRight),
            ),
            ),

            //content page
            Positioned(
              top: 150,
              width: 400,
              child: Container(
                height: 800,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomRight),

                ),
                // color: pinkcolor,
                child: Column(children: [
                  SizedBox(height: 50,),
                  //Text
                  Text("${provider.name!.toUpperCase()}",style: TextStyle(color: Colors.white,fontSize:15,fontWeight: FontWeight.w800 ),),SizedBox(height: 5,),

                  //container for number of applied job and review
                  Container(
                    height: 100,
                    child: ListView.builder(
                        itemCount: 1,
                      itemBuilder:(context, index) =>Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(15),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text("${provider.email}",style: TextStyle(color: Colors.white,fontSize:15,fontWeight: FontWeight.w400 ),),SizedBox(height: 5,),
                            Text("${provider.address}",style: TextStyle(color: Colors.white,fontSize:15,fontWeight: FontWeight.w400 ),),SizedBox(height: 5,),
                          ],)
                      ),
                    ),
                  ),

                  //about
                  Container(
                    height: 420,
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //      Text("About",style: TextStyle(fontSize: 15,color:Colors.white)),
                        //     TextButton(child: Text("Edit",style: TextStyle(color: Colors.white),),onPressed: (){
                        //       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile(),));
                        //     }),
                        //   ],),
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(bottom: 10),
                      //     padding: EdgeInsets.only(left: 5,right: 10),
                      //     child:about!=null?Text("${about}",style: TextStyle(color: Colors.white),):Text(style: TextStyle(color: Colors.white),
                      //         "For Example: I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.")
                      // ),

                      //general settongs
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding:EdgeInsets.only(left: 10) ,
                        height: 30,
                        color: Colors.black12,
                        child: Text("General",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white)),
                      ),

                      CustomeListTile(title: "Edit Profile",icon: Icons.person,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),

                      CustomeListTile(title: "Chang Password",icon: Icons.password,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),

                      CustomeListTile(title: "Langauge",icon: Icons.language,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LanguagePage(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),
                      CustomeListTile(title: "Notification",icon: Icons.notifications,ontap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationSettings(),));
                      },arrowicon: Icons.arrow_forward),Divider(thickness: 2,),


                      //other settings
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding:EdgeInsets.only(left: 10) ,
                        height: 30,
                        color: Colors.black12,
                        child: Text("Others",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white)),
                      ),
                      ListTile(title: Text("Help Center",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),trailing: IconButton(icon: Icon(Icons.arrow_forward,color: Colors.black),onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpCenter(),));
                      }),),Divider(thickness: 2,),
                      ListTile(title: Text("Terms & Conditions",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),trailing: IconButton(icon: Icon(Icons.arrow_forward,color: Colors.black),onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsAndConditions(),));
                      }),),Divider(thickness: 2,),
                      ListTile(title: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),trailing: IconButton(icon: Icon(Icons.arrow_forward,color: Colors.black),onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyPolicy(),));
                      }),),Divider(thickness: 2,),
                      ListTile(title: Text("Log out",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),trailing: IconButton(icon: Icon(Icons.arrow_forward,color: Colors.black),onPressed: (){
                       provider.logout(context);
                      }),),Divider(thickness: 2,),
                    ],),
                  ),
                ],),
              ),
            ),

            //profile Picture
            Positioned(
                          top: 110,
                          left: 158,
                          child:provider.photo==null?CircleAvatar(backgroundImage: AssetImage("images/admin.webp"),radius: 40,):
                          CircleAvatar(backgroundImage: MemoryImage(base64Decode("${provider.photo}")),radius: 40,)),

            //appbar
            Custome_appbar(image: "images/image.png",middle: "Profile",),
            ],),
      ):snapshot.hasError?Center(child: Text("Error",style: TextStyle(color: Colors.white,fontSize: 50),)):Center(child: CircularProgressIndicator()));
  },
);
  }
}
