import 'package:ifarmer/src/app_config/imports/import.dart';

class ApiEndpoints {

  static String get baseUrl => AppEnvironment.baseUrl;

  static const login = String.fromEnvironment('ENDPOINT_LOGIN');
}
