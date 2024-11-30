import 'dart:developer';

import 'package:welcome/feature/main_screen/data/tour_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/feature/main_screen/domain/enums/tour_type.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';

part 'tours_list_bloc.freezed.dart';

@freezed
class TourListState with _$TourListState {
  const factory TourListState.loading() = TourListLoading;
  const factory TourListState.loadingMore({
    TourType? type,
    required List<TourModel> allTours,
    required List<TourModel> seaTours,
    required List<TourModel> natureTours,
    required List<TourModel> historicalTours,
  }) = TourListLoadingMore;
  const factory TourListState.loaded({
    required List<TourModel> allTours,
    required List<TourModel> seaTours,
    required List<TourModel> natureTours,
    required List<TourModel> historicalTours,
  }) = TourListLoaded;
  const factory TourListState.error(String error) = TourListError;
}

@freezed
class TourListEvent with _$TourListEvent {
  const factory TourListEvent.init() = _TourListEventInit;
  const factory TourListEvent.loadMore({required TourType type}) =
      _TourListEventLoadMore;
  const factory TourListEvent.loadMoreAll() = _TourListEventLoadMoreAll;
}

class TourListBloc extends Bloc<TourListEvent, TourListState> {
  final TourRepository tourRepository;

  int allTourPage = 0;
  int seaTourPage = 0;
  int natureTourPage = 0;
  int historicalTourPage = 0;

  TourListBloc({required this.tourRepository})
      : super(const TourListState.loading()) {
    on<_TourListEventInit>(_onInit);
    on<_TourListEventLoadMore>(_onLoadMore);
    on<_TourListEventLoadMoreAll>(_onLoadMoreAll);
  }

  void _onInit(_TourListEventInit event, Emitter<TourListState> emit) async {
    emit(const TourListState.loading());
    try {
      final results = await Future.wait([
        tourRepository.getToursByType(TourType.seaTour, 0),
        tourRepository.getToursByType(TourType.nature, 0),
        tourRepository.getToursByType(TourType.historical, 0),
      ]);
      final seaTours = results[0];
      final natureTours = results[1];
      final historicalTours = results[2];
      emit(TourListState.loaded(
        /// With the assumption that we do not want preoretize tours in list of all tours
        allTours: (seaTours + natureTours + historicalTours)..shuffle(),
        seaTours: seaTours,
        natureTours: natureTours,
        historicalTours: historicalTours,
      ));
    } catch (e) {
      log('error in TourListBloc $e');
      emit(TourListState.error(e.toString()));
    }
  }

  void _onLoadMore(
      _TourListEventLoadMore event, Emitter<TourListState> emit) async {
    final state = this.state;
    if (state is! TourListLoaded) {
      return;
    }
    emit(TourListState.loadingMore(
      type: TourType.seaTour,
      allTours: state.allTours,
      seaTours: state.seaTours,
      natureTours: state.natureTours,
      historicalTours: state.historicalTours,
    ));
    log('loaing more');

    try {
      final page = event.type == TourType.seaTour
          ? ++seaTourPage
          : event.type == TourType.nature
              ? ++natureTourPage
              : ++historicalTourPage;
      final tours = await tourRepository.getToursByType(event.type, page);

      emit(TourListState.loaded(
        allTours: state.allTours,
        seaTours: event.type == TourType.seaTour
            ? state.seaTours + tours
            : state.seaTours,
        natureTours: event.type == TourType.nature
            ? state.natureTours + tours
            : state.natureTours,
        historicalTours: event.type == TourType.historical
            ? state.historicalTours + tours
            : state.historicalTours,
      ));
    } catch (e) {
      log('error TourListBloc $e');

      emit(TourListState.error(e.toString()));
    }
  }

  void _onLoadMoreAll(
      _TourListEventLoadMoreAll event, Emitter<TourListState> emit) async {
    final state = this.state;
    log('loaing more all');
    if (state is! TourListLoaded) {
      return;
    }
    emit(TourListState.loadingMore(
      allTours: state.allTours,
      seaTours: state.seaTours,
      natureTours: state.natureTours,
      historicalTours: state.historicalTours,
    ));

    try {
      final results = await Future.wait([
        tourRepository.getToursByType(TourType.seaTour, allTourPage),
        tourRepository.getToursByType(TourType.nature, allTourPage),
        tourRepository.getToursByType(TourType.historical, allTourPage),
      ]);
      final seaTours = results[0];
      final natureTours = results[1];
      final historicalTours = results[2];

      emit(TourListState.loaded(
        /// With the assumption that we do not want preoretize tours in list of all tours
        allTours: state.allTours +
            ((seaTours + natureTours + historicalTours)..shuffle()),
        seaTours: state.seaTours,
        natureTours: state.natureTours,
        historicalTours: state.historicalTours,
      ));
    } catch (e) {
      log('error TourListBloc $e');

      emit(TourListState.error(e.toString()));
    }
  }
}
