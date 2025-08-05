import 'package:ifarmer/src/app_config/imports/import.dart';
import 'package:ifarmer/src/features/main_modules/search/screen/search_screen.dart';

class DashboardController extends BaseController{

  RxInt myIndex = 0.obs;
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>("Telugu");
  final FocusNode fieldFocusNode = FocusNode();

  List<Widget> screenList = [
    HomeScreen(),
    SearchScreen(),
    Container(color: AppColors.whiteColor),
  ];

  Future<bool> showAppExitModal() async {
    final shouldPop = await RetCore.dialogBox(
        title: AppStrings.exit,
        content: AppStrings.exitMessage,
        mode: RetCoreDialogBoxMode.confirm,
        style: RetCoreDialogBoxStyle.confirm
    );
    return shouldPop ?? false;
  }

  void onTapNavigationBar(int index)async{
    myIndex.value = index;
  }

}
