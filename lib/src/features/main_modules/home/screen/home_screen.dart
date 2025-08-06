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
          Carousel(imagePaths: controller.posterPaths.value),
          RetCore.space(10.h),
          _buildLatestMovies(
            imageUrls: [
              "https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg",
              "https://m.media-amazon.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX300.jpg",
              "https://m.media-amazon.com/images/M/MV5BYWYyOGQzOGYtMGQ1My00ZWYxLTgzZjktZWYzN2IwYjkxYzM0XkEyXkFqcGc@._V1_SX300.jpg",
              "https://m.media-amazon.com/images/M/MV5BNDc4YWYzNzEtNWMwMC00Y2ZlLWEzZWEtZDcwYjcwYTE3Y2ZlXkEyXkFqcGc@._V1_SX300.jpg"
            ],
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
              return ClipRRect(
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
              );
            },
          ),
        ),
      ],
    );
  }
}


