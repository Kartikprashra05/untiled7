


import 'package:dio/dio.dart';

import '../Injector.dart';
import '../model/user_model.dart';
import '../shared/data_response.dart';
import '../shared/error_model.dart';
import 'api_constants..dart';

class AuthApiProvider{

  late Dio _dio;

  AuthApiProvider() {
    _dio = Injector().getDio();
  }

   Future<dynamic> signUp(UserModel userModel) async{
    try{
      Response response = await _dio.post(ApiConstants.signUp, data: userModel);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data, (data) =>
          UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }catch(error){
      final res = (error as dynamic).response;
      if(res!=null) return ErrorModel.fromJson(res?.data);
      return ErrorModel(message: error.toString());
    }
  }


}