import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tixket/models/ticket_model.dart';
import 'package:tixket/pages/movie/ticket_page.dart';
import 'package:tixket/pages/index_page.dart';
import 'package:tixket/providers/booking_history_provider.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

 @override
  Widget build(BuildContext context) {
    List<Ticket> bookingHistoryMovie = Provider.of<BookingHistoryProvider>(context).bookingHistoryMovie.reversed.toList();

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
              "Your booking movies is empty",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              "Start add your first purchase now!",
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
        ) : SingleChildScrollView(
          child: Column(
            children: bookingHistoryMovie.map((ticket) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket.movie.title,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 10),
                          Text("Booking Code ${ticket.bookingCode}"),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              const SizedBox(width: 10),
                              Text(ticket.theater.name)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  const SizedBox(width: 10),
                                  Text(DateFormat("E, d MMM yyyy").format(ticket.selectedDate))
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.timer_sharp),
                                  const SizedBox(width: 10),
                                  Text("${ticket.selectedTime.hour.toString().padLeft(2, '0')}:${ticket.selectedTime.minute.toString().padLeft(2, '0')}")
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => TicketPage(ticket: ticket),)
                              );
                            }, 
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              // minimumSize: const Size(double.infinity, 50),
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                            ), 
                            child: const Text("See Detail")
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ),
    );
  }
}