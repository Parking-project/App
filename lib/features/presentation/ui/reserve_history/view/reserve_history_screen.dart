import 'dart:async';

import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/presentation/ui/reserve_history/reserve_history/reserve_history_cubit.dart';
import 'package:app/features/presentation/widget/reserve.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ReserveHistoryScreen extends StatelessWidget {
  final scrollController = ScrollController();

  final TextEditingController dropDownMenuController = TextEditingController();

  ReserveHistoryScreen({super.key});

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ReserveHistoryCubit>(context).getReserve();
        }
      }
    });
  }

  void _scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _scrollUp() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.5,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "История бронирований",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: _reservesList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "scrollUp",
            onPressed: () => _scrollUp(),
            child: const Icon(Icons.arrow_upward),
          ),
          FloatingActionButton(
            heroTag: "updateData",
            onPressed: () {
              context.read<ReserveHistoryCubit>().setReserveState(2);
            },
            child: const Icon(Icons.loop),
          ),
          FloatingActionButton(
            heroTag: "scrollDown",
            onPressed: () {
              context.read<ReserveHistoryCubit>().getReserve();
              _scrollDown();
            },
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }

  Widget _reservesList() {
    return BlocBuilder<ReserveHistoryCubit, ReserveHistoryState>(
      builder: (context, state) {
        if (state is ReserveHistoryLoading && state.isFirstFetch) {
          return _loadingIndicator();
        }

        List<ReserveEntity> reserves = [];
        bool isLoading = false;

        if (state is ReserveHistoryLoading) {
          reserves = state.oldReserves;
          isLoading = true;
        } else if (state is ReserveHistoryLoaded) {
          reserves = state.reserves;
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 200),
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < reserves.length) {
              return _reserves(reserves[index], index, context);
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });

              return _loadingIndicator();
            }
          },
          itemCount: reserves.length + (isLoading ? 1 : 0),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _reserves(ReserveEntity reserve, index, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: ReserveCard(
        reserve: reserve,
        child: Text(
            reserve.state,
            style: Theme.of(context).textTheme.titleMedium,
          ),
      ),
    );
  }
}
