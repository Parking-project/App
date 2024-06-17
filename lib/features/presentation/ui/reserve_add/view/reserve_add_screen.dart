import 'package:app/features/presentation/ui/reserve_add/bloc/reserve_add/reserve_add_cubit.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list/reserve_list_cubit.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

@RoutePage()
class ReserveAddScreen extends StatelessWidget {
  final scrollController = ScrollController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController begin = TextEditingController();
  final TextEditingController end = TextEditingController();

  ReserveAddScreen();

  Column getButtonState(BuildContext context, String message, bool isButton) {
    if (isButton) {
      return Column(
        children: [
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final beginTimestamp = DateTime.parse(begin.text).microsecondsSinceEpoch;
                final endTimestamp = DateTime.parse(end.text).microsecondsSinceEpoch;
                
                if(beginTimestamp >= endTimestamp){
                  return;
                }

                context
                    .read<ReserveAddCubit>()
                    .addReserve((beginTimestamp/1000000).round(), (endTimestamp/1000000).round());
              }
            },
            child: Text(
              "Добавить",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Окно создания бронирования",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
            child: Form(
              key: _formKey,
              child: BlocBuilder<ReserveAddCubit, ReserveAddState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 95,
                        child: TextFormField(
                          enabled: state is ReserveAddInitial ||
                              state is ReserveAddException,
                          controller: begin,
                          decoration: const InputDecoration(
                            labelText: "Дата и время начала бронирования",
                            hintText:
                                "Введите дату и время начала бронирования",
                            prefixIcon: Icon(Icons.calendar_today_rounded),
                          ),
                          style: Theme.of(context).textTheme.titleMedium,
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Введите дату и время начала бронирования'
                                : null;
                          },
                          onTap: () async {
                            DatePicker.showDatePicker(
                              context,
                              dateFormat: 'dd.MM.yyyy HH:mm:ss',
                              initialDateTime: DateTime.now(),
                              minDateTime: DateTime.now(),
                              maxDateTime: DateTime(3000),
                              onMonthChangeStartWithFirstDate: true,
                              onConfirm: (dateTime, List<int> index) {
                                begin.text = DateFormat("yyyy-MM-dd HH:mm:ss")
                                    .format(dateTime);
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 95,
                        child: TextFormField(
                          enabled: state is ReserveAddInitial ||
                              state is ReserveAddException,
                          controller: end,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            labelText: "Дата и время конца бронирования",
                            hintText: "Введите дату и время конца бронирования",
                            prefixIcon: Icon(Icons.password),
                          ),
                          style: Theme.of(context).textTheme.titleMedium,
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Введите дату и время конца бронирования'
                                : null;
                          },
                          onTap: () async {
                            DatePicker.showDatePicker(
                              context,
                              dateFormat: 'dd.MM.yyyy HH:mm:ss',
                              initialDateTime: DateTime.now(),
                              minDateTime: DateTime.now(),
                              maxDateTime: DateTime(3000),
                              onMonthChangeStartWithFirstDate: true,
                              onConfirm: (dateTime, List<int> index) {
                                end.text = DateFormat("yyyy-MM-dd HH:mm:ss")
                                    .format(dateTime);
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: switch (state) {
                          ReserveAddInitial() => Builder(
                              builder: (context) {
                                return getButtonState(context, "", true);
                              },
                            ),
                          ReserveAddLoading() => Builder(
                              builder: (context) {
                                return getButtonState(context, "", false);
                              },
                            ),
                          ReserveAddSuccess() => Builder(
                              builder: (context) {
                                context.read<ReserveAddCubit>().init();
                                context.read<ReserveListCubit>().updateReserves();
                                context.router.push(const ReserveListRoute());
                                return getButtonState(context, "", true);
                              },
                            ),
                          ReserveAddException() || _ => Builder(
                              builder: (context) {
                                return getButtonState(
                                    context, "Авторизация провалилась", true);
                              },
                            ),
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
