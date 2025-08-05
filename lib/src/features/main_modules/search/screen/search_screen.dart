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
        _buildSearchBar(),
        Expanded(
          child: Obx(() {
            final data = controller.searchResult.value;

            if (data == null || data.search == null || data.search!.isEmpty) {
              return Center(child: Text("No Results", style: TextStyle(color: Colors.white)));
            }

            return ListView.builder(
              itemCount: data.search!.length,
              itemBuilder: (context, index) {
                final movie = data.search![index];

                return ListTile(
                  leading: Image.network(movie.poster ?? '', width: 50, fit: BoxFit.cover),
                  title: Text(movie.title ?? '', style: TextStyle(color: Colors.white)),
                  subtitle: Text('${movie.year} - ${movie.type.toString().split('.').last}',
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              },
            );
          }),
        )
        /*Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
              itemCount: trendingMovies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 12,
                childAspectRatio: 16 / 10,
              ),
              itemBuilder: (context, index) {
                final item = trendingMovies[index];
                return _buildTrendingCard(item);
              },
            ),
          ),
        )*/
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 42.h,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.white70, size: 20.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: TextField(
                  onChanged: (value) => controller.onSearchTextChanged(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search Title, Movie or Cast',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  Widget _buildTrendingCard(Map<String, dynamic> item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(item["image"], fit: BoxFit.cover),
              ),
            ),
            if (item["premium"] == true)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text("Premium", style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
            if (item["aTag"] == true)
              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text("A", style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          item["title"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 13),
        )
      ],
    );
  }

}
