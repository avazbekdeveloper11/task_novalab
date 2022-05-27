import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/service/cats_service.dart';
import 'package:task/service/hive_service.dart';
part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit() : super(CatInitial());
  int index = 0;

  void changeIndex(fact) async {
    index++;
    emit(ChangeIndexState());
    await Future.delayed(
      const Duration(seconds: 8),
      () async {
        HiveService.putToBox(fact);
        print("object");
      },
    );
  }
}
