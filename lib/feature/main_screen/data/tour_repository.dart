import 'dart:math' hide log;

import 'package:welcome/feature/main_screen/data/network_provider.dart';
import 'package:welcome/feature/main_screen/domain/enums/tour_type.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';

class TourRepository {
  /// due to test assignment I did not implement caching mechanism,
  /// and giving the randomize nature of the date it's practically makes no sense
  final List<String> images = [];
  final List<String> descriptions = [];

  Future<List<TourModel>> getToursByType(TourType type, int page) async {
    if (images.isEmpty || descriptions.isEmpty) {
      /// this should be DI but for the sake of the test assignment I will leave it like this
      final imagesAndDescriptions = await NetworkProvider().getListImages();
      images.addAll(imagesAndDescriptions.$1);
      descriptions.addAll(imagesAndDescriptions.$2);
    }

    return List.generate(
        10,
        (index) => TourModel(
              title: getRandomString(descriptions),
              description: getRandomString(descriptions),
              price: (Random().nextDouble() * 300).roundToDouble(),
              imageUrl: getRandomString(images),
              type: type,
            ));
  }

  String getRandomString(List<String> strings) {
    return strings[Random().nextInt(strings.length)];
  }
}
