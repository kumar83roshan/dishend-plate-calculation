import 'package:flutter/material.dart';
import 'screens/input_screen.dart';

void main() {
  runApp(const DishEndCalculatorApp());
}

class DishEndCalculatorApp extends StatelessWidget {
  const DishEndCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dish End Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: const InputScreen(),
    );
  }
}
