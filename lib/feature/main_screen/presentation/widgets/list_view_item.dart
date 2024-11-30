import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';
import 'package:welcome/utils/constants.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.tour,
    this.smallerItem = false,
  });

  final TourModel tour;
  final bool smallerItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: smallerItem ? 119 : 133,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: tour.imageUrl,
              width: 113,
              height: smallerItem ? 99 : 133,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tour.title,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              tour.description,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ]),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: tour.type.getColor,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        tour.type.getName,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: tour.type.getColor,
                        ),
                      ),
                    ),
                  ],
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
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewItemLoading extends StatelessWidget {
  const ListViewItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.6),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: Container(
          height: 133,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
