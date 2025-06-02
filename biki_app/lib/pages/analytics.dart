import 'package:flutter/material.dart';
import 'progress_bar.dart';
class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name\'s Progress'),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper alignment
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: const Icon(Icons.home),
                    color: Colors.cyan,
                    hoverColor: Colors.lightBlue[50],
                    iconSize: 80,
                    style: FilledButton.styleFrom(shape: CircleBorder()),
                  ),
                  Text(
                    'Points: 100',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomProgressBar(
                percentage: 95,
                fillColor: Colors.redAccent,
                //imagePath: 'assets/heart.png', // Replace with your asset path
              ),
              SizedBox(height: 20),
              CustomProgressBar(
                percentage: 45,
                fillColor: Colors.yellow,
                //imagePath: 'assets/lightning.png',
              ),
              SizedBox(height: 20),
              CustomProgressBar(
                percentage: 80,
                fillColor: Colors.green,
                //imagePath: 'assets/gem.png',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}