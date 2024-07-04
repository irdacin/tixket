import 'package:flutter/material.dart';
import 'package:pair/pair.dart';
import 'package:provider/provider.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/models/theater_model.dart';
import 'package:tixket/models/ticket_model.dart';
import 'package:tixket/pages/movie/ticket_page.dart';
import 'package:tixket/pages/index_page.dart';
import 'package:tixket/providers/booking_history_provider.dart';
import 'package:tixket/utils/get_booking_code.dart';

class PaymentSuccessPage extends StatelessWidget {
  final Movie movie;
  final Theater theater;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Set<Pair<int,int>> selectedSeats;

  const PaymentSuccessPage({
    super.key, 
    required this.movie, 
    required this.theater, 
    required this.selectedDate, 
    required this.selectedTime, 
    required this.selectedSeats,
  });

  @override
  Widget build(BuildContext context) {
    String bookingCode = getBookingCode();
    
    Ticket ticket = Ticket(
      movie: movie, 
      theater: theater, 
      selectedDate: selectedDate, 
      selectedTime: selectedTime, 
      selectedSeats: selectedSeats, 
      bookingCode: bookingCode
    );

    Provider.of<BookingHistoryProvider>(context, listen: false).addTicket(ticket);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/success.png")
                    )
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Ticket Payment Successful",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  "Your booking code is $bookingCode",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TicketPage(ticket: ticket))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ), 
                  child: const Text("Check Ticket"),
                ),
                const SizedBox(height: 20),
                
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const IndexPage()),
                      (route) => false,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ), 
                  child: const Text("Back to Home"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}