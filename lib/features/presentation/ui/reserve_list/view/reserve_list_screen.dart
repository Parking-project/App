import 'dart:async';

import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list/reserve_list_cubit.dart';
import 'package:app/features/presentation/widget/reserve.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ReserveListScreen extends StatelessWidget {
  final scrollController = ScrollController();

  final TextEditingController dropDownMenuController = TextEditingController();

  ReserveListScreen();

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
            heroTag: "add",
            onPressed: () {
              context.router.push(const ReserveAddRoute());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "scrollUp",
            onPressed: () => _scrollUp(),
            child: const Icon(Icons.arrow_upward),
          ),
          FloatingActionButton(
            heroTag: "updateData",
            onPressed: () {
              context.read<ReserveListCubit>().setReserveState(null);
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
    Widget? reserveAction;
    switch (reserve.state) {
      case "Отправлена":
        {
          reserveAction = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(""),
              FilledButton(
                onPressed: () {
                  context.read<ReserveListCubit>().deleteReserve(index);
                },
                child: Text(
                  "Удалить",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          );
        }

      case "Одобрена":
        {
          reserveAction = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: () {
                  // context.router.push(PlaceSetRoute(index: index));
                  context.router.push(PlaceSetRoute(reserveID: reserve.ID));
                },
                child: Text(
                  "Парковочные места",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              FilledButton(
                onPressed: () {
                  context.read<ReserveListCubit>().deleteReserve(index);
                },
                child: Text(
                  "Удалить",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          );
        }
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: ReserveCard(
        reserve: reserve,
        child: reserveAction,
      ),
    );
  }
}
