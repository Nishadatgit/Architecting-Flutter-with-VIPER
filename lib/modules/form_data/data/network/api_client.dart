import 'package:dio/dio.dart';
import '../exceptions/network_exceptions.dart';

class FormDataApiClient {
  final Dio dio;
  final String baseUrl;
  final String apiToken;

  FormDataApiClient({
    required this.dio,
    this.baseUrl = 'http://127.0.0.1:8000',
    required this.apiToken,
  });

  Future<dynamic> fetchFormData() async {
    try {
      final response = await dio.get(
        '$baseUrl/form_data',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw NetworkException(
          message: 'Failed to fetch data',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw NetworkException(
        message: e.message ?? 'Unknown network error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
