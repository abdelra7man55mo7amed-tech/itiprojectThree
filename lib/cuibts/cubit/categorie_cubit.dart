import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:itiprojectthree/core/models/categore_model.dart';
import 'package:meta/meta.dart';

part 'categorie_state.dart';

class CategorieCubit extends Cubit<CategorieState> {
  CategorieCubit() : super(CategorieInitial());
  final dio = Dio();
  Future<void> getCategories() async {
    try {
      emit(CatLoading());
      final Response response = await dio.get(
        "https://dummyjson.com/products/category-list",
      );
      final List<String> categories = ["All" , ...List<String>.from(response.data)];
      emit(CatSuccess(categories));
    } on DioException catch (e) {
      emit(CatFail(e.message ?? "Error"));
    } catch (e) {
      emit(CatFail(e.toString()));
    }
  }
}
