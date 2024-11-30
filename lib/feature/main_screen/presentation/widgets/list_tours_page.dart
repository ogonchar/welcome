import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/feature/main_screen/domain/enums/tour_type.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';
import 'package:welcome/feature/main_screen/presentation/bloc/tours_list_bloc.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/horizontal_scroll_widget.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/list_view_item.dart';

class MainScreenListTours extends StatefulWidget {
  const MainScreenListTours({super.key, required this.tourType});

  final TourType tourType;

  @override
  State<MainScreenListTours> createState() => _MainScreenListToursState();
}

class _MainScreenListToursState extends State<MainScreenListTours> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent * 0.9) {
        context
            .read<TourListBloc>()
            .add(TourListEvent.loadMore(type: widget.tourType));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourListBloc, TourListState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => const _ErrorWidget(text: 'Error'),
          error: (state) => _ErrorWidget(text: state.error),
          loading: (state) => const _ToursLoading(),
          loadingMore: (state) {
            final tours = widget.tourType == TourType.historical
                ? state.historicalTours
                : widget.tourType == TourType.nature
                    ? state.natureTours
                    : state.seaTours;
            return _ListTours(
              scrollController: _scrollController,
              tours: tours,
              loading: true,
            );
          },
          loaded: (state) {
            final tours = widget.tourType == TourType.historical
                ? state.historicalTours
                : widget.tourType == TourType.nature
                    ? state.natureTours
                    : state.seaTours;
            return _ListTours(
              scrollController: _scrollController,
              tours: tours,
            );
          },
        );
      },
    );
  }
}

class _ListTours extends StatelessWidget {
  const _ListTours({
    required this.scrollController,
    required this.tours,
    this.loading = false,
  });

  final ScrollController scrollController;
  final List<TourModel> tours;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.read<TourListBloc>().add(const TourListEvent.init());
        return Future<void>.value();
      },
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.only(top: 20),
        itemCount: tours.length + (loading ? 2 : 1),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _HorizontalScroll(
                tours: tours.take(tours.length > 3 ? 4 : 0).toList());
          }
          if (index == tours.length + 1) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final tour = tours[index - 1];
          return ListViewItem(tour: tour);
        },
      ),
    );
  }
}

class _HorizontalScroll extends StatelessWidget {
  const _HorizontalScroll({required this.tours});

  final List<TourModel> tours;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalScrollWidget(
          tours: tours,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class _ToursLoading extends StatelessWidget {
  const _ToursLoading();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: const [
        HorizontalScrollWidgetLoading(),
        SizedBox(
          height: 20,
        ),
        ListViewItemLoading(),
        ListViewItemLoading(),
        ListViewItemLoading(),
        ListViewItemLoading(),
      ],
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
