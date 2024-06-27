import 'package:flutter/material.dart';
import 'package:tixket/utils/seat_state.dart';

class Seat extends StatefulWidget {
  final SeatState seatState;
  final int row;
  final int col;
  final String seatNumber;
  final void Function(int row, int col, SeatState currentState) onSeatStateChanged;

  const Seat({
    super.key, 
    required this.seatState, 
    required this.row, 
    required this.col,
    required this.seatNumber,
    required this.onSeatStateChanged
  });

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  late SeatState seatState;
  late String seatNumber;
  late int row;
  late int col;

  @override
  void initState() {
    super.initState();
    seatState = widget.seatState;
    seatNumber = widget.seatNumber;
    row = widget.row;
    col = widget.col;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (seatState) {
          case SeatState.selected: {
            setState(() {
              seatState = SeatState.unselected;
              widget.onSeatStateChanged(row, col, SeatState.unselected);
            });
          } break;
          case SeatState.unselected: {
            setState(() {
              seatState = SeatState.selected;
              widget.onSeatStateChanged(row, col, SeatState.selected);
            });
          } break;
          case SeatState.sold:
          case SeatState.empty:
          default:
        }
      },
      child: _viewSeat(seatState, seatNumber: seatNumber)
    );
  }

  Widget _viewSeat(SeatState seatState, {required String seatNumber}) {
    if(seatState == SeatState.selected) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue
        ),
        alignment: Alignment.center,
        child: Text(
          seatNumber,
          style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white)
        ),
      );
    }
    else if(seatState == SeatState.unselected) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: const Border.fromBorderSide(
            BorderSide(
              color: Colors.blue
            )
          )
        ),
        alignment: Alignment.center,
        child: Text(
          seatNumber,
          style: Theme.of(context).textTheme.bodySmall
        ),
      );
    }
    else if(seatState == SeatState.sold) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.red
        ),
        alignment: Alignment.center,
        child: Text(
          seatNumber,
          style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white)
        ),
      );
    }
    else {
      return const SizedBox(
        height: 40,
        width: 40,
      );
    }
  }
}