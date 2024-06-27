import 'package:tixket/utils/seat_state.dart';

class SeatLayoutState {
  final int rows;
  final int cols;
  final List<List<SeatState>> currentSeatsState;

  const SeatLayoutState({
    required this.rows,
    required this.cols,
    required this.currentSeatsState
  });
}