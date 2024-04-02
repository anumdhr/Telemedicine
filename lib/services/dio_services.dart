import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:seventh_sem_project/constant/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioServices {
  final Dio _dio = Dio();

  DioServices() {
    if (kDebugMode) {
      _dio.options.baseUrl = ApiUrl.baseUrl;
    } else {
      _dio.options.baseUrl = ApiUrl.baseUrl;
    }
    // _dio.options.followRedirects = false;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      // 'Accept': '*/*',
      'Accept': 'application/json',
    };
    _dio.options.validateStatus = (val) => true;
    /*_dio.options.connectTimeout = 10000; //5s
    _dio.options.receiveTimeout = 10000;*/

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print('onREQUEST PRINT');
        // final pref = Get.find<SharedPreferenceService>();
        // final pref = await SharedPreferences.getInstance();
        // final user = pref.getString("user")!=null?jsonDecode(pref.getString("user")!):"";
        // final user = pref.getString("user") != null ? jsonDecode(pref.getString("user")!) : "";
        // final token = pref.getString("Token");
        // final pref = getIt<SharedPreferencesServiceNew>().getString(headerKey);

        // if (pref != null) {
        //   final User data = User.fromJson(jsonDecode(pref));
        //   options.headers['Authorization'] = 'Bearer ${data.accessToken}';
        // }

        // print(user['accessToken']);

        return handler.next(options);
      },
      onResponse: (e, handler) {
        if (e.statusCode == 401) {
          // Get.offAll(()=> const LoginScreen());
          // CustomSnackBar.error("Unauthorized");
        }
        return handler.next(e);
      },
      onError: (e, handler) {},
    ));
  }

  Dio get dio => _dio;
}

DioServices get ds => DioServices();
