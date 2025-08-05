import 'package:ifarmer/src/app_config/imports/import.dart';

class ApiServices {

  static ApiServices? _instance;
  ApiServices._internal();
  factory ApiServices(){
    _instance ??= ApiServices._internal();
    return _instance!;
  }

  final RestApi _restApiClient = RestApi();

  Future<dynamic> getSearch({required String name, required int page}) async {
    final response = await _restApiClient.get(baseURL: ApiEndpoints.baseUrl,endpoint: ApiEndpoints.search(name: name, page: page));
    return response;
  }
  
  Future<dynamic> postDemoData(Map<String, dynamic> data) async {
    final response = await _restApiClient.post(baseURL: ApiEndpoints.baseUrl,endpoint: ApiEndpoints.key,body: data,needEncode: true);
    return response;
  }

}
