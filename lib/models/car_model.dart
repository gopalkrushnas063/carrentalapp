class Car {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String imageUrl;
  final double pricePerDay;
  final String transmission;
  final String fuelType;
  final int seats;
  final String type;
  final bool available;
  final double rating;
  final String description;
  final List<String> features;

  Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.imageUrl,
    required this.pricePerDay,
    required this.transmission,
    required this.fuelType,
    required this.seats,
    required this.type,
    required this.available,
    required this.rating,
    required this.description,
    required this.features,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      imageUrl: json['imageUrl'],
      pricePerDay: json['pricePerDay'].toDouble(),
      transmission: json['transmission'],
      fuelType: json['fuelType'],
      seats: json['seats'],
      type: json['type'],
      available: json['available'],
      rating: json['rating'].toDouble(),
      description: json['description'],
      features: List<String>.from(json['features']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'model': model,
      'imageUrl': imageUrl,
      'pricePerDay': pricePerDay,
      'transmission': transmission,
      'fuelType': fuelType,
      'seats': seats,
      'type': type,
      'available': available,
      'rating': rating,
      'description': description,
      'features': features,
    };
  }
}