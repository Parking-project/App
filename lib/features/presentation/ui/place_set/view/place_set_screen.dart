import 'dart:async';

import 'package:app/features/domain/entity/place_api_entity.dart';
import 'package:app/features/presentation/ui/place_set/bloc/place_set/place_set_cubit.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list/reserve_list_cubit.dart';
import 'package:app/features/presentation/widget/place.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PlaceSetScreen extends StatelessWidget {
  PlaceSetScreen({super.key, required this.reserveID});

  final String reserveID;

  final scrollController = ScrollController();

  final TextEditingController dropDownMenuController = TextEditingController();


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
              "Свободные места",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: _placesList(),
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
              context.read<PlaceSetCubit>().setReserveState(reserveID);
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

  Widget _placesList() {
    return BlocBuilder<PlaceSetCubit, PlaceSetState>(
      builder: (context, state) {
        if (state is PlaceSetLoading && state.isFirstFetch) {
          return _loadingIndicator();
        }

        List<PlaceEntity> places = [];
        bool isLoading = false;

        if (state is PlaceSetLoading) {
          places = state.oldPlaces;
          isLoading = true;
        } else if (state is PlaceSetLoaded) {
          places = state.places;
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 200),
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < places.length) {
              return _places(places[index], index, context);
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });

              return _loadingIndicator();
            }
          },
          itemCount: places.length + (isLoading ? 1 : 0),
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

  Widget _places(PlaceEntity place, index, BuildContext context) {
    final reserveAction = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(""),
          FilledButton(
            onPressed: () {
              context.read<ReserveListCubit>().setPlace(
                reserveID, place.placeCode
              );
              context.router.removeLast();
            },
            child: Text(
              "Выбрать",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      );

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: PlaceCard(
        place: place,
        child: reserveAction,
      ),
    );
  }
}