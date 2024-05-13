import 'dart:async';

import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list/reserve_list_cubit.dart';
import 'package:app/features/presentation/widget/reserve.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ReserveListScreen extends StatelessWidget {
  final scrollController = ScrollController();

  TextEditingController dropDownMenuController = TextEditingController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ReserveListCubit>(context).getReserve();
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
              "Бронирования",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            DropdownMenu(
              onSelected: (value) {
                final cubit = context.read<ReserveListCubit>();
                cubit.setReserveState(value ?? 2);
                cubit.getReserve();
              },
              textStyle: Theme.of(context).textTheme.titleSmall,
              initialSelection: 2,
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: "Удаленные"),
                DropdownMenuEntry(value: 2, label: "Отправленные"),
                DropdownMenuEntry(value: 3, label: "Одобренные"),
                DropdownMenuEntry(value: 4, label: "Оплаченные")
              ],
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
              context.read<ReserveListCubit>().setReserveState(2);
            },
            child: const Icon(Icons.loop),
          ),
          FloatingActionButton(
            heroTag: "scrollDown",
            onPressed: () {
              context.read<ReserveListCubit>().getReserve();
              _scrollDown();
            },
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }

  Widget _reservesList() {
    return BlocBuilder<ReserveListCubit, ReserveListState>(
      builder: (context, state) {
        if (state is ReserveListLoading && state.isFirstFetch) {
          return _loadingIndicator();
        }

        List<ReserveEntity> reserves = [];
        bool isLoading = false;

        if (state is ReserveListLoading) {
          reserves = state.oldReserves;
          isLoading = true;
        } else if (state is ReserveListLoaded) {
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
        child: FilledButton(
          onPressed: () {
            context.router.push(ReserveRoute(index: index));
          },
          child: Text(
            ">>",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
