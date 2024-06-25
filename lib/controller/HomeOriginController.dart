import 'package:dio/dio.dart';
import 'package:findme/view/origin/HomeOrigin/mainHome.dart';
import 'package:findme/view/user/DetailsUser/DetailsOfUser.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../model/AllComment.dart';
import '../model/AllPinPosts.dart';
import '../model/AllPosts.dart';
import '../view/origin/HomeOrigin/HomeOrigin.dart';
import '../view/origin/HomeOrigin/community.dart';
import '../view/origin/HomeOrigin/craeteposts.dart';
import '../view/profile/profile.dart';

class HomeOriginrController extends ChangeNotifier{
  String? urlimageg;
  File? fileg;

  //image from gallery
  getimage()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    fileg=File(image!.path);

    var imagename=basename(image!.path);

    var refimage=FirebaseStorage.instance.ref("images origin Gallery/$imagename");
    await refimage.putFile(fileg!);
    urlimageg=await refimage.getDownloadURL();

    notifyListeners();
  }

  // image from camera

  String? urlimagec;
  File? filec;

  getimagecamera()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    filec=File(photo!.path);

    var imagename=basename(photo!.path);

    var refimage=FirebaseStorage.instance.ref("images origin by camera/$imagename");
    await refimage.putFile(filec!);
    urlimagec=await refimage.getDownloadURL();

    notifyListeners();
  }

  //proof image//////////////////////////////////////////////////////////////////////
  String? urlproofimage;
  File? fileproof;

  //image from gallery
  getproofimage()async{
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    fileproof=File(image!.path);

    var imagename=basename(image!.path);

    var refimage=FirebaseStorage.instance.ref("proof images origin/$imagename");
    await refimage.putFile(fileproof!);
    urlproofimage=await refimage.getDownloadURL();

    notifyListeners();
  }

  //navigation bar///////////////////////////////////////////////////////////////////////////
  int currentpage=0;

  List<Widget> pages=[
    OriginHome(),
    CreatePosts(),
    Community(),
    ProfilePage()

  ];
  Moving(int i){
    currentpage=i;
    notifyListeners();
  }

  //send request /////////////////////////////////////////////////////////////////////////////

  String? message;

  Future<String> sendrequest(String name, String email, String phone, String address, context) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';

    String urlpost = "http://findme.runasp.net/api/Auth/OrganizationJoinReqest";

    // Encode the file to a MultipartFile
    MultipartFile? fileProof;
    if (fileproof != null) {
      fileProof = await MultipartFile.fromFile(fileproof!.path);
    }

    FormData data = FormData.fromMap({
      "Name": name,
      "Email": email,
      "PhoneNumber": phone,
      "Address": address,
      "RequestPhoto": fileProof,
    });

    try {
      Response response = await dio.post(urlpost, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        message = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message")));
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

  //login/////////////////////////////////////////////////////////////////////////////////////////

  //get fcm token
  String? myToken;
  String? token;
  String? iduser;
  String? role;
  String? messagelogin;

  Future<void> getToken() async {
    myToken = await FirebaseMessaging.instance.getToken();
    print("===========================================================");
    print("$myToken");
    notifyListeners();
  }

  Future<String?> sendData(String email, String password, context) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';

    String urlPost = "http://findme.runasp.net/api/Auth/login";

    final data = {
      "userIdentifier": email,
      "password": password,
      "FCMToken": myToken ,
    };

    try {
      Response response = await dio.post(urlPost, data: data);

      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data['data'] != null &&
            response.data['data']['token'] != null) {
          token = response.data['data']['token'];
          iduser = response.data['data']['id'];
          role = response.data['data']['role'];
          messagelogin = response.data['message'];
         role=='User'?Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DetailsUserPage()),(route) => false,)
         :Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainHome()),(route) => false,);
          return token.toString();
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is an error in the email or password")));
      return null;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null &&
            e.response!.statusCode == 400 &&
            e.response!.data != null &&
            e.response!.data!['message'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bad Request: ${e.response!.data!['message']}")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("")));
        }
        return null;
      }
    }
  }



  //create post //////////////////////////////////////////////////////////////////////////////////////

  //post image
  String? urlPostImage;
  File? filePost;

  Future<void> getPostImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    filePost = File(image.path);

    var imageName = basename(image.path);

    var refImage = FirebaseStorage.instance.ref("posts images /$imageName");
    await refImage.putFile(filePost!);
    urlPostImage = await refImage.getDownloadURL();

    notifyListeners();
  }

  String? messagePost;

  Future<String?> createPost(String description, String address, String phoneNumber, context) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    String urlPost = "http://findme.runasp.net/api/Post";

    MultipartFile? photoFile;
    if (filePost != null) {
      photoFile = await MultipartFile.fromFile(filePost!.path);
    }

    FormData data = FormData.fromMap({
      "ActorId": iduser,
      "Descripation": description,
      "PhoneNumber": phoneNumber,
      "Address": address,
      "Photo": photoFile,
    });

    try {
      Response response = await dio.post(urlPost, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        messagePost = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$messagePost")));
        return messagePost.toString();
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

  //get all posts ////////////////////////////////////////////////////////////////
  Dio dio =Dio();
  String AllPostsurl="http://findme.runasp.net/api/Post/?PageNumber=1&PageSize=15&KeyWord";

  Future<AllPosts> getAllPosts()async{
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer $token ";
    Response response=await dio.get(AllPostsurl);
    // print("\nBody ${response.data} stutus ${response.statusCode}");
    return AllPosts.fromJson(response.data);
  }

  //pin posts////////////////////////////////////////////////////////////
  int? idpost;
  String? pinmessage;

  Future<String> pinPosts(context) async {
    try {
      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';

      String urlpost = 'http://findme.runasp.net/api/Post/Pin';

      Map<String, dynamic> data = {
        'postId': idpost,
        'actorId': iduser,
      };

      Response response = await dio.post(
        urlpost,
        data: data,
        options: Options(
          contentType: 'application/json',
        ),
      );

      if (response.statusCode == 200) {
        pinmessage = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$pinmessage'),
            duration: const Duration(seconds: 3),
            elevation: 25,
          ),
        );
        notifyListeners();
        return pinmessage.toString();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Failed to pin the post.'),
            duration: const Duration(seconds: 3),
            elevation: 25,
          ),
        );
        return null!;
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('An error occurred while trying to pin the post.'),
          duration: const Duration(seconds: 3),
          elevation: 25,
        ),
      );
      return null!;
    }
  }

  //delete post
  late String deleteMessage;

  Future<String> deletePost(BuildContext context) async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    Map<String, dynamic> data = {
      'Id': idpost,
    };

    String urlPost = 'http://findme.runasp.net/api/post/$idpost';

    try {
      Response response = await dio.delete(urlPost, data: data);

      if (response.statusCode == 200) {
        deleteMessage = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$deleteMessage'),
            duration: Duration(seconds: 3),
            elevation: 25,
          ),
        );
        notifyListeners();
        return deleteMessage.toString();
      } else {
        return null!;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 405) {
        // Handle 405 status code error (Method Not Allowed) here
        print('HTTP 405 Method Not Allowed');
      }
      return null!;
    } catch (e) {
      print('An error occurred: $e');
      return null!;
    }
  }

  //get all pin posts
  late String Allpinpostsurl;

  Future<AllPinPosts> getAllPinPosts() async {
    Allpinpostsurl = 'http://findme.runasp.net/api/Post/Pinned?UserId=$iduser&PageNumber=1&PageSize=10&KeyWord';

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(Allpinpostsurl);

    // print("\nBody ${response.data} status ${response.statusCode}");
    return AllPinPosts.fromJson(response.data);
  }


  //unpin posts////////////////////////////////////////////////////////////
  String? unpinmessage;

  Future<String> unpinPosts(context) async {
    try {
      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';

      String urlpost = 'http://findme.runasp.net/api/Post/UnPin';

      Map<String, dynamic> data = {
        'postId': idpost,
        'actorId': iduser,
      };

      Response response = await dio.post(
        urlpost,
        data: data,
        options: Options(
          contentType: 'application/json',
        ),
      );

      if (response.statusCode == 200) {
        unpinmessage = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$unpinmessage'),
            duration: const Duration(seconds: 3),
            elevation: 25,
          ),
        );
        notifyListeners();
        return unpinmessage.toString();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Failed to pin the post.'),
            duration: const Duration(seconds: 3),
            elevation: 25,
          ),
        );
        return null!;
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('An error occurred while trying to pin the post.'),
          duration: const Duration(seconds: 3),
          elevation: 25,
        ),
      );
      return null!;
    }
  }

  //add comment
   String? messagecomment;

  Future<String> addComment(String content,BuildContext context) async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    Map<String, dynamic> data = {
      'content': content,
      'postId': idpost,
      'actorId': iduser,
    };

    String urlPost = 'http://findme.runasp.net/api/Comment/';

    try {
      Response response = await dio.post(urlPost, data: data);

      if (response.statusCode == 200) {
        messagecomment = response.data['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$messagecomment'),
            duration: Duration(seconds: 3),
            elevation: 25,
          ),
        );
        notifyListeners();
        return messagecomment.toString();
      } else {
        return null!;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 405) {
        // Handle 405 status code error (Method Not Allowed) here
        print('HTTP 405 Method Not Allowed');
      }
      return null!;
    } catch (e) {
      print('An error occurred: $e');
      return null!;
    }
  }

  //get all comment

  Future<AllComment> getAllComment() async {
    String AllCommenturl = 'http://findme.runasp.net/api/Post/$idpost';

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(AllCommenturl);

    // print("\nBody ${response.data} status ${response.statusCode}");
    return AllComment.fromJson(response.data);
  }
}