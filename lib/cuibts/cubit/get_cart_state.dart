part of 'get_cart_cubit.dart';

@immutable
sealed class GetCartState {}
final class GetCartInitial extends GetCartState {}
final class CartLoading extends GetCartState {}
final class CartSuccess extends GetCartState {
  final CartModel cart;
  CartSuccess(this.cart);
}
final class CartFailure extends GetCartState {
  final String message;
  CartFailure(this.message);
}