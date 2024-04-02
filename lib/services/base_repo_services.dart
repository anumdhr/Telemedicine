import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData;
import 'package:seventh_sem_project/services/dio_services.dart';

class ApiServices {
  static final instance = ApiServices();


  Future<Map<String, dynamic>> postDataandDecode({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? token,
    bool? isFileUpload=false,
  }) async {
    final dio = ds.dio;
    Map<String, dynamic> headers = {};

    ///if token is available then
    // if (token != null) {
    //   headers['Authorization'] = 'Bearer $token';
    // }
    headers.addAll(dio.options.headers);
    if (isFileUpload!) {
      headers.update('Content-Type', (value) => 'multipart/form-data');
    }
    final response = await dio.post(
      url,
      data: isFileUpload?FormData.fromMap(data):data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    debugPrint('response post: ${response.statusCode}');
    debugPrint('response post data: ${response.data}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resJson =  jsonDecode(response.data);
      if (resJson is String) {
        throw 'Unauthorized request!';
      } else {
        debugPrint('response json: ${resJson['status_code']}');
        if (resJson['status_code'] == 200 || resJson['status_code'] == 201) {
          if (resJson.containsKey('data')) {
            if (resJson['data'] is List) {
              debugPrint('is list: ${resJson['data'].length}');
              final returnData = {
                'dataList': resJson['data'],
              };
              return returnData;
            }
            return resJson['data'] ?? {};
          } else {
            return resJson;
          }
        } else {
          if(resJson['message']=="Unauthorized"){
            // Get.offAll(()=> LoginScreen());
          }
          // print(resJson['message']);
          throw resJson['message'];
        }
      }
    } else {
      final resJson = jsonDecode(response.data);
      throw resJson['message'];
    }
  }


  Future<Map<String, dynamic>> postData({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? token,
    bool? isFileUpload=false,
  }) async {
    final dio = ds.dio;
    Map<String, dynamic> headers = {};

    ///if token is available then
    // if (token != null) {
    //   headers['Authorization'] = 'Bearer $token';
    // }
    headers.addAll(dio.options.headers);
    if (isFileUpload!) {
      headers.update('Content-Type', (value) => 'multipart/form-data');
    }
    Map<String, dynamic> queryParams = {
      ...?queryParameters,
    };
    final response = await dio.post(
      url,
      data: isFileUpload?FormData.fromMap(data):data,
      queryParameters: queryParams,
      options: Options(
        headers: headers,
      ),
    );

    debugPrint('response post: ${response.statusCode}');
    debugPrint('response post data: ${response.data}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resJson =  response.data;
      if (resJson is String) {
        throw 'Unauthorized request!';
      } else {
        debugPrint('response json: ${resJson['status_code']}');
        if (resJson['status_code'] == 200 || resJson['status_code'] == 201) {
          if (resJson.containsKey('data')) {
            if (resJson['data'] is List) {
              debugPrint('is list: ${resJson['data'].length}');
              final returnData = {
                'dataList': resJson['data'],
              };
              return returnData;
            }
            return resJson['data'] ?? {};
          } else {
            return resJson;
          }
        } else {
          // print(resJson['message']);
          throw resJson['message'];
        }
      }
    } else {
      final resJson = response.data;
      print(resJson['message']);
      throw resJson['message'];
    }
  }

  Future<Map<String, dynamic>> putData({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final dio = ds.dio;
    Map<String, dynamic> headers = {};

    ///if token is available then
    // if (token != null) {
    //   headers['Authorization'] = 'Bearer $token';
    // }
    headers.addAll(dio.options.headers);
    Map<String, dynamic> queryParams = {
      ...?queryParameters,
    };

    final response = await dio.put(
      url,
      data: data,
      queryParameters: queryParams,
      options: Options(
        headers: headers,
      ),
    );
    debugPrint('response post: ${response.statusCode}');
    debugPrint('response post data: ${response.data}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resJson = response.data;
      debugPrint('rr $resJson');
      if (resJson is String) {
        throw 'Unauthorized request!';
      } else {
        debugPrint('response json: ${resJson['statusCode']}');
        if (resJson['status_code'] == 200 || resJson['status_code'] == 201) {
          if (resJson.containsKey('data')) {
            if (resJson['data'] is List) {
              debugPrint('is list: ${resJson['data'].length}');
              final returnData = {
                'dataList': resJson['data'],
              };
              return returnData;
            }
            return resJson['data'] ?? {};
          } else {
            return resJson;
          }
        } else {
          throw resJson['message'];
        }
      }
    } else {
      final resJson = response.data;
      throw resJson['message'];
    }
  }

  Future<Map<String, dynamic>> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final dio = ds.dio;
    Map<String, dynamic> headers = {};
    // if (token != null) {
    //   headers['Authorization'] = 'Bearer $token';
    // }
    Map<String, dynamic> queryParams = {
      ...?queryParameters,
    };
    debugPrint(queryParams.toString());
    headers.addAll(dio.options.headers);
    final response = await dio.get(
      url,
      queryParameters: queryParams,
      options: Options(
        headers: headers,
      ),
    );
    // debugPrint('response after login: ${response.statusMessage}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resJson = response.data;
      // debugPrint('res json: $resJson');
      if (resJson is String) {
        throw 'Unauthorized request!';
      } else {
        if (resJson['status_code'] == null) {
          if (resJson.containsKey('data')) {
            resJson['status_code'] = 200;
          }
        }
        if (resJson['status_code'] == 200) {
          if (resJson['data'] is List) {
            debugPrint('is list: ${resJson['data'].length}');
            // if (((resJson['total_size']) / pageSize).ceil() < queryParams['page']) {
            //   throw "allLoad";
            // }else{
            //   final returnData = {
            //     'dataList': resJson['data'],
            //   };
            //   return returnData;
            // }
            final returnData = {
              'dataList': resJson['data'],
            };return returnData;
          }
          return resJson['data'] ?? {};
        } else {
          throw resJson['message'];
        }
      }
    } else {
      final resJson = response.data;
      throw resJson['message'];
    }
  }

  Future<Map<String, dynamic>> deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final dio = ds.dio;
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    headers.addAll(dio.options.headers);
    final response = await dio.delete(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    // debugPrint('response after login: ${response.statusMessage}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resJson = response.data;
      debugPrint('res json: $resJson');
      if (resJson is String) {
        throw 'Unauthorized request!';
      } else {
        if (resJson['statusCode'] == null) {
          if (resJson.containsKey('data')) {
            resJson['statusCode'] = 200;
          }
        }
        if (resJson['statusCode'] == 200) {
          if (resJson['data'] is List) {
            debugPrint('is list: ${resJson['data'].length}');
            final returnData = {
              'dataList': resJson['data'],
            };
            return returnData;
          }
          return resJson['data'] ?? {};
        } else {
          throw resJson['message'];
        }
      }
    } else {
      final resJson = response.data;
      if (response.statusCode == 401) {}
      throw resJson['message'];
    }
  }
}

ApiServices get apiInstance => ApiServices.instance;