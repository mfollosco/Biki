import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double percentage;
  final Color fillColor;
  //final String imagePath; // Image for icon

  const CustomProgressBar({
    Key? key,
    required this.percentage,
    required this.fillColor,
    //required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Bar
        Container(
          height: 30,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2),
          ),
        ),
        // Progress Fill
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 30,
            width: 250 * (percentage / 100), // Dynamic width
            color: fillColor,
          ),
        ),
        // Icon Image
        // Positioned(
        //   left: -10, // Position slightly outside the bar
        //   top: -5,
        //   child: //Image.asset(
        //     //imagePath,
        //     //width: 40,
        //     //height: 40,
        //   //),
        // ),
        // Percentage Text
        Positioned.fill(
          child: Center(
            child: Text(
              '${percentage.toInt()}%',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
