import 'package:flutter/material.dart';

import '../home_for_register/homeregister.dart';
import '../widgets/custome_button.dart';
import 'data.dart';


class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  SizedBox size=SizedBox(height: 20,);

  int? currentpage = 0;

  PageController pageController = PageController();

  //List
  List<DataOnboarding> data=[
    DataOnboarding(image: "images/on1.jpg",h1:"Find Me",content: "is a facial recognition app which detect to  people using computer vision"),
    DataOnboarding(image: "images/oon3.jpg",content: "You can upload a photo from your gallary or use camera to take a picture",h1: "Take a Photo"),
    DataOnboarding(image: "images/img.png",content: "You can get your data by extractio some features from your face  ",h1: "Get Data"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image:AssetImage("images/image.png") ,width: 100,height: 80,),
                  InkWell(onTap:() =>Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeRegister(),),(route) => false,) ,
                      child: Text("Skip",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white),)),
                ],
              ),
              size,size,
              size,size,

              //pageview

              Container(width:double.infinity,height: 450,child: PageView.builder(
                controller: PageController(),
                onPageChanged: (value) {
                  setState(() {
                    currentpage=value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) =>Column(children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("${data[index].image}"),fit:BoxFit.fill)
                    ),
                  ),
                  size,
                  Container(alignment:Alignment.centerLeft,child: Text("${data[index].h1}",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                  Text("${data[index].content}",style: TextStyle(color: Colors.white),)
                ],) ,),),
              size,
              //moving points
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(3, (index) => AnimatedContainer(duration: Duration(milliseconds: 500),
                    width: currentpage==index?15:10,
                    height: 10,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color:currentpage==index?Color(0xff9A0CFE):Colors.white),
                  ),)
                ],),
              SizedBox(height: 80,),
              currentpage==2?
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomeButtonn(
                  color: Color(0xff9A0CFE),
                  ontap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeRegister(),));
                  },name_button: "Get Started",),
              ):Container()
            ],
          ),
        ),
      ),
    );
  }
}
