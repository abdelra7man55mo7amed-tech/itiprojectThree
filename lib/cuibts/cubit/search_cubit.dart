import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
part 'search_state.dart';
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final Dio dio = Dio();
  Future<void> research(String text) async {
    emit(SearchLoading());
    try {
      Response response = await dio.get(
        "https://dummyjson.com/products/search?q=$text",
      );
      emit(SearchSuccess(response.data));
    } on DioException catch (e) {
      emit(SearchFailure(e.message ?? "Error"));
    }
  }
}
