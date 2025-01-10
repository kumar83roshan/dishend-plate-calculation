import 'package:flutter/material.dart';
import '../utils/calculator.dart';

class ResultScreen extends StatelessWidget {
  final double internalDiameter;
  final double plateWidth;
  final double plateLength;
  final int numPetals;
  final double straightFlange;

  const ResultScreen({
    super.key,
    required this.internalDiameter,
    required this.plateWidth,
    required this.plateLength,
    required this.numPetals,
    required this.straightFlange,
  });

  @override
  Widget build(BuildContext context) {
    // Perform the calculation
    final result = PlateCalculator.calculatePlates(
      internalDiameter: internalDiameter,
      plateWidth: plateWidth,
      plateLength: plateLength,
      numPetals: numPetals,
      straightFlange: straightFlange,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.green],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Crown & Petal Type Dishend",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  AspectRatio(
                    aspectRatio: 16 / 9, // Adjust aspect ratio as per your image
                    child: Image.asset(
                      'assets/images/crwonpetal.png',
                      fit: BoxFit.contain, // Ensures the image fits properly
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Total Plates Required",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${result['total_plates_required']}",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Plate Size: ${plateWidth.toInt()} mm x ${plateLength.toInt()} mm",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
