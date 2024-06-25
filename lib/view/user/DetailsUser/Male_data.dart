import 'package:findme/const/const.dart';
import 'package:findme/controller/UserController.dart';
import 'package:findme/view/origin/HomeOrigin/mainHome.dart';
import 'package:findme/view/user/DetailsUser/AddRelative.dart';
import 'package:findme/view/widgets/TextFormFieldjoo.dart';
import 'package:findme/view/widgets/custome_appbar.dart';
import 'package:findme/view/widgets/custome_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'RelativeData.dart';

class MaleData extends StatelessWidget {
   MaleData({super.key});

  TextEditingController userjob=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController notes=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController id=TextEditingController();
  TextEditingController matiralStatus=TextEditingController();
  DateTime date=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeUserController>(
  builder: (context, provider, child) {
  return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Custome_appbar(icon: Icons.arrow_back,middle: "Male Information",image: "images/image.png",),
          //skip text
          Container(alignment: Alignment.topRight,
            child: TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RelativeData(),));
            },child: Text("Skip",style: TextStyle(color: Colors.white),)),
          ),
          SizedBox(height: 10,),

          //Male Data
          CustomeTextformfield(controller: userjob,name: "User Job",icon: Icon(Icons.work_outline,color: Colors.white,),color: textformcolor,textcolor: Colors.white,),SizedBox(height: 25,),
          CustomeTextformfield(controller: matiralStatus,name: "MatiralStatus .. The first letter capital (Single /Ma...)",icon: Icon(Icons.person,color: Colors.white,),color: textformcolor,textcolor: Colors.white,),SizedBox(height: 25,),
          CustomeTextformfield(controller: address,name: "Address",icon: Icon(Icons.location_on_outlined,color: Colors.white,),color: textformcolor,textcolor: Colors.white,),SizedBox(height: 25,),
          CustomeTextformfield(controller: phone,name: "Phone",icon: Icon(Icons.phone,color: Colors.white,),color: textformcolor,textcolor: Colors.white,),SizedBox(height: 25,),
          CustomeTextformfield(controller: id,name: "ID",icon: Icon(Icons.text_fields,color: Colors.white,),color: textformcolor,textcolor: Colors.white,),SizedBox(height: 25,),

          //notes
          TextFormField(
            maxLines: 5,
            validator: (value) {
              if(value==null){
                return "field is null";
              }
            },
            style: TextStyle(color: Colors.white),
            controller: notes,
            decoration: InputDecoration(
                filled: true,
                fillColor: textformcolor,
                suffixIcon: Icon(Icons.notes),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: Colors.white60),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 1, color: Colors.white)),

                hintText: "Notes (Write the diseases you suffer from)",
                hintStyle: TextStyle(color: Colors.white,fontSize: 12),
          ),),SizedBox(height: 30,),

          //celender
          CustomeButtonn(ontap: ()async{
            provider.choosedate(context);
          },name_button: "Choose your date",),
          
          Text("${provider.date}",style: TextStyle(color: Colors.white),),

          //upload picture
          CustomeButtonn(ontap: (){
            provider.getimage();
          },name_button: "Upload Picture",),SizedBox(height: 150,),

          //button
         provider.urlimageg!=null?CustomeButtonn(ontap: (){
           provider.addDetails(id.text, matiralStatus.text,userjob.text,phone.text, notes.text,address.text, context);
         },name_button: "Add",):Center(
           child: Text("You Must Upload Image to move to next Step",
             style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15) ,),
         ),SizedBox(height: 15,),

         provider.urlimageg!=null?CustomeButtonn(ontap: (){
           provider.updateDetails(id.text, matiralStatus.text,userjob.text,phone.text, notes.text,address.text, context);
         },name_button: "Update",):Center(
           child: Text("You Must Upload Image to move to Update\n (This is as Profile Picture)",
             style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10) ,),
         )
        ],),
      ),
    );
  },
);
  }
}
