import 'package:ifarmer/src/app_config/imports/import.dart';

class MovieDetailsController extends BaseController{

  Rx<MovieDetailsModel?> movieDetails = Rx<MovieDetailsModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getMovieDetails();
  }

  Future<void> getMovieDetails() async{
    try {
      await dataFetcher(()async{
        var response = await apiServices.getDetails(imdbID: Get.arguments);
        if (response?['records'] != null && response?['records']['Response'] == 'True') {
          final jsonString = jsonEncode(response?['records']);
          movieDetails.value = movieDetailsModelFromJson(jsonString);
        } else {
          movieDetails.value = null;
        }
      });
    } catch (e) {
      console.log('Error Lc Details : $e');
    }
  }

}
