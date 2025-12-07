import 'package:dio/dio.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  late Dio dio;

  NetworkService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://your-api-url.com/api/",
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {"Accept": "application/json"},
      ),
    );

    _addInterceptors();
  }

  // -------------------------------------------
  // ADD INTERCEPTORS
  // -------------------------------------------
  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("\n⏳ REQUEST → ${options.method} ${options.uri}");
          print("Headers: ${options.headers}");
          print("Data: ${options.data}");
          handler.next(options);
        },

        onResponse: (response, handler) {
          print(
            "\n✅ RESPONSE → ${response.statusCode} ${response.requestOptions.uri}",
          );
          print("Data: ${response.data}");
          handler.next(response);
        },

        onError: (DioError error, handler) {
          print(
            "\n❌ ERROR → ${error.response?.statusCode} ${error.requestOptions.uri}",
          );

          if (error.type == DioErrorType.connectionTimeout) {
            print("⛔ Connection Timeout");
          } else if (error.type == DioErrorType.receiveTimeout) {
            print("⛔ Receive Timeout");
          } else if (error.type == DioErrorType.badResponse) {
            print("⛔ Server Error: ${error.response?.data}");
          } else {
            print("⛔ Error Message: ${error.message}");
          }

          handler.next(error);
        },
      ),
    );
  }

  // -------------------------------------------
  // TOKEN MANAGEMENT
  // -------------------------------------------
  void setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  void clearToken() {
    dio.options.headers.remove("Authorization");
  }

  // -------------------------------------------
  // GET
  // -------------------------------------------
  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.get(endpoint, queryParameters: params);
    } catch (e) {
      rethrow;
    }
  }

  // -------------------------------------------
  // POST
  // -------------------------------------------
  Future<Response> postRequest(
    String endpoint, {
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      return await dio.post(
        endpoint,
        data: isFormData ? FormData.fromMap(data) : data,
      );
    } catch (e) {
      rethrow;
    }
  }

  // -------------------------------------------
  // PUT
  // -------------------------------------------
  Future<Response> putRequest(
    String endpoint, {
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      return await dio.put(
        endpoint,
        data: isFormData ? FormData.fromMap(data) : data,
      );
    } catch (e) {
      rethrow;
    }
  }

  // -------------------------------------------
  // DELETE
  // -------------------------------------------
  Future<Response> deleteRequest(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.delete(endpoint, queryParameters: params);
    } catch (e) {
      rethrow;
    }
  }
}
