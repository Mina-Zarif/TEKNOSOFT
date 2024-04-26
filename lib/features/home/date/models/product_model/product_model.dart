class ProductModel {
  final String? id;
  final String? title;
  final String? type;
  final String? description;
  final double? price;
  final List<String>? imagesUrl;
  final bool? isFavorite;
  final double? rating;

  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imagesUrl,
      this.isFavorite,
      this.type,
      this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      description: json['description'],
      price: json['price'],
      imagesUrl: json['imagesUrl'] != null
          ? List<String>.from(json['imagesUrl'])
          : null,
      isFavorite: json['isFavorite'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'description': description,
        'price': price,
        'imagesUrl': imagesUrl,
        'isFavorite': isFavorite,
        'rating': rating,
      };
}
