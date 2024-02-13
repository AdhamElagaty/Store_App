class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromJSON(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"].toString(),
      description: jsonData["description"],
      category: jsonData["category"],
      image: jsonData["image"],
      ratingModel: RatingModel.fromJSON(jsonData["rating"]),
    );
  }
}

class RatingModel {
  final String rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJSON(jsonData) {
    return RatingModel(
      rate: jsonData["rate"].toString(),
      count: jsonData["count"],
    );
  }
}
