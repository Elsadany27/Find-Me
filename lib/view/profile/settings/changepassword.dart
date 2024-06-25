import 'package:findme/controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../widgets/TextFormFieldPass.dart';
import '../../widgets/TextFormFieldjoo.dart';
import '../../widgets/custome_button.dart';




class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  TextEditingController oldpassword=TextEditingController();
  TextEditingController newpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              //arrow
              // IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,alignment: Alignment.topLeft,),
              //logo & text
              Image.asset("images/image.png",width: 100,height:120,color:pinkcolor,),
              Center(child: Text(" Change Password" ,style: TextStyle(color: Colors.white,fontSize: 25),)),

              //form
              SizedBox(height: 50,),
              // CustomeTextformfield(
              //   textcolor:Colors.white,
              //   controller: username,
              //   color: Color(0xff23232F),
              //   icon: Icon(Icons.person,color: Colors.white,),
              //   name: "Username",
              // ),SizedBox(height: 40,),

              //old password
              CustomeTextPass(
                color: Color(0xff23232F),
                textcolor: Colors.white,
                name: "Old Password",
                icon: Icon(Icons.visibility_sharp,color:Colors.white,),
                controller: oldpassword,
                coloricon: Colors.white,
              ),SizedBox(height: 40,),

              //password
              CustomeTextPass(
                color: Color(0xff23232F),
                textcolor: Colors.white,
                name: "New Password",
                icon: Icon(Icons.visibility_sharp,color:Colors.white,),
                controller: newpassword,
                coloricon: Colors.white,
              ),

              //button
              SizedBox(height: 40,),
              CustomeButtonn(ontap: (){
                provider.changepass(oldpassword.text, newpassword.text, context);
              },name_button: "Save",),


            ],),
          ),
        );
      },
    );
  }
}
