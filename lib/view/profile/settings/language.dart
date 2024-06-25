import 'package:findme/const/const.dart';
import 'package:flutter/material.dart';
import '../../widgets/custome_appbar.dart';
import 'languagedata.dart';

class LanguagePage extends StatefulWidget {
   LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  List<LanguageData> language=[
    LanguageData(image: "images/England-fotor-20240620184141.png",language: "English"),
    LanguageData(image: "images/Indonesia-fotor-20240620184312.png",language: "Indonesia"),
    LanguageData(image: "images/Saudi Arabia-fotor-20240620184420.png",language: "Arabic"),
    LanguageData(image: "images/China-fotor-2024062018456.png",language: "Chinese"),
    LanguageData(image: "images/Netherlands-fotor-20240620184546.png",language: "Dutch"),
    LanguageData(image: "images/France-fotor-20240620184710.png",language: "French"),
    LanguageData(image: "images/Germany-fotor-20240620184744.png",language: "German"),
    LanguageData(image: "images/Japan-fotor-20240620184830.png",language: "Japanese"),
    LanguageData(image: "images/South Korea-fotor-20240620184916.png",language: "Korean"),
    LanguageData(image: "images/Portugal-fotor-20240620184953.png",language: "Portuguese"),
  ];

  String? country;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,pinkcolor],begin: Alignment.topLeft,end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Column(
          children: [
            SizedBox(height: 15,),
            //appbar
            Custome_appbar(image: "images/image.png",icon: Icons.arrow_back,middle: "Language",),

            //content
            Container(
              height: 720,
              child: ListView.separated(itemBuilder:(context, index) =>ListTile(
                title: Text("${language[index].language}",style: TextStyle(color: Colors.white),),
                leading: Image.asset("${language[index].image}"),
                trailing: Radio(
                  activeColor: Colors.white,
                  value: "${language[index].language}",groupValue: country,onChanged: (value) {
                  setState(() {
                    country=value;
                  });
                },),
              ),
                  separatorBuilder: (context, index) => Divider(thickness: 2,),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
