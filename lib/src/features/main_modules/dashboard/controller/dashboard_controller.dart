import 'package:ifarmer/src/app_config/imports/import.dart';

class DashboardController extends BaseController{

  RxInt myIndex = 0.obs;
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>("Telugu");
  final FocusNode fieldFocusNode = FocusNode();

  List<Widget> screenList = [
    Container(color: AppColors.redColor),
    Container(color: AppColors.blackColor),
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
