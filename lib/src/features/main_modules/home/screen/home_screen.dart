import 'package:ifarmer/src/app_config/imports/import.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.backgroundColor;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        RetCoreCarousel(imagePaths: [])
      ],
    );
  }

}
