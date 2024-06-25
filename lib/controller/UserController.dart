import 'package:dio/dio.dart';
import 'package:findme/view/login/login.dart';
import 'package:findme/view/user/HomeUserPage.dart';
import 'package:findme/view/user/mainhomeuser.dart';
import 'package:findme/view/widgets/custome_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../model/AllApproveRequestUser.dart';
import '../model/AllIdentificationRequestApprove.dart';
import '../view/origin/HomeOrigin/HomeOrigin.dart';
import '../view/origin/HomeOrigin/community.dart';
import '../view/origin/HomeOrigin/craeteposts.dart';
import '../view/profile/profile.dart';
import '../view/user/DetailsUser/AddRelative.dart';
import '../view/user/DetailsUser/DetailsOfUser.dart';
import 'HomeOriginController.dart';


class HomeUserController extends ChangeNotifier{

  DateTime? date;
  //date
  choosedate(context)async{
    date= await showDatePicker(context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(1800),
  lastDate: DateTime(2100));
  notifyListeners();
  return date.toString();
  }


  //image from gallery
  String? urlimageg;
  File? fileg;


  getimage()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    fileg=File(image!.path);

    var imagename=basename(image!.path);

    var refimage=FirebaseStorage.instance.ref("images User Gallery/$imagename");
    await refimage.putFile(fileg!);
    urlimageg=await refimage.getDownloadURL();

    notifyListeners();
  }

  // image from camera

