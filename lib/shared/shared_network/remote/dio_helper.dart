import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
class DioHelper
{
  static  Dio? dio;
  static init() {
     dio = Dio(
        BaseOptions(
          baseUrl:'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Context-Type' :'application/json',
            'lang':'en',
          },

        ),
    );
  }

  static Future<Response> getData({
  required String url,
   Map<String, dynamic>? query,
    String lang ='ar',
    String? token,


  })async {
    dio!.options.headers={
      'lang':lang,
      'token' :'token',
    };

    {
      return await dio!.get(
        url,
        queryParameters: query,
      );
    }
  }

  static Future<Response> postData({
    required String url,
     Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang ='ar',
    String? token,

  })async
  {
  dio!.options.headers={
    'lang':lang,
    'token' :'token',
  };


    return dio!.post(
      url,
      queryParameters: query,
        data:data,
    );
  }
}