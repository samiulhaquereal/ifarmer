import 'dart:async';

import 'package:ifarmer/src/app_config/imports/import.dart';

class Carousel extends StatefulWidget {

  Carousel ({
    super.key,
    required this.imagePaths,
    this.onPosterTap,
    this.padding = 0,
    this.radius  = 0,
    this.durationSeconds = 3,
    this.activeColor = Colors.deepOrangeAccent,
    this.inactiveColor  = Colors.grey,
    this.curve = Curves.easeInOut,
  });

  List<String> imagePaths;
  double? padding ;
  double? radius;
  int? durationSeconds ;
  Color? activeColor ;
  Color? inactiveColor;
  Curve? curve;
  final void Function(String posterUrl)? onPosterTap;

  @override
  State<Carousel> createState() => _Carousel();
}

class _Carousel extends State<Carousel> {
  int _activePage = 0;
  late PageController _pageController;
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _activePage,viewportFraction: 0.55,);

    _timer = Timer.periodic(Duration(seconds: widget.durationSeconds!), (Timer timer) {
      if (_activePage < widget.imagePaths.length - 1) {
        _activePage++;
      } else {
        _activePage = 0;
      }

      _pageController.animateToPage(
        _activePage,
        duration: const Duration(milliseconds: 300),
        curve: widget.curve!,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double posterHeight = MediaQuery.of(context).size.height * 0.35;
    return Padding(
      padding: EdgeInsets.all(widget.padding!),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius!),
                child: SizedBox(
                  height: posterHeight,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.imagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _activePage = index;
                      });
                    },
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          if (widget.onPosterTap != null) {
                            widget.onPosterTap!(widget.imagePaths[index]);
                          }
                        },
                        child: AnimatedScale(
                            scale: index == _activePage ? 1.0 : 0.9,
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(widget.radius!),
                                  child: AspectRatio(
                                    aspectRatio: 2 / 3,
                                    child: PlaceHolder(imagePath: widget.imagePaths[index]),
                                  ),
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.imagePaths.length,
                          (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: widget.curve!,
                            );
                          },
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: _activePage == index ? widget.activeColor : widget.inactiveColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    bool isUrl = imagePath.startsWith('http://') || imagePath.startsWith('https://');
    return isUrl
        ? Image.network(
      imagePath,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Row(
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 5,),
            Text('Failed to load image'),
          ],
        ));
      },
    )
        : Image.asset(
      imagePath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Row(
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 5,),
            Text('Failed to load image'),
          ],
        ));
      },
    );
  }
}