import 'package:flutter/material.dart';
import '../../const/const.dart';
class SocialContainer extends StatelessWidget {
   SocialContainer({super.key,this.image});
   Image? image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kPrimaryColorFillTxtField,
          borderRadius: BorderRadius.circular(10)
      ),
      height: 50,
      width: 50,
      child: image,
    );
  }
}
