import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/feature/main_screen/data/tour_repository.dart';
import 'package:welcome/feature/main_screen/domain/enums/tour_type.dart';
import 'package:welcome/feature/main_screen/presentation/bloc/tours_list_bloc.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/app_bar.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/all_tours_page.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/list_tours_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageViewController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainScreenAppBar(
            currentPage: _currentPageIndex,
            onPageChanged: _updateCurrentPageIndex,
          ),
          BlocProvider(
            /// TourRepository should be from DI but for the sake of the test assignment I will leave it like this
            create: (context) => TourListBloc(tourRepository: TourRepository())
              ..add(const TourListEvent.init()),
            child: Expanded(
              child: PageView(
                controller: _pageViewController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  MainScreenAllToursPage(),
                  MainScreenListTours(
                    tourType: TourType.seaTour,
                  ),
                  MainScreenListTours(
                    tourType: TourType.nature,
                  ),
                  MainScreenListTours(
                    tourType: TourType.historical,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
