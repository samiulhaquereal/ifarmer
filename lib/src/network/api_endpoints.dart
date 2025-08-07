import 'package:ifarmer/src/app_config/imports/import.dart';

class ApiEndpoints {

  static String get baseUrl => AppEnvironment.baseUrl;

  static const key = String.fromEnvironment('API_KEY');
  static String get apiKey => '&apikey=$key';

  static const endpointSearch = String.fromEnvironment('ENDPOINT_SEARCH');
  static const endpointDetails = String.fromEnvironment('ENDPOINT_DETAILS');
  static String search({required String name,required int page, String? year}){
   return year != null ? '$endpointSearch$name&y=$year&page=$page$apiKey' : '$endpointSearch$name&page=$page$apiKey';
  }
  static String details({required String imdbID}) => '$endpointDetails$imdbID$apiKey';
}
