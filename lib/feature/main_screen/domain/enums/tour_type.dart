import 'package:flutter/material.dart';
import 'package:welcome/utils/constants.dart';

enum TourType {
  seaTour,
  nature,
  historical;

  String get getName => switch (this) {
        TourType.seaTour => 'Sea tour',
        TourType.nature => 'Nature',
        TourType.historical => 'Historical'
      };

  Color get getColor => switch (this) {
        TourType.seaTour => WColors.seaTour,
        TourType.nature => WColors.nature,
        TourType.historical => WColors.historical
      };
}
