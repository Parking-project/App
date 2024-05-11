import 'package:bloc/bloc.dart';
part 'state.dart';

class CounterCubit extends Cubit<CounterState> {
  final List<int> num;

  CounterCubit(this.num) : super(const CounterLoading(num: []));
  void init() async {
    emit(const CounterException(num: []));
  }
}
