class ProductModel {
  final int id;
  final String title;
  final double price;
  final String brand;
  final double rating;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.rating,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      brand: json['brand'] ?? 'Unknown',
      rating: (json['rating'] ?? 0).toDouble(),
      imageUrl: json['thumbnail'] ?? 'https://via.placeholder.com/150',
    );
  }
}
