import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {

// }

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
}

///
final cubitA = CounterCu(0); // state starts at 0
final cubitB = CounterCu(10); // state starts at 10

class CounterCu extends Cubit<int> {
  CounterCu(int initialState) : super(initialState);
}

///
class CounterCubi extends Cubit<int> {
  CounterCubi() : super(0);

  void increment() => emit(state + 1);
}

class Cou extends Cubit<int> {
  Cou() : super(0);

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}

void main() {
  // final cubit = CounterCubi();
  // print(cubit.state); // 0
  // cubit.increment();
  // print(cubit.state); // 1
  // cubit.increment();
  // print(cubit.state); // 1
  // cubit.close();

  // Cou()
  //   ..increment()
  //   ..close();

  Bloc.observer = SimpleBlocObserver();
  CounterCubit()
    // ..increment()
    ..close();
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

////
abstract class ForExempleBloc {}

class Two extends ForExempleBloc {}

class For extends Bloc<ForExempleBloc, int> {
  For() : super(0);

  // on<Two> ((event, emit ){})
}
