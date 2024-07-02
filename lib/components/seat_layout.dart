import 'package:flutter/material.dart';
import 'package:tixket/components/seat.dart';
import 'package:tixket/models/seat_layout_state_model.dart';
import 'package:tixket/utils/seat_state.dart';

class SeatLayout extends StatelessWidget {
  final SeatLayoutState seatLayoutState;
  final void Function(int row, int col, SeatState currentState) onSeatStateChanged;

  const SeatLayout({
    super.key, 
    required this.seatLayoutState, 
    required this.onSeatStateChanged
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5,
      minScale: 0.8,
      constrained: false,
      boundaryMargin: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List<int>.generate(seatLayoutState.rows, (row) => row)
              .map((row) => Row(
                  children: [
                    ...List<int>.generate(seatLayoutState.cols, (col) => col)
                      .map((col) => Padding(
                          padding: const EdgeInsets.all(3),
                          child: Seat(
                            seatState: seatLayoutState.currentSeatsState[row][col], 
                            row: row,
                            col: col,
                            seatNumber: "${String.fromCharCode(row + 65)}${col + 1}",
                            onSeatStateChanged: onSeatStateChanged
                          ),
                        ),
                    )
                  ],
                )
            ),
          ],
        ),
      )
    );
  }
}