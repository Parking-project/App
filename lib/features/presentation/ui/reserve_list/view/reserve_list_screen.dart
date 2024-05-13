import 'package:app/features/presentation/ui/reserve_list/reserve_list/reserve_list_cubit.dart';
import 'package:app/features/presentation/widget/reserve.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ReserveListScreen extends StatefulWidget {
  ReserveListScreen();

  @override
  State<ReserveListScreen> createState() => _ReserveListScreenState();
}

class _ReserveListScreenState extends State<ReserveListScreen> {
  final TextEditingController reserveStatus = TextEditingController(text: "2");

  final TextEditingController reservePage = TextEditingController(text: "1");

  Future refresh() async {
    setState(() {
      context.read<ReserveListCubit>().load(0, int.parse(reserveStatus.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Список бронирований",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          DropdownMenu(
            enableFilter: true,
            controller: reserveStatus,
            initialSelection: 2,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 1, label: "Удаленные"),
              DropdownMenuEntry(value: 2, label: "Отправленные"),
              DropdownMenuEntry(value: 3, label: "Одобренные"),
              // DropdownMenuEntry(value: 4, label: "Оплаченные"),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
            child: BlocBuilder<ReserveListCubit, ReserveListState>(
              builder: (context, state) {
                return switch (state) {
                  ReserveListInitial() => Builder(
                      builder: (context) {
                        context
                            .read<ReserveListCubit>()
                            .load(0, int.parse(reserveStatus.text));
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ReserveListLoading() => Builder(
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ReserveListSuccess() => Builder(
                      builder: (context) {
                        return ListView.builder(
                            itemCount: context.select<ReserveListCubit, int>(
                                (value) => value.getReserves.length),
                            itemBuilder: (context, index) {
                              context
                                  .read<ReserveListCubit>()
                                  .getReserves[index];
                              return ReserveCard(index: index);
                            });
                      },
                    ),
                  ReserveListException() || _ => Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            Text(
                              "Произошла ошибка",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            FilledButton(
                              onPressed: () {
                                context
                                    .read<ReserveListCubit>()
                                    .load(0, int.parse(reserveStatus.text));
                              },
                              child: Text(
                                "Обновить список",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
          // BlocBuilder<ReserveCubit, ReserveState>(
          //   builder: (context, state) {
          //     return switch (state) {
          //       ReserveInitial() || ReserveLoading() => Builder(
          //           builder: (context) {
          //             // context.read<ReserveCubit>().load(
          //             //     int.parse(reservePage.text),
          //             //     int.parse(reserveStatus.value.text));
          //             return const Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           },
          //         ),
          //       ReserveSuccess() => ListView.builder(
          //           itemCount: context.select<ReserveCubit, int>(
          //             (value) => value.getReserves.length,
          //           ),
          //           itemBuilder: (context, index) {
          //             context.read<ReserveCubit>().getReserves[index];
          //             return ReserveCard(
          //               index: index,
          //             );
          //           },
          //         ),
          //       ReserveException() || _ => Center(
          //           child: Column(
          //             children: [
          //               Text(
          //                 "Произошла ошибка!",
          //                 style: Theme.of(context).textTheme.titleMedium,
          //               ),
          //               FilledButton(
          //                 onPressed: () {
          //                   context.read<ReserveCubit>().load(
          //                       int.parse(reservePage.text),
          //                       int.parse(reserveStatus.value.text));
          //                 },
          //                 child: Text(
          //                   "Авторизоваться",
          //                   style: Theme.of(context).textTheme.titleMedium,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //     };
          //   },
          // ),
