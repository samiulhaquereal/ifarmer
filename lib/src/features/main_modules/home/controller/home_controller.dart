import 'package:ifarmer/src/app_config/imports/import.dart';

class HomeController extends BaseController{

  @override
  void onInit() {
    super.onInit();
    _getMoviePoster();
  }



  Future<void> _getMoviePoster() async {
    try {
      Map<String, dynamic>? response = await apiServices.getSearch(name: 'Iron Man', page: 1);
      console.log(response);
      if (response?['records'] != null && response?['records']['Response'] == 'True'){
        console.log(response);
      }
    } catch (e) {
      console.log('Error fetching LC List: $e');
    }
  }

}
