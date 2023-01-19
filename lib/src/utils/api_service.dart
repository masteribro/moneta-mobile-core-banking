import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_response.dart';
import 'app_config.dart';

enum HttpMethod { get, post, patch, put, delete }

class ApiService {
  static final Map<String, String> _requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  final String token;

  ApiService(this.token);

  static final _options = BaseOptions(
    baseUrl: AppConfig.coreBankingBaseUrl,
    headers: _requestHeaders,
    connectTimeout: 50000,
    receiveTimeout: 50000,
  );

  Dio _dio() {
    Dio dio;
    if (kReleaseMode) {
      dio = Dio(_options);
    } else {
      dio = Dio(_options)
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ));
    }
    return dio;
  }

  Future<ApiResponse> call({
    required HttpMethod method,
    required String endpoint,
    Map<String, dynamic>? reqBody,
    FormData? formData,
    bool protected = true,
    bool useFormData = false,
  }) async {
    try {
      switch (method) {
        case HttpMethod.post:
          Response response = await _dio().post(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(
                headers: !protected ? {} : {"Authorization": "Bearer $token"}),
          );
          return ApiResponse(response);

        case HttpMethod.get:
          Response response = await _dio().get(
            endpoint,
            options: Options(
                headers: !protected ? {} : {"Authorization": "Bearer $token"}),
          );
          return ApiResponse(response);
        case HttpMethod.patch:
          Response response = await _dio().patch(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(
                headers: !protected ? {} : {"Authorization": "Bearer $token"}),
          );
          return ApiResponse(response);
        case HttpMethod.put:
          Response response = await _dio().put(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(
                headers: !protected ? {} : {"Authorization": "Bearer $token"}),
          );
          return ApiResponse(response);
        case HttpMethod.delete:
          Response response = await _dio().delete(
            endpoint,
            data: useFormData ? formData : reqBody,
            options: Options(
                headers: !protected ? {} : {"Authorization": "Bearer $token"}),
          );
          return ApiResponse(response);
      }
    } on DioError catch (e) {
      debugPrint(e.message);
      if (e.type == DioErrorType.connectTimeout) {
        return ApiResponse(
          Response(
              statusCode: 504,
              data: "Request timeout",
              requestOptions: RequestOptions(path: '')),
        );
      } else if (e.type == DioErrorType.other) {
        return ApiResponse(
          Response(
              statusCode: 101,
              data: "Network is unreachable",
              requestOptions: RequestOptions(path: '')),
        );
      }
      return ApiResponse(e.response!);
    }
  }
}
