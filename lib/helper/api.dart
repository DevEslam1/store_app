import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();

  Future<dynamic> get({required String url, String? token}) async {
    Options options = Options();
    if (token != null) {
      options.headers = {'Authorization': 'Bearer $token'};
    }
    Response response = await _dio.get(url, options: options);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, dynamic body, String? token}) async {
    Options options = Options();
    if (token != null) {
      options.headers = {'Authorization': 'Bearer $token'};
    }
    Response response = await _dio.post(url, data: body, options: options);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${response.data}');
    }
  }

  Future<dynamic> put(
      {required String url, dynamic body, String? token}) async {
    Options options = Options();
    options.headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    if (token != null) {
      options.headers!.addAll({'Authorization': 'Bearer $token'});
    }

    Response response = await _dio.put(url, data: body, options: options);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${response.data}');
    }
  }
}
