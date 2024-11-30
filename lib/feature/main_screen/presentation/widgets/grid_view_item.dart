import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';
import 'package:welcome/utils/constants.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.tour});

  final TourModel tour;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: CachedNetworkImageProvider(tour.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          Text(
            tour.title,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            tour.description,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 33,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: WColors.yellow,
              ),
              alignment: Alignment.center,
              child: Text(
                '\$${tour.price}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: WColors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
