import 'package:flutter/material.dart';
import 'result_page.dart'; // Import the result page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'USD to BDT Converter',
      debugShowCheckedModeBanner: false, // Disable debug banner
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final double exchangeRate = 120.0; // Fixed rate of 1 USD = 120 BDT
  final TextEditingController usdController = TextEditingController();

  void _convertCurrency() {
    final usd = double.tryParse(usdController.text);
    if (usd != null) {
      final bdt = usd * exchangeRate;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(usd: usd, bdt: bdt),
        ),
      );
    } else {
      // Show an error dialog for invalid input
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid input. Please enter a valid number.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USD to BDT Converter'),
        backgroundColor: Colors.lightBlueAccent, // Updated color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: usdController,
                      decoration: InputDecoration(
                        labelText: 'Enter Amount in USD',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    Container(height: 20), // Replaced SizedBox with Container
                    ElevatedButton(
                      onPressed: _convertCurrency,
                      child: Text(
                        'Convert',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        backgroundColor: Colors.lightBlueAccent, // Updated color
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 40), // Replaced SizedBox with Container
              Text(
                'Current Exchange Rate: 1 USD = 120 BDT',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
