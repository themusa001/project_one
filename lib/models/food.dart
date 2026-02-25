class Food {
  final String name;
  final String? price;
  final String imagePath;
  final String? description;

  Food({
    required this.name,
    this.price,
    required this.imagePath,
    this.description,
  });
}
