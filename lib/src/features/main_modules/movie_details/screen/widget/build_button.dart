import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildButton(String label,
    {Color backgroundColor = Colors.transparent, IconData? icon,void Function()? onPressed}) {
  return Expanded(
    child: ElevatedButton.icon(
      icon: icon != null ? Icon(icon, size: 18.sp) : SizedBox.shrink(),
      label: Text(label, style: TextStyle(fontSize: 13.sp)),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),
  );
}