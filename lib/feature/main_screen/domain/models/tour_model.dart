import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:welcome/feature/main_screen/domain/enums/tour_type.dart';

part 'tour_model.freezed.dart';
part 'tour_model.g.dart';

@freezed
class TourModel with _$TourModel {
  const factory TourModel({
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required TourType type,
  }) = _TourModel;

  factory TourModel.fromJson(Map<String, Object?> json) =>
      _$TourModelFromJson(json);
}
