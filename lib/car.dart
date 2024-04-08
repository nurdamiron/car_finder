// Define the conditions of the car
enum Condition { New, Used, AfterAccident }

// Car class with required properties
class Car {
  String vin;
  String make;
  String model;
  int year;
  Condition condition;
  List<String> imageUrls;
  String steeringWheelPosition;
  String color;
  int engineVolume;
  int mileage;
  bool tintPermission;
  List<String> specialNotes;
  String fuelType;
  bool isSeized;
  List<Map<String, dynamic>> ownershipHistory; // Use dynamic because dates could be DateTime objects or Strings.

  Car({
    required this.vin,
    required this.make,
    required this.model,
    required this.year,
    required this.condition,
    required this.imageUrls,
    required this.steeringWheelPosition,
    required this.color,
    required this.engineVolume,
    required this.mileage,
    required this.tintPermission,
    required this.specialNotes,
    required this.fuelType,
    required this.isSeized,
    required this.ownershipHistory,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      vin: json['vin'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      condition: Condition.values[json['condition']],
      imageUrls: json['imageUrl'],
      steeringWheelPosition: json['steeringWheelPosition'],
      color: json['color'],
      engineVolume: json['engineVolume'],
      mileage: json['mileage'],
      tintPermission: json['tintPermission'],
      specialNotes: List<String>.from(json['specialNotes']),
      fuelType: json['fuelType'],
      isSeized: json['isSeized'],
      ownershipHistory: List<Map<String, dynamic>>.from(json['ownershipHistory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vin': vin,
      'make': make,
      'model': model,
      'year': year,
      'condition': condition.index,
      'imageUrls': imageUrls,
      'steeringWheelPosition': steeringWheelPosition,
      'color': color,
      'engineVolume': engineVolume,
      'mileage': mileage,
      'tintPermission': tintPermission,
      'specialNotes': specialNotes,
      'fuelType': fuelType,
      'isSeized': isSeized,
      'ownershipHistory': ownershipHistory,
    };
  }
}
