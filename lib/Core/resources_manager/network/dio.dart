import 'package:dio/dio.dart';

// Wrapper Class
class DioHelper {
  DioHelper._internal();
  static DioHelper? _instance;
  factory DioHelper() {
    _instance ??= DioHelper._internal();
    return _instance!;
  }

  Dio dio = Dio(
    BaseOptions(baseUrl: 'https://nti-production.up.railway.app/api/'),
  );
  Future<Response?> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio.get(
        endPoint,
        data: FormData.fromMap(data ?? {}),
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<Response?> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio.post(
        endPoint,
        data: FormData.fromMap(data ?? {}),
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();
  late Dio dio;

  // API Base URL ثابت
  static const String baseUrl = "https://nti-production.up.railway.app/api/";

  // Private Constructor لتطبيق Singleton
  ApiHelper._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );
  }

  // Getter لـ Singleton Instance
  static ApiHelper get instance => _instance;

  // GET Request
  Future<Response> getData(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response response = await dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  // POST Request
  Future<Response> postData(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  // PUT Request
  Future<Response> putData(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  // DELETE Request
  Future<Response> deleteData(String endpoint) async {
    try {
      Response response = await dio.delete(endpoint);
      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  // PATCH Request
  Future<Response> patchData(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response = await dio.patch(endpoint, data: data);
      return response;
    } catch (e) {
      return _handleError(e);
    }
  }

  // دالة لمعالجة الأخطاء وإرجاع Response فارغ
  Response _handleError(dynamic error) {
    // ignore: avoid_print
    print("❌ Dio Error: $error");
    return Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 500,
      statusMessage: "Internal Server Error",
    );
  }
}
