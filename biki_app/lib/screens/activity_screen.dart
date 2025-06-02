import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Activity 1'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),

        // Container: layout
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flashcards');
              },
              child: Text("Learn"),
            ),
            SizedBox(width: 10), // Add some spacing between the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flashcards');
              },
              child: Text("Game"),
            ),
          ],
        )));
  }
}
