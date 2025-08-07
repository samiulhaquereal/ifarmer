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
    return Obx(()=> Column(
      mainAxisAlignment: controller.ignore.isFalse ? startMAA : startMAA,
        children: [
          Carousel(imagePaths: controller.posterPaths.value,onPosterTap: (posterUrl) => controller.onTapItem(
              posterUrl: posterUrl,
              source: controller.posterResult
          )),
          RetCore.space(10.h),
          _buildLatestMovies(
            imageUrls: controller.latestMoviePosterPaths.value,
          ),
        ],
      ),
    );
  }

  Widget _buildLatestMovies({required List<String> imageUrls}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            'Latest movies',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        RetCore.space(10.h),
        SizedBox(
          height: MediaQuery.of(controller.buildContext!).size.height * 0.3, // adjust for poster height
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: imageUrls.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => controller.onTapItem(posterUrl: imageUrls[index],source: controller.latestMovieResult),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(Icons.broken_image, color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


