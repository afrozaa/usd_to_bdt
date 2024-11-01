import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double usd;
  final double bdt;

  ResultPage({required this.usd, required this.bdt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converted Amount'),
        backgroundColor: Colors.lightBlueAccent, // Updated color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(32), // Increased padding
            decoration: BoxDecoration(
              color: Colors.lightBlue[100], // Updated color
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${usd.toStringAsFixed(2)} USD = ${bdt.toStringAsFixed(2)} BDT',
              style: TextStyle(fontSize: 28, color: Colors.black), // Increased font size
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
