import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://locahost:8080/api';
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.get('token') ?? ''
    };
  }

  static Future httpGet( String path ) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      print(e);
      throw('Error en el GET: $e');
    }
  }
}
