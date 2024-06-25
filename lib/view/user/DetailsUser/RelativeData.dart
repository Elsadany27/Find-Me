import 'package:findme/view/origin/HomeOrigin/mainHome.dart';
import 'package:flutter/material.dart';
import 'package:findme/view/widgets/TextFormFieldjoo.dart'; // Update with your actual import path
import 'package:findme/view/widgets/custome_appbar.dart'; // Update with your actual import path
import 'package:findme/view/widgets/custome_button.dart'; // Update with your actual import path
import 'package:provider/provider.dart';
import '../../../const/const.dart';
import '../../../controller/UserController.dart';
import '../HomeUserPage.dart';
import '../mainhomeuser.dart'; // Ensure you have Provider package imported

class RelativeData extends StatelessWidget {
  RelativeData({Key? key});

  // Controllers for text fields
  final TextEditingController name1Controller = TextEditingController();
  final TextEditingController phone1Controller = TextEditingController();
  final TextEditingController relativePersonNumber1Controller = TextEditingController();
  final TextEditingController gender1Controller = TextEditingController();
  final TextEditingController relationship1Controller = TextEditingController();

  final TextEditingController name2Controller = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();
  final TextEditingController relativePersonNumber2Controller = TextEditingController();
  final TextEditingController gender2Controller = TextEditingController();
  final TextEditingController relationship2Controller = TextEditingController();

  final TextEditingController name3Controller = TextEditingController();
  final TextEditingController phone3Controller = TextEditingController();
  final TextEditingController relativePersonNumber3Controller = TextEditingController();
  final TextEditingController gender3Controller = TextEditingController();
  final TextEditingController relationship3Controller = TextEditingController();

  final TextEditingController name4Controller = TextEditingController();
  final TextEditingController phone4Controller = TextEditingController();
  final TextEditingController relativePersonNumber4Controller = TextEditingController();
  final TextEditingController gender4Controller = TextEditingController();
  final TextEditingController relationship4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeUserController>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) => MainHomeUser(),));
                },child: Text("Skip",style: TextStyle(color: Colors.white),)),
                // Appbar
                Custome_appbar(icon: Icons.arrow_back, middle: "Relative Information", image: "images/image.png",),
                SizedBox(height: 30),

                // Person 1
                Text("Person 1 :", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                // TextFields for Person 1
                CustomeTextformfield(controller: name1Controller, name: "Name", icon: Icon(Icons.location_on_outlined, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: phone1Controller, name: "Phone", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relativePersonNumber1Controller, name: "Relative person number", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: gender1Controller, name: "Gender", icon: Icon(Icons.person, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relationship1Controller, name: "Relationship", icon: Icon(Icons.text_fields, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),

                SizedBox(height: 30),

                // Person 2
                Text("Person 2 :", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                // TextFields for Person 2
                CustomeTextformfield(controller: name2Controller, name: "Name", icon: Icon(Icons.location_on_outlined, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: phone2Controller, name: "Phone", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relativePersonNumber2Controller, name: "Relative person number", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: gender2Controller, name: "Gender", icon: Icon(Icons.person, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relationship2Controller, name: "Relationship", icon: Icon(Icons.text_fields, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),

                SizedBox(height: 30),

                // Person 3
                Text("Person 3 :", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                // TextFields for Person 3
                CustomeTextformfield(controller: name3Controller, name: "Name", icon: Icon(Icons.location_on_outlined, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: phone3Controller, name: "Phone", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relativePersonNumber3Controller, name: "Relative person number", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: gender3Controller, name: "Gender", icon: Icon(Icons.person, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relationship3Controller, name: "Relationship", icon: Icon(Icons.text_fields, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),

                SizedBox(height: 30),

                // Person 4
                Text("Person 4 :", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                // TextFields for Person 4
                CustomeTextformfield(controller: name4Controller, name: "Name", icon: Icon(Icons.location_on_outlined, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: phone4Controller, name: "Phone", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relativePersonNumber4Controller, name: "Relative person number", icon: Icon(Icons.phone, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: gender4Controller, name: "Gender", icon: Icon(Icons.person, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),
                CustomeTextformfield(controller: relationship4Controller, name: "Relationship", icon: Icon(Icons.text_fields, color: Colors.white,), color: textformcolor, textcolor: Colors.white),
                SizedBox(height: 25),

                // Add Button
                CustomeButtonn(ontap: (){
        // provider.postRelativesData([
        // {
        // "name": name1Controller.text,
        // "phoneNumber1": phone1Controller.text,
        // "gendre": gender1Controller.text,
        // "relationship": relationship1Controller.text,
        // "phoneNumber2": relativePersonNumber1Controller.text,
        // },
        // {
        // "name": name2Controller.text,
        // "phoneNumber1": phone2Controller.text,
        // "gendre": gender2Controller.text,
        // "relationship": relationship2Controller.text,
        // "phoneNumber2": relativePersonNumber2Controller.text,
        // },
        // {
        // "name": name3Controller.text,
        // "phoneNumber1": phone3Controller.text,
        // "gendre": gender3Controller.text,
        // "relationship": relationship3Controller.text,
        // "phoneNumber2": relativePersonNumber3Controller.text,
        // },
        // {
        // "name": name4Controller.text,
        // "phoneNumber1": phone4Controller.text,
        // "gendre": gender4Controller.text,
        // "relationship": relationship4Controller.text,
        // "phoneNumber2": relativePersonNumber4Controller.text,
        // },
        // ], context);
        },
                  name_button: "Add",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
