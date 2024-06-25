import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/RecogniztionResults.dart';
import 'HomeOriginController.dart';

class Recognizationresultscntroller extends ChangeNotifier{
  //get results
  int? idapprove;
  Dio dio =Dio();
  Future<RecognizationResults> allResults(context)async{
    dio.options.headers['Content-Type']='application/json';
    dio.options.headers["Authorization"]="Bearer ${Provider.of<HomeOriginrController>(context, listen: false).token} ";
    String ApproveRequesturl="http://findme.runasp.net/api/User/RecognitionRequestResult/$idapprove";
    Response response=await dio.get(ApproveRequesturl);
    print("\nBody ${response.data} stutus ${response.statusCode}");
    return RecognizationResults.fromJson(response.data);
  }
}