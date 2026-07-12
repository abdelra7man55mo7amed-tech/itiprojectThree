part of 'products_cubit.dart';
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductLoading extends ProductsState {}

class ProductSuccess extends ProductsState {
  final List<ModelCategoryProduct> products;

  ProductSuccess(this.products);
}

class ProductFail extends ProductsState {
  final String message;

  ProductFail(this.message);
}