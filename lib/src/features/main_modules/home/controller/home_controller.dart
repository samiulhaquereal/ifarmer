import 'package:ifarmer/src/app_config/imports/import.dart';

class HomeController extends BaseController{

  RxBool ignore = false.obs;
  Rx<SearchModel?> posterResult = Rx<SearchModel?>(null);
  RxList<String> posterPaths = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getMoviePoster();
  }



  Future<void> _getMoviePoster() async {
    try {
      Map<String, dynamic>? response = await apiServices.getSearch(name: 'Batman', page: 1);
      if (response?['records'] != null && response?['records']['Response'] == 'True'){
        final jsonString = jsonEncode(response?['records']);
        posterResult.value = searchModelFromJson(jsonString);
        posterPaths.value = posterResult.value?.search
            ?.map((e) => e.poster ?? '')
            .where((url) => url.isNotEmpty)
            .toList() ?? [];
        console.log(posterPaths.value);
      }
    } catch (e) {
      console.log('Error fetching LC List: $e');
    }
  }

}
