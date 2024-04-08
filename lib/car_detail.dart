import 'package:flutter/material.dart';
import 'car.dart'; // Assuming this class has all the necessary fields.

class CarDetailsPage extends StatefulWidget {
  final Car car;

  CarDetailsPage({required this.car});

  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  bool _showFullReport = false;

  void _buyFullReport() async {
    // This would be where you add your logic to handle the purchase.
    // After the purchase is complete, you set the state to show the full report.
    setState(() {
      _showFullReport = true;
    });

    // TODO: Implement the purchase logic here, such as an API call.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.car.make} ${widget.car.model}, ${widget.car.year} г.'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset( // Using AssetImage for a local image
                      'assets/images/car_logo.png', // Replace with your actual local image path
                      width: 100,
                      height: 100,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('${widget.car.make} ${widget.car.model}, ${widget.car.year} г.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('VIN номер: ${widget.car.vin}'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network( // Using the first image URL from the list
                          widget.car.imageUrls.isNotEmpty ? widget.car.imageUrls.first : 'https://via.placeholder.com/150', // Replace with a placeholder if the list is empty
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                        title: Text(' ${widget.car.make} ${widget.car.model} ${widget.car.year}'),
                        trailing: IconButton(
                          icon: Icon(Icons.history),
                          onPressed: () {
                            // Implement navigation to history page if necessary
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: _showFullReport ? null : _buyFullReport,
                          child: Text('Купить отчет'),
                        ),
                      ),
                      if (_showFullReport)
                      // Display additional information after purchase
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('VIN: ${widget.car.vin}'),
                              Text('Make/Model: ${widget.car.make} ${widget.car.model}'),
                              Text('Year: ${widget.car.year}'),
                              Text('Condition: ${widget.car.condition.toString().split('.').last}'),
                              Text('Steering Wheel Position: ${widget.car.steeringWheelPosition}'),
                              Text('Color: ${widget.car.color}'),
                              Text('Engine Volume: ${widget.car.engineVolume} cm3'),
                              Text('Mileage: ${widget.car.mileage} km'),
                              Text('Tint Permission: ${widget.car.tintPermission ? 'Allowed' : 'Not Allowed'}'),
                              Text('Special Notes: ${widget.car.specialNotes.join(', ')}'),
                              Text('Fuel Type: ${widget.car.fuelType}'),
                              Text('Seized: ${widget.car.isSeized ? 'Yes' : 'No'}'),
                              Text('Ownership History:'),
                              for (var history in widget.car.ownershipHistory)
                                Text('${history['from']} - ${history['to']}'),
                              // Add any additional information you want to display
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
