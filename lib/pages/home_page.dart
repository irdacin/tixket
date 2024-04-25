import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo bro"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Hello World"),
          ],
        ),
      ),
    );
  }
}