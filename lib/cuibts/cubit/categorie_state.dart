part of 'categorie_cubit.dart';

@immutable
sealed class CategorieState {}
final class CategorieInitial extends CategorieState {}
class CatLoading extends CategorieState{}
class CatSuccess extends CategorieState{
  final List<String> categories;
  CatSuccess(this.categories);
}
class CatFail extends CategorieState{
  final String message;
  CatFail(this.message);
}