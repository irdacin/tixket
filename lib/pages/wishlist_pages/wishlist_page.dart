import 'package:flutter/material.dart';
import 'package:tixket/utils/home.dart';

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
            Text(
              "Start add your favorite movies",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Home(),),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: Theme.of(context).textTheme.bodyMedium
              ),  
              child: Text("Find Movies")
            )
          ],
        ),
      ),
    );
  }
}