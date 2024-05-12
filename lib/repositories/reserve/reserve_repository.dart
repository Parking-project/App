import 'package:realm/realm.dart';

// part 'reserve.g.dart';

@RealmModel()
class _HistoryRhymes {
  @PrimaryKey()
  late String id;
  late String word;
  late List<String> words;
}
