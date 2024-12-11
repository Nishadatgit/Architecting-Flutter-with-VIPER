import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:viper_form_app/modules/form_data/data/network/api_client.dart';
import 'package:viper_form_app/modules/form_data/data/network/interceptors.dart';

void setupDependencyInjection() {
  final getIt = GetIt.I;

  // Dio client
  getIt.registerFactory<Dio>(
      () => Dio()..interceptors.add(LoggingInterceptor()));

  // API Client
  getIt.registerFactory<FormDataApiClient>(() => FormDataApiClient(
        dio: getIt(),
        apiToken: 'NevQXk3F5cFn1uNoCauvNbS8Z1jR9qsJtQxN2VMB',
      ));
}
