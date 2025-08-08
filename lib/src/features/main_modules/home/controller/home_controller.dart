import 'package:ifarmer/src/app_config/imports/import.dart';

class HomeController extends BaseController{

  RxInt currentPage = 1.obs;
  RxBool ignore = false.obs;
  Rx<SearchModel?> posterResult = Rx<SearchModel?>(null);
  Rx<SearchModel?> latestMovieResult = Rx<SearchModel?>(null);
  RxList<String> posterPaths = <String>[].obs;
  RxList<String> latestMoviePosterPaths = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getMoviePoster();
    _getLatestMoviePoster();
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
      }
    } catch (e) {
      console.log('Error fetching List: $e');
    }
  }

  Future<void> _getLatestMoviePoster() async {
    try {
      final page = currentPage.value;
      Map<String, dynamic>? response = await apiServices.getSearch(name: 'Batman', page: page, year: '2022');
      if (response?['records'] != null && response?['records']['Response'] == 'True'){
        final jsonString = jsonEncode(response?['records']);
        latestMovieResult.value = searchModelFromJson(jsonString);
        latestMoviePosterPaths.value = latestMovieResult.value?.search
            ?.map((e) => e.poster ?? '')
            .where((url) => url.isNotEmpty)
            .toList() ?? [];
      }
    } catch (e) {
      console.log('Error fetching List: $e');
    }
  }

  void onTapItem({
    required String posterUrl,
    required Rx<SearchModel?> source,
  }) {
    final matchedItem = source.value?.search
        ?.firstWhere((item) => item.poster == posterUrl);

    if (matchedItem != null && matchedItem.imdbId != null) {
      Get.toNamed(Routes.getMovieDetailsRoute(), arguments: matchedItem.imdbId!);
    } else {
      console.log('No matching IMDb ID found for poster: $posterUrl');
    }
  }
}