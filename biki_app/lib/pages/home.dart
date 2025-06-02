import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper alignment
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/analytics');
                    },
                    icon: const Icon(Icons.account_circle),
                    color: Colors.cyan,
                    hoverColor: Colors.lightBlue[50],
                    iconSize: 80,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: FilledButton(
                    onPressed:(){
                      Navigator.pushNamed(context, '/activity');
                    },
                    style: FilledButton.styleFrom(shape:const RoundedRectangleBorder
                      (borderRadius: BorderRadius.zero,
                      ),
                      minimumSize: const Size(200, 200),
                    ),
                    child: const Text('Activity 1'),
                  ),
                ), 
                Container(
                  margin: const EdgeInsets.all(20),
                  child: FilledButton(
                    onPressed:(){
                      Navigator.pushNamed(context, '/activity');
                    },
                    style: FilledButton.styleFrom(shape:const RoundedRectangleBorder
                      (borderRadius: BorderRadius.zero,
                      ),
                      minimumSize: const Size(200, 200),
                    ),
                    child: const Text('Activity 2'),
                  ),
                ), 
                 Container(
                    margin: const EdgeInsets.all(20),
                    child: FilledButton(
                      onPressed:(){
                        Navigator.pushNamed(context, '/activity');
                      },
                      style: FilledButton.styleFrom(shape:const RoundedRectangleBorder
                        (borderRadius: BorderRadius.zero,
                        ),
                        minimumSize: const Size(200, 200),
                      ),
                      child: const Text('Activity 3'),
                    ),
                ),    
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  child: FilledButton(
                    onPressed:(){
                      Navigator.pushNamed(context, '/activity');
                    },
                    style: FilledButton.styleFrom(shape:const RoundedRectangleBorder
                      (borderRadius: BorderRadius.zero,
                      ),
                      minimumSize: const Size(200, 200),
                    ),
                    child: const Text('Activity 4'),
                  ),
                ), 
                Container(
                  margin: const EdgeInsets.all(20),
                  child: FilledButton(
                      onPressed:(){
                        Navigator.pushNamed(context, '/activity');
                      },
                      style: FilledButton.styleFrom(shape:const RoundedRectangleBorder
                        (borderRadius: BorderRadius.zero,
                        ),
                        minimumSize: const Size(200, 200),
                      ),
                      child: const Text('Activity 5'),
                    ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: FilledButton(
                    onPressed:(){
                      Navigator.pushNamed(context, '/activity');
                    },
                    style: FilledButton.styleFrom(shape:const RoundedRectangleBorder
                      (borderRadius: BorderRadius.zero,
                      ),
                      minimumSize: const Size(200, 200),
                    ),
                    child: const Text('Activity 6'),
                  ),
                ),  
              ],
            ),
          ],
        ),
      ),
    );
  }
}