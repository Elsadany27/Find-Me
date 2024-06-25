import 'package:findme/const/const.dart';
import 'package:findme/controller/UserController.dart';
import 'package:findme/view/user/DetailsUser/AddRelative.dart';
import 'package:findme/view/widgets/TextFormFieldjoo.dart';
import 'package:findme/view/widgets/custome_appbar.dart';
import 'package:findme/view/widgets/custome_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FemaleData extends StatelessWidget {
  FemaleData({super.key});

  TextEditingController userjob=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController notes=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController id=TextEditingController();
  TextEditingController MatiralStatus=TextEditingController();
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
              SizedBox(height: 30,),

              //Male Data
              CustomeTextformfield(controller: userjob,name: "User Job",icon: Icon(Icons.work_outline,color: Colors.white,),color: textformcolor,textcolor: Colors.white,),SizedBox(height: 25,),
              CustomeTextformfield(controller: MatiralStatus,name: "MatiralStatus .. The first letter capital (Single /Ma...)",icon: Icon(Icons.person,color: Colors.white,),color: textformcolor,textcolor: Colors.white,),SizedBox(height: 25,),
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
                provider.addDetails(id.text, MatiralStatus.text,userjob.text,phone.text, notes.text,address.text, context);
              },name_button: "Next",):Center(
                child: Text("You Must Upload Image to move to next Step\n (This is as Profile Picture)",
                  style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15) ,),
              )
            ],),
          ),
        );
      },
    );
  }
}
