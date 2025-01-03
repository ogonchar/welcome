// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TourModel _$TourModelFromJson(Map<String, dynamic> json) {
  return _TourModel.fromJson(json);
}

/// @nodoc
mixin _$TourModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  TourType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TourModelCopyWith<TourModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourModelCopyWith<$Res> {
  factory $TourModelCopyWith(TourModel value, $Res Function(TourModel) then) =
      _$TourModelCopyWithImpl<$Res, TourModel>;
  @useResult
  $Res call(
      {String title,
      String description,
      double price,
      String imageUrl,
      TourType type});
}

/// @nodoc
class _$TourModelCopyWithImpl<$Res, $Val extends TourModel>
    implements $TourModelCopyWith<$Res> {
  _$TourModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TourType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TourModelImplCopyWith<$Res>
    implements $TourModelCopyWith<$Res> {
  factory _$$TourModelImplCopyWith(
          _$TourModelImpl value, $Res Function(_$TourModelImpl) then) =
      __$$TourModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      double price,
      String imageUrl,
      TourType type});
}

/// @nodoc
class __$$TourModelImplCopyWithImpl<$Res>
    extends _$TourModelCopyWithImpl<$Res, _$TourModelImpl>
    implements _$$TourModelImplCopyWith<$Res> {
  __$$TourModelImplCopyWithImpl(
      _$TourModelImpl _value, $Res Function(_$TourModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? type = null,
  }) {
    return _then(_$TourModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TourType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TourModelImpl implements _TourModel {
  const _$TourModelImpl(
      {required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.type});

  factory _$TourModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourModelImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final double price;
  @override
  final String imageUrl;
  @override
  final TourType type;

  @override
  String toString() {
    return 'TourModel(title: $title, description: $description, price: $price, imageUrl: $imageUrl, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, price, imageUrl, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TourModelImplCopyWith<_$TourModelImpl> get copyWith =>
      __$$TourModelImplCopyWithImpl<_$TourModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TourModelImplToJson(
      this,
    );
  }
}

abstract class _TourModel implements TourModel {
  const factory _TourModel(
      {required final String title,
      required final String description,
      required final double price,
      required final String imageUrl,
      required final TourType type}) = _$TourModelImpl;

  factory _TourModel.fromJson(Map<String, dynamic> json) =
      _$TourModelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  double get price;
  @override
  String get imageUrl;
  @override
  TourType get type;
  @override
  @JsonKey(ignore: true)
  _$$TourModelImplCopyWith<_$TourModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
