import 'package:ifarmer/src/app_config/imports/import.dart';

class ApiServices {

  static ApiServices? _instance;
  ApiServices._internal();
  factory ApiServices(){
    _instance ??= ApiServices._internal();
    return _instance!;
  }

  final RestApi _restApiClient = RestApi();

  Future<dynamic> getSearch({required String name, required int page, String? year}) async {
    final response = await _restApiClient.get(baseURL: ApiEndpoints.baseUrl,endpoint: ApiEndpoints.search(name: name, page: page, year: year));
    return response;
  }
  
  Future<dynamic> getDetails({required String imdbID}) async {
    print(ApiEndpoints.details(imdbID: imdbID));
    final response = await _restApiClient.get(baseURL: ApiEndpoints.baseUrl,endpoint: ApiEndpoints.details(imdbID: imdbID));
    return response;
  }

}