//   String? urlimagec;
//   File? filec;
//
//   getimagecamera()async{
//     final ImagePicker picker = ImagePicker();
// // Pick an image.
// //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//     // Capture a photo.
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);
//     filec=File(photo!.path);
//
//     var imagename=basename(photo!.path);
//
//     var refimage=FirebaseStorage.instance.ref("images User by camera/$imagename");
//     await refimage.putFile(filec!);
//     urlimagec=await refimage.getDownloadURL();
//
//     notifyListeners();
//   }

  //relative images
  String? urlimagelerative;
  File? filerelative;

  //image from gallery
  getimagerelative()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    filerelative=File(image!.path);

    var imagename=basename(image!.path);

    var refimage=FirebaseStorage.instance.ref("images Relative Gallery/$imagename");
    await refimage.putFile(filerelative!);
    urlimagelerative=await refimage.getDownloadURL();

    notifyListeners();
  }

  //navigation bar
  int currentpage=0;

  List<Widget> pages=[
    Homeuserpage(),
    CreatePosts(),
    Community(),
    ProfilePage()

  ];
  Moving(int i){
    currentpage=i;
    notifyListeners();
  }

  //regiter

  String? message;

  Future<String> senddata(String name,String email,String phone,String gender,String password,context)async{
    Dio dio =Dio();
    dio.options.headers['Content-Type']='application/json';

    String urlpost="http://findme.runasp.net/api/Auth/Register";

    final data={
      "name":name,
      "email":email,
      "phoneNumber":phone,
      "gendre":gender,
      "password":password
    };
    Response response=await dio.post(urlpost,data: data);
    if(response.statusCode==200){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
      final body=response.data;
      message=response.data['message'] ;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message")));
      return message.toString();
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error in email or password")));
      return null!;
    }
  }notifyListeners();

  // details
  String? messagedetails;

  Future<String?> addDetails(String NationalId, String MatiralStatus,
      String Job,String PhoneNumber,String notes ,String Address, context) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${Provider.of<HomeOriginrController>(context,listen: false).token}";
    String urlPost = "http://findme.runasp.net/api/User/Details";

    MultipartFile? photoFile;
    if (fileg != null) {
      photoFile = await MultipartFile.fromFile(fileg!.path);
    }

    FormData data = FormData.fromMap({
      "UserId": "${Provider.of<HomeOriginrController>(context,listen: false).iduser}",
      "UserDetails.NationalId": NationalId,
      "UserDetails.MatiralStatus": MatiralStatus,
      "UserDetails.BirthDate": date,
      "UserDetails.Job": Job,
      "UserDetails.PhoneNumber": PhoneNumber,
      "UserDetails.Notes": notes,
      "UserDetails.Address": Address,
      "UserDetails.Photo": photoFile,
    });

    try {
      Response response = await dio.post(urlPost, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        messagedetails = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagedetails")));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainHomeUser(),));
        return messagedetails.toString();
      } else if (response.statusCode == 400) {
        // Handle 400 status code
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bad request: ${response.data}")));
        return null;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is an error in the request")));
        return null;
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred")));
      return null;
    }
  }

  // update details
  String? messagedetailsupdate;

  Future<String?> updateDetails(String NationalId, String MatiralStatus,
      String Job,String PhoneNumber,String notes ,String Address, context) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${Provider.of<HomeOriginrController>(context,listen: false).token}";
    String urlPost = "http://findme.runasp.net/api/User/Details/${Provider.of<HomeOriginrController>(context,listen: false).iduser}";

    MultipartFile? photoFile;
    if (fileg != null) {
      photoFile = await MultipartFile.fromFile(fileg!.path);
    }

    FormData data = FormData.fromMap({
      "UserId": "${Provider.of<HomeOriginrController>(context,listen: false).iduser}",
      "UserDetails.NationalId": NationalId,
      "UserDetails.MatiralStatus": MatiralStatus,
      "UserDetails.BirthDate": date,
      "UserDetails.Job": Job,
      "UserDetails.PhoneNumber": PhoneNumber,
      "UserDetails.Notes": notes,
      "UserDetails.Address": Address,
      "UserDetails.Photo": photoFile,
    });

    try {
      Response response = await dio.put(urlPost, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        messagedetailsupdate = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagedetailsupdate")));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainHomeUser(),));
        return messagedetailsupdate.toString();
      } else if (response.statusCode == 400) {
        // Handle 400 status code
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bad request: ${response.data}")));
        return null;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is an error in the request")));
        return null;
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred")));
      return null;
    }
  }
  //relatives //////////////////////////////////////////////////////////////////////////////////


  // Future<String> senddata(String name,String email,String phone,String gender,String password,context)async{
  //   Dio dio =Dio();
  //   dio.options.headers['Content-Type']='application/json';
  //
  //   String urlpost="http://findme.runasp.net/api/Auth/Register";
  //
  //   final data={
  //     "name":name,
  //     "email":email,
  //     "phoneNumber":phone,
  //     "gendre":gender,
  //     "password":password
  //   };
  //   Response response=await dio.post(urlpost,data: data);
  //   if(response.statusCode==200){
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
  //     final body=response.data;
  //     messagerelatives=response.data['message'] ;
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagerelatives")));
  //     return messagerelatives.toString();
  //   }
  //   else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error in email or password")));
  //     return null!;
  //   }
  // }notifyListeners();
  // Future<String> relativesfata(
  //     String name1,String phone1,String gendre1,String relation1,String relativenumber1,
  //     String name2,String phone2,String gendre2,String relation2,String relativenumber2,
  //     String name3,String phone3,String gendre3,String relation3,String relativenumber3,
  //     String name4,String phone4,String gendre4,String relation4,String relativenumber4,
  //     context) async {
  //   // Replace the URL with your API endpoint
  //   Dio dio=Dio();
  //   String apiUrl = 'http://findme.runasp.net/api/Auth/PostUserRelatives';
  //
  //   // Replace the headers and body with your API requirements
  //   dio.options.headers['Content-Type'] = 'application/json';
  //   dio.options.headers['Authorization'] = '${Provider.of<HomeOriginrController>(context,listen: false).token}';
  //
  //   Map<String, dynamic> data = {
  //     "userRelatives": [
  //       {
  //         "id": 0,
  //         "name": name1,
  //         "phoneNumber1": phone1,
  //         "gendre": gendre1,
  //         "relationship": relation1,
  //         "phoneNumber2": relativenumber1
  //       },
  //       {
  //         "id": 0,
  //         "name": name2,
  //         "phoneNumber1": phone2,
  //         "gendre": gendre2,
  //         "relationship": relation2,
  //         "phoneNumber2": relativenumber2
  //       },
  //       {
  //         "id": 0,
  //         "name": name3,
  //         "phoneNumber1": phone3,
  //         "gendre": gendre3,
  //         "relationship": relation3,
  //         "phoneNumber2": relativenumber3
  //       },
  //       {
  //         "id": 0,
  //         "name": name4,
  //         "phoneNumber1": phone4,
  //         "gendre": gendre4,
  //         "relationship": relation4,
  //         "phoneNumber2": relativenumber4
  //       }
  //     ],
  //     "userId": "${Provider.of<HomeOriginrController>(context,listen: false).iduser}"
  //   };
  //
  //   try {
  //     Response response = await dio.post(apiUrl, data: data);
  //     if(response.statusCode==200){
  //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
  //           final body=response.data;
  //           messagerelatives=response.data['message'] ;
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagerelatives")));
  //           return messagerelatives.toString();
  //         }
  //         else {
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is error in email or password")));
  //           return null!;
  //         }
  //     // Handle the response as per your requirements
  //   } catch (e) {
  //     print('Error: $e');
  //     return null!;
  //     // Handle errors here
  //   }
  // }

