import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/provider/user_provider.dart';

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
            Text(Provider.of<UserProvider>(context).username)
          ],
        ),
      ),
    );
  }
}