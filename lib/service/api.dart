import 'package:demo_project/Utils/constant.dart';
import 'package:demo_project/Utils/utils.dart';
import 'package:demo_project/service/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
  static final Api _instance = Api._internal();
  final Dio _dio = Dio();

  Api._internal();

  factory Api() => _instance;
  var customHeader = {
    "content-type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${Constant.token}"
  };
  interceptorWithOutToken() {
    return _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {

      options.headers.addAll(customHeader);
      return handler.next(options);
    }));
  }
  getStoreList(context) async {
    try {
      final Map<String, dynamic> queryParams = {'location': "NYC"};
      interceptorWithOutToken();
      Response response =
          await _dio.get(Constant.baseUrl, queryParameters: queryParams);
      return StoreList.fromJson(response.data);
    } on DioException catch (e) {
      displayToast("${e.response!.data}");
      debugPrint(e.response!.data);
      return null;
    }
  }
}
