import 'package:findme/controller/UserController.dart';
import 'package:findme/view/Onboarding/onboarding.dart';
import 'package:findme/view/Register/Register_user.dart';
import 'package:findme/view/Register/RegisterOrigin.dart';
import 'package:findme/view/login/login.dart';
import 'package:findme/view/origin/HomeOrigin/mainHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/HomeOriginController.dart';
import 'controller/LoginRegisterController.dart';
import 'controller/ProfileController.dart';
import 'controller/RecognizationResultsCntroller.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginRegisterController(),),
        ChangeNotifierProvider(create: (context) => HomeOriginrController(),),
        ChangeNotifierProvider(create: (context) => HomeUserController(),),
        ChangeNotifierProvider(create: (context) => ProfileController(),),
        ChangeNotifierProvider(create: (context) => Recognizationresultscntroller(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "oregister":(context) => CreateAccountOrigin(),
          "uregister":(context) => CreateAccountUser(),
          "login":(context) => LoginPage(),
          "originhome":(context) => MainHome(),
        },
        home: Onboarding(),
      ),
    );
  }
}
