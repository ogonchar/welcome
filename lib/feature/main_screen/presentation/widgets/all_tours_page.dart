import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/feature/main_screen/domain/models/tour_model.dart';
import 'package:welcome/feature/main_screen/presentation/bloc/tours_list_bloc.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/grid_view.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/grid_view_background.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/horizontal_scroll_widget.dart';
import 'package:welcome/feature/main_screen/presentation/widgets/list_view_item.dart';

class MainScreenAllToursPage extends StatelessWidget {
  const MainScreenAllToursPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourListBloc, TourListState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => const _ErrorWidget(text: 'Error'),
          error: (state) => _ErrorWidget(text: state.error),
          loading: (state) => const _AllToursLoading(),
          loaded: (state) => _ListTours(tours: state.allTours),
          loadingMore: (value) =>
              _ListTours(tours: value.allTours, loadingMore: true),
        );
      },
    );
  }
}

class _ListTours extends StatefulWidget {
  const _ListTours({required this.tours, this.loadingMore = false});

  final List<TourModel> tours;
  final bool loadingMore;

  @override
  State<_ListTours> createState() => _ListToursState();
}

class _ListToursState extends State<_ListTours> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent * 0.9) {
        context.read<TourListBloc>().add(const TourListEvent.loadMoreAll());
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
    return RefreshIndicator(
      onRefresh: () {
        context.read<TourListBloc>().add(const TourListEvent.init());
        return Future<void>.value();
      },
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 20),
        children: [
          HorizontalScrollWidget(
            tours: widget.tours.take(widget.tours.length > 3 ? 4 : 0).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          ListViewItem(
            smallerItem: true,
            tour: widget.tours[0],
          ),
          Stack(
            children: [
              const GridViewBackground(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nearby Tours 🔥',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MainScreenGridView(
                      tours: widget.tours,
                    ),
                    if (widget.loadingMore) ...[
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _AllToursLoading extends StatelessWidget {
  const _AllToursLoading();

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
        SizedBox(
          height: 20,
        ),
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
