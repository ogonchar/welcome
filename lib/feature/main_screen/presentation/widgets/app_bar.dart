import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/tour_type_button.dart';
import 'package:welcome/utils/constants.dart';

class MainScreenAppBar extends StatefulWidget {
  const MainScreenAppBar({
    super.key,
    required this.currentPage,
    required this.onPageChanged,
  });

  final int currentPage;
  final void Function(int) onPageChanged;

  @override
  State<MainScreenAppBar> createState() => _MainScreenAppBarState();
}

class _MainScreenAppBarState extends State<MainScreenAppBar> {
  final attToursKey = GlobalKey();
  final historicalToursKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  WColors.appBarGradientFirstColor,
                  WColors.appBarGradientSecondColor
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 166,
              child: Image.asset(
                Assets.palmImage,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 55,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                  child: Image.asset(
                    Assets.logo,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: SizedBox(
                height: 33,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  const SizedBox(width: 16),
                  TourTypeIndicator(
                    key: attToursKey,
                    title: 'All tours',
                    isSelected: widget.currentPage == 0,
                    onTap: () {
                      Scrollable.ensureVisible(
                        attToursKey.currentContext!,
                        duration: const Duration(milliseconds: 300),
                      );
                      widget.onPageChanged(0);
                    },
                  ),
                  TourTypeIndicator(
                    title: 'Sea',
                    isSelected: widget.currentPage == 1,
                    onTap: () {
                      widget.onPageChanged(1);
                    },
                  ),
                  TourTypeIndicator(
                    title: 'Nature',
                    isSelected: widget.currentPage == 2,
                    onTap: () {
                      widget.onPageChanged(2);
                    },
                  ),
                  TourTypeIndicator(
                    key: historicalToursKey,
                    title: 'Historical',
                    isSelected: widget.currentPage == 3,
                    onTap: () {
                      Scrollable.ensureVisible(
                        historicalToursKey.currentContext!,
                        duration: const Duration(milliseconds: 300),
                      );
                      widget.onPageChanged(3);
                    },
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
