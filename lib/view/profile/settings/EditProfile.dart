import 'package:findme/const/const.dart';
import 'package:findme/view/widgets/custome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/ProfileController.dart';
import '../../widgets/TextFormFieldjoo.dart';
import '../../widgets/custome_button.dart';




class EditProfile extends StatelessWidget {
   EditProfile({super.key});
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController phone=TextEditingController();

  GlobalKey<FormState> keyprofile=GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProfileController>(
        builder: (context, provider, child) {
        return Container(
          // decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomRight)),
          child: ListView(
              children: [
            //appbar
            Custome_appbar(image: "images/image.png",icon: Icons.arrow_back,middle: "Edit Profile",color: pinkcolor,),
            //picture
            SizedBox(height: 40,),
            Center(
              child: Stack(children: [
              CircleAvatar(backgroundImage: NetworkImage("${provider.urlimage}"),radius: 50,backgroundColor: Colors.pink,),
                Positioned(left: 15,top: 17,child: IconButton(onPressed: (){
                  provider.gettimage();
                }, icon: Icon(Icons.camera_alt,size: 55,color: Colors.black,)))
              ],),
            ),
            Center(child: TextButton(child:Text("Change Photo",style: TextStyle(color: Color(0xff3366FF),fontSize: 15)),onPressed: (){
              provider.gettimage();
            },)),SizedBox(height: 30,),
            //form

             //name
            CustomeTextformfield(name: "Name",controller: name,color:textformcolor,textcolor: Colors.white,),SizedBox(height: 30,),
            //email
            CustomeTextformfield(name: "Email",controller: email,color:textformcolor,textcolor: Colors.white),SizedBox(height: 30,),
            //address
            CustomeTextformfield(name: "Address",controller: address,color:textformcolor,textcolor: Colors.white),SizedBox(height: 30,),
            //No.Handphone
            CustomeTextformfield(name: "No.Handphone",controller: phone,color:textformcolor,textcolor: Colors.white),SizedBox(height: 30,),

             //button
                CustomeButtonn(ontap: (){
                  // keyprofile.currentState!.validate();
                  provider.updateprofile(name.text, email.text, phone.text, address.text, context);
                },name_button: "Save",),SizedBox(height: 10,)
          ]),
        );
        },
      ),
      ),
    );
  }
}
