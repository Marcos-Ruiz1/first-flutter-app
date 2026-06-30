//import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0A1929),
      alignment: Alignment(0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(),
        ],
      ),
    );
  }

  
  Widget buildButton(){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0A1929),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Color(0xFFC850C0),  // Border color
          width: 2,  // Border thickness
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            print("button pressed");
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      )
    );
  }
}
