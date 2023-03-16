import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:post/index.dart';
class ApiData{
  Future<ApiModel> getRequest(String url) async{
    ApiModel apiModel;
    try{
      final uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      if(response.statusCode == 200){
        apiModel = ApiModel(body: jsonDecode(response.body), message: 'Request made successfully', statusCode: response.statusCode);
      }else{
        apiModel = ApiModel(body: null, message: 'Request failed', statusCode: response.statusCode);
      }
    } on SocketException catch (_){
      throw Exception('Check your internet connection!!!');
    }
    return apiModel;
  }
}