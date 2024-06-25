import 'package:findme/controller/HomeOriginController.dart';
import 'package:findme/view/login/login.dart';
import 'package:findme/view/widgets/custome_button.dart';
import 'package:findme/view/widgets/social_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/const.dart';
import '../widgets/TextFormFieldPass.dart';
import '../widgets/TextFormFieldjoo.dart';

class CreateAccountOrigin extends StatelessWidget {
  CreateAccountOrigin({super.key});
  TextEditingController OriginName=TextEditingController();
  TextEditingController OriginAddress=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeOriginrController>(
  builder: (context, provider, child) {
  return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          //arrow
          IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,alignment: Alignment.topLeft,),
          //logo & text
          Image.asset("images/image.png",width: 100,height:120,color:pinkcolor,),
          Center(child: Text("Create Organization Acoount" ,style: TextStyle(color: Colors.white,fontSize: 25),)),

          //form
          SizedBox(height: 50,),
          //origin name
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: OriginName,
            color: Color(0xff23232F),
            icon: Icon(Icons.trip_origin,color: Colors.white,),
            name: "Origin Name",
          ),SizedBox(height: 30,),

          //Origin Address
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: OriginAddress,
            color: Color(0xff23232F),
            icon: Icon(Icons.location_on_outlined,color: Colors.white,),
            name: "Origin Address",
          ),SizedBox(height: 30,),

          //email
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: email,
            color: Color(0xff23232F),
            icon: Icon(Icons.email,color: Colors.white,),
            name: "Email",
          ),SizedBox(height: 30,),

          //phone
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: phone,
            color: Color(0xff23232F),
            icon: Icon(Icons.phone,color: Colors.white,),
            name: "Phone",
          ),SizedBox(height: 30,),
          
          //upload image request
          CustomeButtonn(ontap: (){
            provider.getproofimage();
          },name_button: "Upload Proof Image",),


          //button
          SizedBox(height: 40,),
         provider.urlproofimage!=null?CustomeButtonn(ontap: (){
                provider.sendrequest(
                    OriginName.text,
                    email.text,
                    phone.text,
                    OriginAddress.text,context);
          },name_button: "Register",):Center(
            child: Text("Must Upload proof image to ccontinue",
             style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
          ),

          SizedBox(height: 50,),

          //login
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("If you have Verification Account ?",style: TextStyle(color: Colors.white)),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child:Text("Login",style: TextStyle(color:pinkcolor)),)
            ],)


        ],),
      ),),
    );
  },
);
  }
}