import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/service/cats_service.dart';
import 'package:task/service/hive_service.dart';
part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit() : super(CatInitial());
  int index = 0;

  void changeIndex() async {
    index++;
    emit(ChangeIndexState());
    Future.delayed(
      const Duration(seconds: 30),
      () async {
        List data = await ServiceCat().getData();
        HiveService.putToBox(data);
      },
    );
  }
}
