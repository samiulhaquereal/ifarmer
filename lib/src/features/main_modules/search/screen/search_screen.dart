import 'package:ifarmer/src/app_config/imports/import.dart';

class SearchScreen extends BaseView<SearchItemController> {
  SearchScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        buildSearchBar(controller: controller),
        buildSearchList(controller: controller)
      ],
    );
  }
}