// Ensure you have Provider package imported
//   String? messagerelatives;
//
//   Future<String> postRelativesData(List<Map<String, String>> relativesData, BuildContext context) async {
//     Dio dio = Dio();
//     String apiUrl = 'https://findme.runasp.net/api/User/Relatives';
//
//     dio.options.headers['Content-Type'] = 'application/json';
//     String token = "${Provider.of<HomeOriginrController>(context, listen: false).token}";
//     dio.options.headers["Authorization"] = "Bearer $token";
//
//     Map<String, dynamic> data = {
//       "userRelatives": relativesData
//           .map((relative) => {
//         "id": relative['id'] ?? 0,
//         "name": relative['name'],
//         "phoneNumber1": relative['phoneNumber1'],
//         "gendre": relative['gendre'],
//         "relationship": relative['relationship'],
//         "phoneNumber2": relative['phoneNumber2']
//       })
//           .toList(),
//       "userId": Provider.of<HomeOriginrController>(context, listen: false).iduser,
//     };
//
//     try {
//       Response response = await dio.post(apiUrl, data: data);
//
//       if (response.statusCode == 200) {
//         final body = response.data;
//         String messagerelatives = response.data['message'];
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagerelatives")));
//         return messagerelatives.toString();
//       } else {
//         String errorMessage = "Error ${response.statusCode} - ${response.statusMessage}";
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
//         return null!;
//       }
//     } on DioException catch (e) {
//       print('Dio Error: $e');
//       String errorMessage = "Dio Error - ${e.message}";
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
//       return null!;
//     } catch (e) {
//       print('General Error: $e');
//       String errorMessage = "General Error - $e";
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
//       return null!;
//     }
//   }


  //identification request

  //image from gallery
  String? urlimagegiden;
  File? filegiden;


  getimageiden()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    filegiden=File(image!.path);

    var imagename=basename(image!.path);

    var refimage=FirebaseStorage.instance.ref("images User identify Gallery/$imagename");
    await refimage.putFile(filegiden!);
    urlimagegiden=await refimage.getDownloadURL();

    notifyListeners();
  }

  String? identymessage;

  Future<String> sendRequestIdentity(String description, context) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${Provider.of<HomeOriginrController>(context, listen: false).token}";

    String urlPost = "http://findme.runasp.net/api/User/IdentificationRequest";

    MultipartFile? fileProof;
    if (filegiden != null) {
      fileProof = await MultipartFile.fromFile(filegiden!.path);
    }

    FormData data = FormData.fromMap({
      "Descripation": description,
      "ActorId": "${Provider.of<HomeOriginrController>(context, listen: false).iduser}",
      "Photo": fileProof,
    });

    try {
      Response response = await dio.post(urlPost, data: data);

      if (response.statusCode == 200) {
        identymessage = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$identymessage")));
        return identymessage.toString();
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

  //get disapprove
  Dio dio=Dio();
  Future<AllDisapproveRequetUser> allDiapproveRequestuser(context)async{
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<HomeOriginrController>(context, listen: false).token} ";
    String DisapproveRequesturl="http://findme.runasp.net/api/User/UnapprovedRecognitionRequests?UserId=${Provider.of<HomeOriginrController>(context, listen: false).iduser}&PageNumber=1&PageSize=10";
    Response response=await dio.get(DisapproveRequesturl);
    // print("\nBody ${response.data} stutus ${response.statusCode}");
    return AllDisapproveRequetUser.fromJson(response.data);
  }

  //get Approve

  Future<AllIdentificationApprove> allApproveRequestuser(context)async{
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<HomeOriginrController>(context, listen: false).token} ";
    String ApproveRequesturl="http://findme.runasp.net/api/User/ApprovedRecognitionRequests?UserId=${Provider.of<HomeOriginrController>(context, listen: false).iduser}&PageNumber=1&PageSize=10";
    Response response=await dio.get(ApproveRequesturl);
    // print("\nBody ${response.data} stutus ${response.statusCode}");
    return AllIdentificationApprove.fromJson(response.data);
  }



}