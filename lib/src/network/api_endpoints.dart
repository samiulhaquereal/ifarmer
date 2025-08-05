import 'package:ifarmer/src/app_config/imports/import.dart';

class ApiEndpoints {

  static String get baseUrl => AppEnvironment.baseUrl;

  static const key = String.fromEnvironment('API_KEY');
  static String get apiKey => '&apikey=$key';

  static const endpointSearch = String.fromEnvironment('ENDPOINT_SEARCH');
  static String search({required String name,required int page}) => '$endpointSearch$name&page=$page$apiKey';
}
