import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildSearchItem({
  required Search movie,
  required SearchItemController controller
}) {
  return InkWell(
    onTap: () => controller.onTapItem(imdbID: movie.imdbId ?? ''),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              movie.poster ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.grayColor,
                alignment: Alignment.center,
                child: Icon(Icons.broken_image, color: AppColors.whiteColor,size: 20.sp),
              ),
            ),
          ),
        ),
        RetCore.space(8.h),
        Text(
          movie.title ?? '',
          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold,fontSize: 13.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text('${movie.year} - ${movie.type.toString().split('.').last}',
            style: TextStyle(color: AppColors.white70Color,fontSize: 12.sp)
        ),

      ],
    ),
  );
}