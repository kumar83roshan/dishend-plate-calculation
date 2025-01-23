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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          "Crown & Petal Type Dishend",
                          style: TextStyle(
                            fontSize: 22, // Slightly reduced font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: constraints.maxWidth > 800 ? 300 : 200, // Reduced image height
                          child: Image.asset(
                            'assets/images/crwonpetal.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 20),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0), // Reduced padding
                            child: Column(
                              children: [
                                Text(
                                  "Total Plates Required",
                                  style: TextStyle(
                                    fontSize: 20, // Reduced font size
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "${result['total_plates_required']}",
                                  style: TextStyle(
                                    fontSize: 26, // Reduced font size
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Plate Size: ${plateWidth.toInt()} mm x ${plateLength.toInt()} mm",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Reduced padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 4,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(fontSize: 16, color: Colors.green[800]), // Reduced font size
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
