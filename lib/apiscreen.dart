// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.deepPurple, title: Text("api screen")),
    );
  }
}
