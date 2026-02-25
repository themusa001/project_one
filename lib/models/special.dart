class Special {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  int quantity;
  final int id;

  Special({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    this.quantity = 1,
    required this.id,
  });
}
