class CartModel {
  final List<CartProduct> products;
  final double total;
  CartModel({
    required this.products,
    required this.total,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      total: (json["total"] as num).toDouble(),
      products: (json["products"] as List)
          .map((e) => CartProduct.fromJson(e))
          .toList(),
    );
  }
}
class CartProduct {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final String thumbnail;
  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.thumbnail,
  });
  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      quantity: json["quantity"],
      total: (json["total"] as num).toDouble(),
      thumbnail: json["thumbnail"],
    );
  }
}