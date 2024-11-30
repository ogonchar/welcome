import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:welcome/feature/main_screen/domain/enums/tour_type.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';
import 'package:welcome/utils/constants.dart';

class HorizontalScrollWidget extends StatefulWidget {
  const HorizontalScrollWidget({
    super.key,
    required this.tours,
  });

  final List<TourModel> tours;

  @override
  State<HorizontalScrollWidget> createState() => _HorizontalScrollWidgetState();
}

class _HorizontalScrollWidgetState extends State<HorizontalScrollWidget>
    with TickerProviderStateMixin {
  final PageController _pageViewController = PageController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tours.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 191,
          child: PageView(
            controller: _pageViewController,
            children: widget.tours
                .map((tour) => _HorizontalScrollWidgetItem(
                      text: tour.title,
                      color: tour.type == TourType.historical
                          ? WColors.historical
                          : tour.type == TourType.nature
                              ? WColors.nature
                              : WColors.seaTour,
                      imageUrl: tour.imageUrl,
                    ))
                .toList(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SmoothPageIndicator(
            controller: _pageViewController,
            count: widget.tours.length,
            effect: const ExpandingDotsEffect(
                dotHeight: 4,
                dotWidth: 4,
                dotColor: Color(0xFFE0E4EE),
                activeDotColor: WColors.grey),
            onDotClicked: (index) {
              _updateCurrentPageIndex(index);
            })
      ],
    );
  }
}

class _HorizontalScrollWidgetItem extends StatelessWidget {
  const _HorizontalScrollWidgetItem({
    required this.text,
    required this.color,
    required this.imageUrl,
  });

  final String text;
  final Color color;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.fitWidth,
            ),
          ),
          width: MediaQuery.of(context).size.width - 40,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), Colors.transparent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(29),
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'Get it now',
                  style: TextStyle(color: color),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HorizontalScrollWidgetLoading extends StatelessWidget {
  const HorizontalScrollWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.6),
          highlightColor: Colors.grey.withOpacity(0.1),
          child: Container(
            height: 191,
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.6),
          highlightColor: Colors.grey.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4,
                width: 14,
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 4,
                width: 4,
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 4,
                width: 4,
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 4,
                width: 4,
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
