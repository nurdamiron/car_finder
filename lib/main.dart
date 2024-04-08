import 'package:flutter/material.dart';
import 'car_repo.dart'; // Make sure this file exists and has the necessary logic
import 'car_detail.dart'; // Make sure this file exists and has the necessary logic

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIN Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VINCheckerPage(),
    );
  }
}

class VINCheckerPage extends StatefulWidget {
  @override
  _VINCheckerPageState createState() => _VINCheckerPageState();
}

class _VINCheckerPageState extends State<VINCheckerPage> {
  final TextEditingController _vinController = TextEditingController();
  String _statusMessage = '';

  void _checkVin() {
    var foundCar = CarRepository.findCarByVin(_vinController.text.trim());
    setState(() {
      if (foundCar != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CarDetailsPage(car: foundCar),
        ));
      } else {
        _statusMessage = 'No car found with this VIN.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 50), // Replace with your logo asset
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _vinController,
              decoration: InputDecoration(
                hintText: 'Enter VIN',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text('Examples: 01KG777AAA, B0001A, B5555BA', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: _checkVin,
            child: Text('Check History'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text('Full report costs 1000₸'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace these with your own payment method icons
                Icon(Icons.credit_card, size: 48),
                SizedBox(width: 8),
                Icon(Icons.account_balance_wallet, size: 48),
              ],
            ),
          ),
          if (_statusMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                _statusMessage,
                style: TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
