import 'package:flutter/cupertino.dart';

class LoginRegisterController extends ChangeNotifier{
  bool state=true;

  //show password
  ChangeState(){
    if(state==true){
      state=false;
    }
    else{
      state=true;
    }notifyListeners();
  }

}