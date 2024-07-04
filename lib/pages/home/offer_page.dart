import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offer"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryFixed
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HAPPY NEW YEAR!!!", style: Theme.of(context).textTheme.headlineMedium),
                  Text("20% off food and beverages", style: Theme.of(context).textTheme.bodyMedium),
                  Text("All cinemas", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("1-20 January 2024", style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryFixed
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("BCA", style: Theme.of(context).textTheme.headlineMedium),
                  Text("Buy 1 Get 1 Free", style: Theme.of(context).textTheme.bodyMedium),
                  Text("With BCA Credit Card", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("15-20 January 2024", style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryFixed
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CINEPOLIS", style: Theme.of(context).textTheme.headlineMedium),
                  Text("Best Movie Best Quality Best Experience", style: Theme.of(context).textTheme.bodyMedium),
                  Text("Now with IMAX and Dolby Atmos When stories come alive", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("15 December 2023", style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryFixed
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You might Like", style: Theme.of(context).textTheme.headlineMedium),
                  Text("Avengers: Endgame", style: Theme.of(context).textTheme.bodyMedium),
                  Text("", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("2 December 2023", style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}