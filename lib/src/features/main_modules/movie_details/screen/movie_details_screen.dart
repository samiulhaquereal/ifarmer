import 'package:ifarmer/src/app_config/imports/import.dart';


class MovieDetailsScreen extends BaseView<MovieDetailsController> {
  MovieDetailsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(()=>Column(
          children: [
            _buildHeaderImage(controller.movieDetails.value?.poster),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTags(controller.movieDetails.value),
                  SizedBox(height: 8),
                  Text(controller.movieDetails.value?.title ?? '',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.whiteColor)),
                  SizedBox(height: 4),
                  Text(
                    '${controller.movieDetails.value?.year ?? ''} • ${controller.movieDetails.value?.genre ?? ''}',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 12),
                  Text(
                    controller.movieDetails.value?.plot ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      _buildButton("Play Trailer", icon: Icons.play_arrow),
                      SizedBox(width: 12),
                      _buildButton("Subscribe Now",
                          backgroundColor: AppColors.orangeColor),
                      SizedBox(width: 12),
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.white70),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _buildTabBar(controller.movieDetails.value),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage(String? url) {
    return Stack(
      children: [
        Container(
          width: Get.width.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: url != null && url != "N/A"
                ? Image.network(url, fit: BoxFit.fitWidth)
                : Container(color: Colors.grey[800]),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: BackButton(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTags(MovieDetailsModel? movie) {
    final ratingValue = movie?.ratings != null && movie!.ratings!.isNotEmpty
        ? movie.ratings!.first.value
        : '-';
    return Row(
      children: [
        _tag("Premium", background: Colors.orange),
        SizedBox(width: 8),
        _tag(movie?.rated ?? '', background: Colors.white24),
        Spacer(),
        _tag("⭐ $ratingValue", background: Colors.white24),
      ],
    );
  }

  Widget _tag(String text, {Color background = AppColors.orangeColor}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text,
          style: TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildButton(String label,
      {Color backgroundColor = Colors.transparent, IconData? icon}) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: icon != null ? Icon(icon, size: 18) : SizedBox.shrink(),
        label: Text(label, style: TextStyle(fontSize: 14)),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildTabBar(MovieDetailsModel? movie) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: "Cast"),
              Tab(text: "Details"),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                _buildCastTab(movie),
                _buildDetailsTab(movie),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(MovieDetailsModel? movie) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailRow("Director", movie?.director),
          _detailRow("Studio", movie?.production),
          _detailRow("Released", movie?.released),
          _detailRow("Genre", movie?.genre),
          _detailRow("Language", movie?.language),
        ],
      ),
    );
  }

  Widget _buildCastTab(MovieDetailsModel? movie) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailRow("Cast", movie?.actors),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text(label, style: TextStyle(color: Colors.white54))),
          Expanded(
              child: Text(value ?? "-", style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }

}
