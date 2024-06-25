import 'package:findme/const/const.dart';
import 'package:flutter/material.dart';
import '../../user/ApproveUserRequest.dart';
import '../../widgets/custome_card_home.dart';
import 'Allresults.dart';
import '../../user/Search_by_photo.dart';

class OriginHome extends StatelessWidget {
  const OriginHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        //image
        Container(
          height: 300,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            // fit: BoxFit.fill
          )),
        ),
        
        //logo
        Image.asset("images/image.png",color: pinkcolor,height: 120,),

        //search
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeCardHome(ontap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApproveRequestPage(),));},text: "Approved Request ",icon: Icons.verified_outlined,bcolor: pinkcolor,),
            CustomeCardHome(ontap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPhot(),));},text: "search By Image",icon: Icons.image,bcolor: pinkcolor,),
        ],),


        //Text("${Provider.of<HomeOriginrController>(context).iduser}",style: TextStyle(color: Colors.white,fontSize: 25),)
        //  Text("${Provider.of<ProfileController>(context).iduserr}",style: TextStyle(color: Colors.white,fontSize: 25),)


      ],),
    );
  }
}

