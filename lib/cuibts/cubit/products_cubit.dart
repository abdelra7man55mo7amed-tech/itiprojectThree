import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:itiprojectthree/core/models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final Dio dio = Dio();

  Future<void> getProducts(String catName) async {
    emit(ProductLoading());
    try {
      // final Response response = await dio.get("https://dummyjson.com/products/category/$catName");
      Response response;
      if(catName == "All"){
        response = await dio.get("https://dummyjson.com/products");
      }else{
        response = await dio.get("https://dummyjson.com/products/category/$catName");
      }
      final List<ModelCategoryProduct> products =
          (response.data["products"] as List)
              .map((e) => ModelCategoryProduct.fromjson(e))
              .toList();
      emit(ProductSuccess(products));
    } on DioException catch (e) {
      emit(ProductFail(e.message ?? "Network Error"));
    } catch (e) {
      emit(ProductFail(e.toString()));
    }
  }
}
