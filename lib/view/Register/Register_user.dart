import 'package:findme/controller/UserController.dart';
import 'package:findme/view/widgets/custome_button.dart';
import 'package:findme/view/widgets/social_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const/const.dart';
import '../login/login.dart';
import '../widgets/TextFormFieldPass.dart';
import '../widgets/TextFormFieldjoo.dart';

class CreateAccountUser extends StatelessWidget {
   CreateAccountUser({super.key});
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController gender=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeUserController>(
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
          Center(child: Text("Create Your Account",style: TextStyle(color: Colors.white,fontSize: 25),)),

          //form
          SizedBox(height: 50,),
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: username,
            color: Color(0xff23232F),
            icon: Icon(Icons.person,color: Colors.white,),
            name: "Username",
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

          //gender
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: gender,
            color: Color(0xff23232F),
            icon: Icon(Icons.boy,color: Colors.white,),
            name: "Gender ... EX: Male or Female",
          ),SizedBox(height: 30,),
          //password
          CustomeTextPass(
            color: Color(0xff23232F),
            textcolor: Colors.white,
            name: "Password",
            icon: Icon(Icons.visibility_sharp,color:Colors.white,),
            controller: password,
            coloricon: Colors.white,
          ),

          //button
          SizedBox(height: 40,),
          CustomeButtonn(ontap: (){
            provider.senddata(username.text, email.text, phone.text, gender.text, password.text, context);

          },name_button: "Register",),

          //
          // SizedBox(height: 60,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //   Text("---------------------------- ",style: TextStyle(color: Colors.white),),
          //   Text("Or Register With",style: TextStyle(color: Colors.white)),
          //   Text(" ---------------------------- ",style: TextStyle(color: Colors.white)),
          // ],),SizedBox(height: 30,),

          //social register
         // Row(
         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         //   children: [
         //   SocialContainer(
         //     image:Image.asset("images/google.png",),
         //   ),
         //   SocialContainer(
         //     image:Image.asset("images/facebook.png"),
         //   ),
         //     SocialContainer(
         //     image:Image.asset("images/angh.png",color: Colors.white,),
         //   ),
         // ],),SizedBox(height: 10,),

          //login
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("If you have an account ?",style: TextStyle(color: Colors.white)),
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