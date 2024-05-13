import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list/reserve_list_cubit.dart';
import 'package:app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReserveCard extends StatelessWidget {
  ReserveCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    ReserveEntity rEntity = context.read<ReserveListCubit>().getReserves[index];

    return Card(
      child: ExpansionTile(
        title: Row(
          children: <Widget>[
            Text(
              rEntity.place_code + "  id = ${rEntity.ID}",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        leading: ElevatedButton(
          onPressed: () {
            context.router.push(ReserveRoute(index: index));
          },
          child: const Icon(Icons.mark_as_unread_sharp),
        ),
        children: [
          const Text("Продолжительность бронирования"),
          Text(
            DateTime.fromMillisecondsSinceEpoch(rEntity.begin * 1000).toString() + " - " + DateTime.fromMillisecondsSinceEpoch(rEntity.end * 1000).toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
