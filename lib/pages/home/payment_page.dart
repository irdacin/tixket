import 'package:flutter/material.dart';
import 'package:pair/pair.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/models/theater_model.dart';
import 'package:tixket/utils/seat_state.dart';

class PaymentPage extends StatefulWidget {
  final Movie movie;
  final Theater theater;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Set<Pair<int,int>> selectedSeats;
  final List<List<SeatState>> currentSeatsState;
  final int indexSelectedTime;
  
  const PaymentPage({
    super.key, 
    required this.movie, 
    required this.theater, 
    required this.selectedDate, 
    required this.selectedTime, 
    required this.selectedSeats, 
    required this.currentSeatsState, 
    required this.indexSelectedTime
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${widget.movie.fileName}"),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}