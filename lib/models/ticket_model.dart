import 'package:flutter/material.dart';
import 'package:pair/pair.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/models/theater_model.dart';

class Ticket {
  final Movie movie;
  final Theater theater;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Set<Pair<int,int>> selectedSeats;
  final String bookingCode;

  Ticket({
    required this.movie,
    required this.theater,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedSeats,
    required this.bookingCode
  });
}