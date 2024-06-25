import 'package:findme/const/const.dart';
import 'package:findme/controller/HomeOriginController.dart';
import 'package:findme/view/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/TextFormFieldjoo.dart';

class CreatePosts extends StatelessWidget {
   CreatePosts({super.key});
  TextEditingController location=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController note=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeOriginrController>(
  builder: (context, provider, child) {
  return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          //appbar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(width: 70,),
            Text("Create Post",style: TextStyle(color: pinkcolor,fontSize: 18),),
            Image.asset("images/image.png",width: 120,color: pinkcolor,)
          ],),SizedBox(height: 50,),

          //form
          //location
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: location,
            color: Color(0xff23232F),
            icon: Icon(Icons.location_on_outlined,color: Colors.white,),
            name: "location",
          ),SizedBox(height: 40,),

          //phone
          CustomeTextformfield(
            textcolor:Colors.white,
            controller: phone,
            color: Color(0xff23232F),
            icon: Icon(Icons.phone,color: Colors.white,),
            name: "Phone",
          ),SizedBox(height: 40,),

          //notes
          TextFormField(
            maxLines: 5,
            validator: (value) {
              if(value==null){
                return "field is null";
              }
            },
            style: TextStyle(color: Colors.white),
            controller:note ,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff23232F),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: Colors.white60),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 1, color: Colors.white)),

                hintStyle: TextStyle(color: Colors.white,fontSize: 12),
                hintText: "Describtion",
               ),
          ),SizedBox(height: 40,),


          //upload image
          CustomeButtonn(ontap: (){
            provider.getPostImage();
          },name_button: "Upload image",),SizedBox(height: 80,),

          //testing
          // Provider.of<HomeOriginrController>(context,listen: false).urlimageg!=null?Image.network(""
          //     "${Provider.of<HomeOriginrController>(context,listen: false).urlimageg}"):
          // Provider.of<HomeOriginrController>(context,listen: false).urlimageg==null?Text("Picture is loading",):
          //     CircularProgressIndicator()

          provider.urlPostImage==null?Container():
              CustomeButtonn(ontap: (){
                provider.createPost(
                    note.text,
                    location.text,
                    phone.text,
                     context);
              },name_button: "Post",),
          
          // Text("${provider.iduser}",style: TextStyle(color: Colors.white,fontSize: 20),),
          // Text("${provider.token}",style: TextStyle(color: Colors.white,fontSize: 20),)

        ],),
      ),
    );
  },
);
  }
}