class Product {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<Option> options;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });
}

class Option {
  final String id;
  final String name;
  final double price;

  Option({
    required this.id,
    required this.name,
    required this.price,
  });
}
