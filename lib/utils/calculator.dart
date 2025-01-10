import 'dart:math';

class PlateCalculator {
  static Map<String, dynamic> calculatePlates({
    required double internalDiameter,
    required double plateWidth,
    required double plateLength,
    required int numPetals,
    required double straightFlange,
  }) {
    // 1. Calculate Surface Area

    // Crown Area (Area of hemisphere)
    double crownArea = 2 * pi * pow((internalDiameter / 2), 2);

    // Petal Area (Simplified approximation)
    double petalArea = (numPetals / 20) * crownArea * (1 + (straightFlange / internalDiameter));

    // Total Surface Area
    double totalSurfaceArea = crownArea + petalArea;

    // 2. Calculate Usable Plate Area

    // Plate Area (length x width)
    double plateArea = plateWidth * plateLength;

    // Usable Plate Area (90% of plate area for allowances)
    double usablePlateArea = plateArea * 0.9;

    // 3. Estimate Plate Count

    // Initial Estimate
    double initialPlateCount = totalSurfaceArea / usablePlateArea;

    // Adjust Plate Count based on specified ranges
    double adjustedPlateCount;
    if (initialPlateCount <= 0.5) {
      adjustedPlateCount = 0.5;
    } else if (initialPlateCount <= 1) {
      adjustedPlateCount = 1.0;
    } else if (initialPlateCount <= 1.5) {
      adjustedPlateCount = 1.5;
    } else if (initialPlateCount <= 2) {
      adjustedPlateCount = 2.0;
    } else {
      adjustedPlateCount = (initialPlateCount * 2).ceil() / 2.0; // Round up to nearest 0.5
    }

    // Return the results as a map
    return {
      "crown_area": crownArea,
      "petal_area": petalArea,
      "total_surface_area": totalSurfaceArea,
      "usable_plate_area": usablePlateArea,
      "total_plates_required": adjustedPlateCount,
    };
  }
}
