import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:itiprojectthree/core/models/cart_model.dart';
import 'package:meta/meta.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit() : super(GetCartInitial());
  Dio dio = Dio();
  Future<void> getCart() async {
    emit(CartLoading());
    try {
      Response response = await dio.get(
        "https://dummyjson.com/carts/1",
      );
      CartModel cart = CartModel.fromJson(response.data);
      emit(CartSuccess(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
