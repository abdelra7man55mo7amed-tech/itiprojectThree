class ModelCategoryProduct{
  final int id;
  final String title;
  final String description;
  final double price;
  final String thumbnail;
  final double rating;
  final String productImage;
  ModelCategoryProduct({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.rating,
    required this.productImage,
  });
  factory ModelCategoryProduct.fromjson(Map<String , dynamic> json){
    return ModelCategoryProduct(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      thumbnail:json["thumbnail"],
      rating: json["rating"],
      productImage: (json["images"] != null && json["images"].isNotEmpty)
    ? json["images"][0]
    : "",
    );
  }
}