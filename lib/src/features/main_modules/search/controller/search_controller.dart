import 'package:ifarmer/src/app_config/imports/import.dart';

class SearchItemController extends BaseController{

  RxString query = ''.obs;
  Rx<SearchModel?> searchResult = Rx<SearchModel?>(null);

  void onSearchTextChanged(String value) {
    query.value = value;

    debounce(query, (_) {
      if (value.trim().isNotEmpty) {
        getMoviePoster(name: value.trim());
      }
    }, time: Duration(milliseconds: 500));
  }


  Future<void> getMoviePoster({required String name}) async {
    try {
      Map<String, dynamic>? response = await apiServices.getSearch(name: name, page: 1);
      if (response?['records'] != null && response?['records']['Response'] == 'True') {
        final jsonString = jsonEncode(response?['records']);
        searchResult.value = searchModelFromJson(jsonString);
      } else {
        searchResult.value = null;
      }
    } catch (e) {
      console.log('Error fetching LC List: $e');
    }
  }

  void onTapItem({required String imdbID}){
    Get.toNamed(Routes.getMovieDetailsRoute(), arguments: imdbID);
  }
}
