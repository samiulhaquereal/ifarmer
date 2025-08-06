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

            return GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.all(12),
                itemCount: data.search!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final movie = data.search![index];
                  return InkWell(
                    onTap: () => controller.onTapItem(imdbID: movie.imdbId ?? ''),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              movie.poster ?? '',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey,
                                alignment: Alignment.center,
                                child: Icon(Icons.broken_image, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movie.title ?? '',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('${movie.year} - ${movie.type.toString().split('.').last}',
                            style: TextStyle(color: Colors.white70,fontSize: 12.sp)
                        ),

                      ],
                    ),
                  );
                },
              )
            ;
          }),
        )
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

}
