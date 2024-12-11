import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class LoggingInterceptor extends Interceptor {
  final bool request;
  final bool requestHeader;
  final bool requestBody;
  final bool responseHeader;
  final bool responseBody;
  final bool error;
  final int maxWidth;

  LoggingInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = 90,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (request) {
      _printRequestLog(options);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (responseHeader || responseBody) {
      _printResponseLog(response);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error) {
      _printErrorLog(err);
    }
    super.onError(err, handler);
  }

  void _printRequestLog(RequestOptions options) {
    developer.log('╔══════════ Request ════════════', name: 'DIO');
    developer.log('║ URL: ${options.uri}', name: 'DIO');
    developer.log('║ Method: ${options.method}', name: 'DIO');

    if (requestHeader) {
      developer.log('║ Headers:', name: 'DIO');
      options.headers.forEach((key, value) {
        developer.log('║ $key: $value', name: 'DIO');
      });
    }

    if (requestBody) {
      developer.log('║ Request Body:', name: 'DIO');
      _printWrapped(options.data?.toString() ?? 'No body', 'DIO');
    }

    developer.log('╚══════════════════════════════', name: 'DIO');
  }

  void _printResponseLog(Response response) {
    developer.log('╔══════════ Response ═══════════', name: 'DIO');
    developer.log('║ URL: ${response.requestOptions.uri}', name: 'DIO');
    developer.log('║ Status Code: ${response.statusCode}', name: 'DIO');

    if (responseHeader) {
      developer.log('║ Headers:', name: 'DIO');
      response.headers.map.forEach((key, value) {
        developer.log('║ $key: $value', name: 'DIO');
      });
    }

    if (responseBody) {
      developer.log('║ Response Body:', name: 'DIO');
      _printWrapped(response.data?.toString() ?? 'No body', 'DIO');
    }

    developer.log('╚══════════════════════════════', name: 'DIO');
  }

  void _printErrorLog(DioException err) {
    developer.log('╔══════════ Error ═════════════', name: 'DIO');
    developer.log('║ URL: ${err.requestOptions.uri}', name: 'DIO');
    developer.log('║ Status Code: ${err.response?.statusCode}', name: 'DIO');
    developer.log('║ Error Message: ${err.message}', name: 'DIO');
    developer.log('║ Error Type: ${err.type}', name: 'DIO');

    if (err.response != null && err.response!.data != null) {
      developer.log('║ Error Response Body:', name: 'DIO');
      _printWrapped(err.response!.data.toString(), 'DIO');
    }

    developer.log('╚══════════════════════════════', name: 'DIO');
  }

  void _printWrapped(String text, String name) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) {
      developer.log('║ ${match.group(0)}', name: name);
    });
  }
}
