import 'package:findme/const/const.dart';
import 'package:flutter/material.dart';

class CustomeListTileSwitch extends StatefulWidget {
   CustomeListTileSwitch({super.key,this.title});
  String? title;

  @override
  State<CustomeListTileSwitch> createState() => _CustomeListTileSwitchState();
}

class _CustomeListTileSwitchState extends State<CustomeListTileSwitch> {
  bool switchh=false;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text("${widget.title}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
      trailing: Switch(
        activeTrackColor: pinkcolor,
        activeColor: Colors.black,
        value: switchh, onChanged: (value) {
        setState(() {
          switchh=value;
        });
      },),);
  }
}
