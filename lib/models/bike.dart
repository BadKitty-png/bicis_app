/// Modelo de datos de una bicicleta.
class Bike {
  final int id;
  final String name;
  final String brand;
  final String category;
  final String shortDescription;
  final String description;
  final String image;
  final double price;
  final double rating;
  final double weightKg;
  final int speeds;
  final String wheelSize;
  final List<String> features;

  const Bike({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.shortDescription,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.weightKg,
    required this.speeds,
    required this.wheelSize,
    required this.features,
  });
}
