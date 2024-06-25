import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/HomeOriginController.dart';
import '../../controller/UserController.dart';
import '../widgets/Custome_navigation_bar.dart';


class MainHomeUser extends StatelessWidget {
  const MainHomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeUserController>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          bottomNavigationBar: BottomAppBar(height: 70,
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomeColumn(ontap:(){provider.Moving(0);},icon:Icons.home,Textt: "Home"),
                    CustomeColumn(ontap:(){provider.Moving(1);},icon:Icons.create,Textt: "Create Post"),
                    CustomeColumn(ontap:(){provider.Moving(2);},icon:Icons.post_add,Textt: "Posts"),
                    CustomeColumn(ontap:(){provider.Moving(3);},icon:Icons.person_2,Textt: "Profile"),
                  ]),
            ),
          ),
          body:provider.pages.elementAt(provider.currentpage) ,
        );
      },
    );
  }
}
