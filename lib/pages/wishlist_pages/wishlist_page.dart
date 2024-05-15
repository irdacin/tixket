import 'package:flutter/material.dart';
import 'package:tixket/pages/home.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Wishlist is empty",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              "Start add your favorite movies now!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                // minimumSize: const Size(100, 50),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: Theme.of(context).textTheme.bodyLarge
              ),  
              child: Text("Find Movies")
            )
          ],
        ),
      ),
    );
  }
}