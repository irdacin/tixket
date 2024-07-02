import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pair/pair.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/models/theater_model.dart';
import 'package:tixket/pages/index_page.dart';

class TicketPage extends StatelessWidget {
  final Movie movie;
  final Theater theater;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Set<Pair<int,int>> selectedSeats;
  final String bookingCode;

  const TicketPage({
    super.key, 
    required this.movie, 
    required this.theater, 
    required this.selectedDate, 
    required this.selectedTime, 
    required this.selectedSeats, 
    required this.bookingCode
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tix's Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paperless",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "No need to print the e-ticket",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "Scan QR Code to collect your tickets at that theater",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/${movie.fileName}"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Booking Code",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          bookingCode,
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      child: QrImageView(
                        data: bookingCode
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Text("Theater")
                        ),
                        Expanded(
                          child: Text(theater.name)
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Text("Location")
                        ),
                        Expanded(
                          child: Text(theater.location)
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Text("Date")
                        ),
                        Expanded(
                          child: Text(DateFormat("EEEE, d MMMM yyyy").format(selectedDate))
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Text("Time")
                        ),
                        Expanded(
                          child: Text("${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}")
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Text("Seats")
                        ),
                        Expanded(
                          child: Text(
                            selectedSeats.map((seat) {
                              var (row, col) = seat();
                              return "${String.fromCharCode(row + 65)}${col + 1}";
                            }).join(", ").toString(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const IndexPage()),
                          (route) => false,
                        );
                      }, 
                      child: const Text("OK"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}