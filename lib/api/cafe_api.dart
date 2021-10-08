import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://localhost:8080/api';
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet( String path ) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioError catch (e) {
      print(e.response);
      throw('Error en el GET: $e');
    }
  }

  static Future httpPost( String path, Map<String, dynamic> data ) async {
    final requestData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: requestData);
      return resp.data;
    } on DioError catch (e) {
      throw('Error en el POST: $e');
    }
  }

  static Future httpPut( String path, Map<String, dynamic> data ) async {
    final requestData = FormData.fromMap(data);
    try {
      final resp = await _dio.put(path, data: requestData);
      return resp.data;
    } on DioError catch (e) {
      throw('Error en el PUT: $e');
    }
  }

  static Future httpDelete( String path, Map<String, dynamic> data ) async {
    final requestData = FormData.fromMap(data);
    try {
      final resp = await _dio.delete(path, data: requestData);
      return resp.data;
    } on DioError catch (e) {
      throw('Error en el DELETE: $e');
    }
  }
}
