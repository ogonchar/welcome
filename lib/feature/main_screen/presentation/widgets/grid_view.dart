import 'package:flutter/material.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/grid_view_item.dart';

class MainScreenGridView extends StatelessWidget {
  const MainScreenGridView({super.key, required this.tours});

  final List<TourModel> tours;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tours.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final tour = tours[index];
          return GridViewItem(tour: tour);
        });
  }
}
