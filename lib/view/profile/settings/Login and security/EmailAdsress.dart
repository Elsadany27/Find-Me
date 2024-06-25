import 'package:flutter/material.dart';
import '../../../widgets/custome_appbar.dart';
import '../../../widgets/custome_button.dart';


class EmailAddressSetting extends StatelessWidget {
   EmailAddressSetting({super.key,this.email});
  dynamic? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //appbar
          Custome_appbar(image: "images/image.png",icon: Icons.arrow_back,middle: "Email Address",),

        //content
        Text("Main e-mail address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),SizedBox(height: 15,),
        TextFormField(
          decoration: InputDecoration(
            enabled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2,color: Colors.black)
          ),
            labelText:"$email"
        ),),SizedBox(height: 550,),
          
          CustomeButtonn(ontap: (){
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginAndSecurity()));
          },name_button: "Save",)
      ],),
    )),);
  }
}
