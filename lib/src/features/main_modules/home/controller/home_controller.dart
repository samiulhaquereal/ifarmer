import 'package:ifarmer/src/app_config/imports/import.dart';

class HomeController extends BaseController{

  RxInt currentPage = 1.obs;
  RxBool ignore = false.obs;
  Rx<SearchModel?> posterResult = Rx<SearchModel?>(null);
  Rx<SearchModel?> latestMovieResult = Rx<SearchModel?>(null);
  RxList<String> posterPaths = <String>[].obs;
  RxList<String> latestMoviePosterPaths = <String>[].obs;

  var isLoadingMore = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getMoviePoster();
    getLatestMoviePoster();
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

  Future<void> getLatestMoviePoster({bool loadMore = false}) async {
    try {
      if (loadMore) {
        isLoadingMore.value = true;
        currentPage.value++;
      } else {
        currentPage.value = 1;
        latestMoviePosterPaths.clear();
      }

      final page = currentPage.value;
      Map<String, dynamic>? response = await apiServices.getSearch(
        name: 'Batman',
        page: page,
        year: '2022',
      );

      if (response?['records'] != null && response?['records']['Response'] == 'True') {
        final jsonString = jsonEncode(response?['records']);
        latestMovieResult.value = searchModelFromJson(jsonString);

        final posters = latestMovieResult.value?.search
            ?.map((e) => e.poster ?? '')
            .where((url) => url.isNotEmpty)
            .toList() ??
            [];

        latestMoviePosterPaths.addAll(posters);
      }
    } catch (e) {
      console.log('Error fetching List: $e');
    } finally {
      isLoadingMore.value = false;
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