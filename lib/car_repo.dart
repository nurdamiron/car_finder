import 'car.dart';

class CarRepository {
  // Dummy database of cars. In a real app, you would connect to a database or API.
  static List<Car> _carDatabase = [
    Car(
      vin:'123',
      make: 'Toyota',
      model: 'Supra',
      year: 1998,
      condition: Condition.New,
      imageUrls: [
      'assets/images/car.png',
      'assets/images/car_side.png',
      'assets/images/car_interior.png',
      ],
      steeringWheelPosition: 'left',
      color: 'red',
      engineVolume: 2998,
      mileage: 10000,
      tintPermission: false,
      specialNotes: ['Well maintained', 'No accidents'],
      fuelType: 'Petrol',
      isSeized: false,
      ownershipHistory: [
        {'from': '2022-05-14', 'to': '2022-05-14'},
        {'from': '2022-05-14', 'to': 'Present', 'duration': '1 year 10 months 14 days'},
      ],
    ),
    // Add more cars here...
  ];

  static Car? findCarByVin(String vin) {
    return _carDatabase.firstWhere(
          (car) => car.vin == vin,
      orElse: () => null!, // This should work as expected in Dart null safety.
    );
  }

}
