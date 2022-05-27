part of 'cat_cubit.dart';

@immutable
abstract class CatState {
  const CatState();
}

class CatInitial extends CatState {
  const CatInitial();
}

class ChangeIndexState extends CatState {
  const ChangeIndexState();
}
