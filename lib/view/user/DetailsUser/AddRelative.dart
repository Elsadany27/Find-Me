import 'package:findme/const/const.dart';
import 'package:findme/view/user/DetailsUser/RelativeData.dart';
import 'package:findme/view/user/HomeUserPage.dart';
import 'package:findme/view/widgets/custome_appbar.dart';
import 'package:findme/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';

class AddrRelativee extends StatefulWidget {
  const AddrRelativee({super.key});

  @override
  State<AddrRelativee> createState() => _AddrRelativeeState();
}

class _AddrRelativeeState extends State<AddrRelativee> {
  bool switchh=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
        //appbar
        Custome_appbar(icon: Icons.arrow_back,image: "images/image.png",middle: "",),
        // //form
        // Text("Do You Want To add Relative",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
        // Text("(It's Important to safe them)",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),

        //switch
        SizedBox(height: 50,),
      ListTile(title:Text("Do You Want To add Relative",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
        subtitle:Text("(It's Important to safe them)",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),
        trailing: Switch(
            activeTrackColor: pinkcolor,
            activeColor: Colors.white,
            value: switchh, onChanged: (value) {
            setState(() {
            switchh=value;
            });
    },),),

        //button
          SizedBox(height: 50,),
        switchh==false?CustomeButtonn(ontap: (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Homeuserpage(),), (route) => false,);
        },name_button: "Done",):
        CustomeButtonn(ontap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RelativeData(),));
        },name_button: "Add Relative",)
      ],),
    );
  }
}
