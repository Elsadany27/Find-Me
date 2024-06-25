import 'package:flutter/material.dart';

import '../widgets/custome_appbar.dart';
import '../widgets/custome_button.dart';

class HomeRegister extends StatelessWidget {
   HomeRegister({super.key});
  SizedBox size=SizedBox(height: 20,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/skill.png"),
                    fit: BoxFit.fill)),
            alignment: Alignment.centerLeft,
            height: 580,
          ),

          //register
          Container(
            margin: const EdgeInsets.only(top: 550),
            width: double.infinity,
            height: 700,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Register" ,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                size,size,size,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomeButtonn(ontap: (){
                      Navigator.of(context).pushNamed("uregister");
                    },name_button: "Register As user",color:Color(0XFF2532A7) )),
                size,
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomeButtonn(ontap: (){
                      Navigator.of(context).pushNamed("oregister");
                    },name_button: "Register As Origin",color: Color(0XFF2532A7),))
              ],),
            )
          )
        ],
      ),
    );
  }
}
