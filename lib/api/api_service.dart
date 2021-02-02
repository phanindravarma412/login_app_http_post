import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/login_model.dart';

class ApiService{
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async{
    String url = 'https://reqres.in/api/login';

    final response = await http.post(url, body: requestModel.toJson());
    print(requestModel.toJson());
    if(response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load data');
    }
  }
}