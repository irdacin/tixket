import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/pages/index_page.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

 @override
  Widget build(BuildContext context) {
    List<Movie> bookingHistoryMovie = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: bookingHistoryMovie.isEmpty ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your bokking movies is empty",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              "Start add your booking movies now!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const IndexPage()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: Theme.of(context).textTheme.displayLarge
              ),  
              child: const Text("Find Movies")
            )
          ],
        ) : Column(
          children: bookingHistoryMovie.map((e) => Text(e.title)).toList(),
        )
      ),
    );
  }
}