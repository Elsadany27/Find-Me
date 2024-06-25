import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:findme/const/const.dart';
import 'package:findme/controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/HomeOriginController.dart';
import '../widgets/custome_appbar.dart';
import '../widgets/custome_button.dart';



class SearchPhot extends StatelessWidget {
   SearchPhot({super.key});
  SizedBox size=SizedBox(height: 20,);
  TextEditingController describtion=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer<HomeOriginrController>(
        builder: (context, provider, child) {
        return Column(children: [
            Custome_appbar(image: "images/image.png", icon: Icons.arrow_back,middle: "Search By Photo",),
            size,
            //describtion
      TextFormField(
        maxLines: 5,
        validator: (value) {
          if(value==null){
            return "field is null";
          }
        },
        style: TextStyle(color: Colors.white),
        controller: describtion,
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

          hintText: "Write Describtion ",
          hintStyle: TextStyle(color: Colors.white,fontSize: 12),
        ),),SizedBox(height: 30,),

      //button
            CustomeButtonn(ontap: (){
              Provider.of<HomeUserController>(context,listen: false).getimageiden();
              },
                name_button: "Search By Image",color: Colors.cyan),
            size,
      provider==null?Container():
      CircleAvatar(backgroundImage: NetworkImage("${Provider.of<HomeUserController>(context).urlimagegiden}"),radius: 45,),SizedBox(height: 100,),

          //button request
          Provider.of<HomeUserController>(context).urlimagegiden==null?Container():
          CustomeButtonn(ontap: (){
            Provider.of<HomeUserController>(context,listen: false).sendRequestIdentity(describtion.text, context);
          },name_button: "Send Request",)



          ],);
        },
      ),
        ),
      ),
    );
  }
}
