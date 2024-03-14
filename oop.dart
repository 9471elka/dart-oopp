import 'dart:io';

// Define an interface
abstract class Shape {
  double area();
}

// Define a class Rectangle that implements the Shape interface
class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

// Define a class Square that inherits from Rectangle
class Square extends Rectangle {
  Square(double sideLength) : super(sideLength, sideLength);

  // Override the area method
  @override
  double area() {
    return width * height;
  }
}

// Method to read data from a file and initialize objects
List<Shape> initializeObjectsFromFile(String filename) {
  var shapes = <Shape>[];
  var file = File(filename);

  file.readAsLinesSync().forEach((line) {
    var data = line.split(',');
    if (data[0] == 'Rectangle') {
      var width = double.parse(data[1]);
      var height = double.parse(data[2]);
      shapes.add(Rectangle(width, height));
    } else if (data[0] == 'Square') {
      var sideLength = double.parse(data[1]);
      shapes.add(Square(sideLength));
    }
  });

  return shapes;
}

// Method demonstrating the use of a loop
double calculateTotalArea(List<Shape> shapes) {
  var totalArea = 0.0;
  for (var shape in shapes) {
    totalArea += shape.area();
  }
  return totalArea;
}

// Example usage
void main() {
  // Initialize objects from file
  var shapes = initializeObjectsFromFile('shapes_data.txt');

  // Calculate total area
  var totalArea = calculateTotalArea(shapes);
  print("Total area of all shapes: $totalArea");
}
