class FavoritesProductModel {
  final int id;
  final String title;
  final double price;
  final String brand;
  final double rating;
  final String imageUrl;

  FavoritesProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.rating,
    required this.imageUrl,
  });

  factory FavoritesProductModel.fromJson(Map<String, dynamic> json) {
    return FavoritesProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      brand: json['brand'] ?? 'Unknown',
      rating: (json['rating'] ?? 0).toDouble(),
      imageUrl: json['thumbnail'] ?? 'https://via.placeholder.com/150',
    );
  }
}
