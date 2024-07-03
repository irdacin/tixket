import 'package:flutter/material.dart';
import 'package:tixket/models/ticket_model.dart';
import 'package:tixket/providers/user_provider.dart';

class BookingHistoryProvider extends ChangeNotifier {
  final UserProvider _userProvider;
  BookingHistoryProvider(this._userProvider);
  
  List<Ticket> get bookingHistoryMovie => _userProvider.currentUser!.bookingHistoryMovie ?? [];
  
  void addTicket(Ticket ticket){
    _userProvider.currentUser!.bookingHistoryMovie ??= [];
    _userProvider.currentUser!.bookingHistoryMovie!.add(ticket);
    notifyListeners();
  }
}