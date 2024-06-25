import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:findme/controller/HomeOriginController.dart';
import 'package:findme/model/ProfileDetails.dart';
import 'package:findme/view/origin/HomeOrigin/mainHome.dart';
import 'package:findme/view/user/mainhomeuser.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../view/login/login.dart';
import '../view/profile/profile.dart';


class ProfileController extends ChangeNotifier{

  //images
  String? urlimage;
  File? file;
  gettimage()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    file=File(image!.path);

    var imagename=basename(image!.path);

    var refimage=FirebaseStorage.instance.ref("profile images/$imagename");
    await refimage.putFile(file!);
    urlimage=await refimage.getDownloadURL();
    notifyListeners();

    // setstate(){} important to show image
  }

  //get profile details'

  String? profiledetailsurl;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? photo;
  Dio dio = Dio();


  Future<ProfileDetailsModel> profiledetailss(context) async {
    profiledetailsurl = 'http://findme.runasp.net/api/Auth/Profile/${Provider.of<HomeOriginrController>(context).iduser}';

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer ${Provider.of<HomeOriginrController>(context).token}';

    Response response = await dio.get(profiledetailsurl!);

    print("\nBody ${response.data} status ${response.statusCode}");

    if (response.statusCode == 200) {
      name = response.data['data']['name'];
      email = response.data['data']['email'];
      address = response.data['data']['address'];
      phone = response.data['data']['phoneNumber'];
      photo = response.data['data']['photo'].toString();
    }

    return ProfileDetailsModel.fromJson(response.data['data']);
  }
  // String? iduserr;
  // String? profiledetailsurl;
  // String? name;
  // Dio dio = Dio();
  //
  // Future<ProfileDetailsModel> profiledetailss(context) async {
  //   String iduser="${Provider.of<HomeOriginrController>(context).iduser}";
  //   iduserr=iduser;
  //   profiledetailsurl = 'http://findme.runasp.net/api/Auth/Profile/${iduser}';
  //
  //   dio.options.headers['Content-Type'] = 'application/json';
  //   dio.options.headers['Authorization'] = 'Bearer ${Provider.of<HomeOriginrController>(context).token}';
  //
  //   Response response = await dio.get(profiledetailsurl!);
  //
  //   print("\nBody ${response.data} status ${response.statusCode}");
  //
  //   if (response.statusCode == 200) {
  //     name = response.data['data']['name'];
  //     String email = response.data['data']['email'];
  //     String phoneNumber = response.data['data']['phoneNumber'];
  //     String userName = response.data['data']['userName'];
  //     String gender = response.data['data']['gender'];
  //     String address = response.data['data']['address'];
  //
  //     print('Name: $name');
  //     print('Email: $email');
  //     print('Phone Number: $phoneNumber');
  //     print('User Name: $userName');
  //     print('Gender: $gender');
  //     print('Address: $address');
  //   }
  //
  //   return ProfileDetailsModel.fromJson(response.data);
  // }

//edit request /////////////////////////////////////////////////////////////////////////////

  String? message;
  TextEditingController about=TextEditingController();

  Future<String> updateprofile(String name, String email, String phone, String address, context) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${Provider.of<HomeOriginrController>(context,listen: false).token}";

    String urlpost = "http://findme.runasp.net/api/Auth/Profile";

    // Encode the file to a MultipartFile
    MultipartFile? fileprofile;
    if (file!= null) {
      fileprofile = await MultipartFile.fromFile(file!.path);
    }

    FormData data = FormData.fromMap({
      "UserId":Provider.of<HomeOriginrController>(context,listen: false).iduser,
      "profileDto.Name": name,
      "profileDto.Email": email,
      "profileDto.PhoneNumber": phone,
      "profileDto.Address": address,
      "profileDto.Photo": fileprofile,
    });

    try {
      Response response = await dio.put(urlpost, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        message = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message")));
       Provider.of<HomeOriginrController>(context).role=='User'?
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHomeUser(),), (route) => false):
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHome(),),(route) => false,);
        return message.toString();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is an error in the request")));
        return null!;
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred")));
      return null!;
    }
  }

  //change password
  String? messagepass;
  Future<String> changepass(String oldpassword,String newpassword,context)async{
    Dio dio =Dio();
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<HomeOriginrController>(context,listen: false).token}";

    String urlpost="http://findme.runasp.net/api/Auth/ChangePassword";

    final data={
      "userId":"${Provider.of<HomeOriginrController>(context,listen: false).iduser}",
      "oldPassword":oldpassword,
      "newPassword":newpassword,

    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      final body=response.data;
      messagepass=response.data['message'];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagepass"),
        duration: Duration(seconds: 3),
        elevation: 25,));
      notifyListeners();
      return messagepass.toString();
    }
    else {
      return null!;
    }
  }

  //logout
  String? messagelogout;
  Future<String> logout(context)async{
    Dio dio =Dio();
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<HomeOriginrController>(context,listen: false).token}";

    String urlpost="http://findme.runasp.net/api/Auth/Logout";

    final data={
      "fcmToken":"${Provider.of<HomeOriginrController>(context,listen: false).myToken}",

    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage(),),(route) => false,);
      final body=response.data;
      messagelogout=response.data['message'];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagelogout"),
        duration: Duration(seconds: 3),
        elevation: 25,));
      notifyListeners();
      return messagelogout.toString();
    }
    else {
      return null!;
    }
  }


}