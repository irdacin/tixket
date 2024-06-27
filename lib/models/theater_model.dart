import 'package:flutter/material.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/utils/seat_state.dart';

class Theater {
  final String name;
  final String location;
  final String address;
  final String phone;
  final int price;
  final List<TimeOfDay> availableTime;
  final List<List<SeatState>> sampleSeatsState; 
  final List<List<List<SeatState>>> newSeatsState;
  Map<Movie, Map<DateTime, List<List<List<SeatState>>>>> currentSeatsState;

  Theater({
    required this.name, 
    required this.location, 
    required this.address,
    required this.phone,
    required this.price,
    required this.availableTime,
    this.sampleSeatsState = const [],
    Map<Movie, Map<DateTime, List<List<List<SeatState>>>>>? currentSeatsState,
  }) : newSeatsState = List.generate(availableTime.length, (index) => 
      sampleSeatsState.map<List<SeatState>>((e) => List.from(e)).toList()
    ),
    currentSeatsState = currentSeatsState ?? {};
}