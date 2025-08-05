import 'package:ifarmer/src/app_config/imports/import.dart';

class DashboardScreen extends BaseView<DashboardController> {
  DashboardScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return buildAppBar(controller: controller);
  }

  @override
  Future<bool> onWillPop() async {
    return controller.showAppExitModal();
  }

  @override
  Widget? bottomNavigationBar() {
    return buildNavigationBar(controller: controller);
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      child: Obx(() => IndexedStack(
        index: controller.myIndex.value,
        children: controller.screenList,
      ),
      ),
    );
  }

}
