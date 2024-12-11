import 'package:flutter/material.dart';
import 'package:viper_form_app/dependecy_injection.dart';
import 'package:viper_form_app/modules/form_data/view/form_data_view.dart';
import 'package:viper_form_app/modules/form_data_v2/view/form_data_view_v2.dart';

void main() {
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIPER Form Data App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => FormDataViewV2(),
      },
    );
  }
}
