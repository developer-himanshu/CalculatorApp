// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  //button click ho uske liye likh rhe h
  final VoidCallback onPress;
  const MyButton({super.key, required this.title, this.color=const Color.fromARGB(255, 128, 128, 128), required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color
            ),
            child: Center(
              child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}