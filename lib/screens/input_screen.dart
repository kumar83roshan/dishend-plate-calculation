import 'package:flutter/material.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  InputScreenState createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  final TextEditingController _internalDiameterController = TextEditingController();
  final TextEditingController _plateWidthController = TextEditingController();
  final TextEditingController _plateLengthController = TextEditingController();
  final TextEditingController _numPetalsController = TextEditingController();
  final TextEditingController _straightFlangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
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
                TextField(
                  controller: _internalDiameterController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Internal Diameter (mm)",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _plateWidthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Plate Width (mm)",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _plateLengthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Plate Length (mm)",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _numPetalsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Number of Petals",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _straightFlangeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Straight Flange (mm)",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    double internalDiameter = double.parse(_internalDiameterController.text);
                    double plateWidth = double.parse(_plateWidthController.text);
                    double plateLength = double.parse(_plateLengthController.text);
                    int numPetals = int.parse(_numPetalsController.text);
                    double straightFlange = double.parse(_straightFlangeController.text);

                    // Navigate to the result screen with the input values
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          internalDiameter: internalDiameter,
                          plateWidth: plateWidth,
                          plateLength: plateLength,
                          numPetals: numPetals,
                          straightFlange: straightFlange,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
