import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pair/pair.dart';
import 'package:tixket/components/seat_layout.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/models/seat_layout_state_model.dart';
import 'package:tixket/models/theater_model.dart';
import 'package:tixket/pages/home/payment_page.dart';
import 'package:tixket/utils/seat_state.dart';

class SelectSeatPage extends StatefulWidget {
  final Movie movie;
  final Theater theater;
  final DateTime selectedDate;
  final int indexSelectedTime;
  final List<TimeOfDay> availableTime;

  const SelectSeatPage({
    super.key, 
    required this.movie, 
    required this.theater, 
    required this.selectedDate, 
    required this.indexSelectedTime,
    required this.availableTime
  });

  @override
  State<SelectSeatPage> createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  Set<Pair<int,int>> selectedSeats = {};
  late List<List<SeatState>> currentSeatsState;
  late int indexSelectedTime;
  late ScrollController _scrollController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    indexSelectedTime = widget.indexSelectedTime;
    if(!widget.theater.currentSeatsState.containsKey(widget.movie)) {
      widget.theater.currentSeatsState[widget.movie] = {};
    }

    if(!widget.theater.currentSeatsState[widget.movie]!.containsKey(widget.selectedDate)) {
      widget.theater.currentSeatsState[widget.movie]![widget.selectedDate] = List.generate(widget.availableTime.length, (index) => []);
    }

    currentSeatsState = widget.theater.currentSeatsState[widget.movie]![widget.selectedDate]![indexSelectedTime].isEmpty 
      ? widget.theater.newSeatsState[indexSelectedTime].map((row) => List<SeatState>.from(row)).toList()
      : widget.theater.currentSeatsState[widget.movie]![widget.selectedDate]![indexSelectedTime];
    
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        indexSelectedTime * 56.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.theater.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 5),
                    Text("Date: ${DateFormat("dd MMM yyyy").format(widget.selectedDate)}"),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 40, 
                      child: ListView.separated(
                        controller: _scrollController,
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.availableTime.length,
                        itemBuilder: (context, index) {
                          bool isAvailable = DateTime.now().day != widget.selectedDate.day || DateTime.now().day == widget.selectedDate.day && DateTime.now().hour * 60 + DateTime.now().minute < widget.availableTime[index].hour * 60 + widget.availableTime[index].minute;
                          return FilterChip(
                            onSelected: (value) async {
                              if(!isAvailable || indexSelectedTime == index) return;

                              setState(() {
                                indexSelectedTime = index;
                                isLoading = true;
                              });

                              await Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  isLoading = false;
                                  currentSeatsState = widget.theater.currentSeatsState[widget.movie]![widget.selectedDate]![indexSelectedTime].isEmpty 
                                    ? widget.theater.newSeatsState[indexSelectedTime].map((row) => List<SeatState>.from(row)).toList()
                                    : widget.theater.currentSeatsState[widget.movie]![widget.selectedDate]![indexSelectedTime];
                                  selectedSeats.clear();
                                });
                              });
                            },
                            label: Text("${widget.availableTime[index].hour.toString().padLeft(2, '0')}:${widget.availableTime[index].minute.toString().padLeft(2, '0')}"),
                            labelStyle: TextStyle(
                              color: indexSelectedTime == index || !isAvailable ? Colors.white : null
                            ),
                            side: !isAvailable ? BorderSide(
                              color: Colors.transparent
                            ) : null, 
                            selected: indexSelectedTime == index,
                            selectedColor: Colors.blue,
                            backgroundColor: !isAvailable ? Theme.of(context).colorScheme.secondary : null,
                            showCheckmark: false,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border.fromBorderSide(
                        BorderSide(
                          color: Colors.blue
                        )
                      )
                    )
                  ),
                  SizedBox(width: 10),
                  Text("Available"),
                  SizedBox(width: 50),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red
                    )
                  ),
                  SizedBox(width: 10),
                  Text("Taken"),
                ],
              ),
              SizedBox(height: 8),
              isLoading ? Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                )
              ) : 
              Flexible(
                child: SeatLayout(
                  seatLayoutState: SeatLayoutState(
                    rows: widget.theater.sampleSeatsState.length,
                    cols: widget.theater.sampleSeatsState.first.length,
                    currentSeatsState: currentSeatsState
                  ), 
                  onSeatStateChanged: (row, col, currentSeatNumber, currentState) {
                    setState(() {
                      if (currentState == SeatState.selected) {
                        selectedSeats.add(Pair<int, int>(row, col));
                      } else {
                        selectedSeats.remove(Pair<int, int>(row, col));
                      }
                    });
                  },
                ),
              ),
              if(!isLoading) Align(
                alignment: Alignment.center,
                child: Text(
                  "SCREEN AREA",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              if(!isLoading) Divider(thickness: 2),
              SizedBox(height: 100)
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Theme.of(context).colorScheme.onPrimaryFixed,
              ),
              padding: EdgeInsets.only(top: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  selectedSeats.isNotEmpty
                    ? Text(
                        "Subtotal (${selectedSeats.length} ticket)",
                        style: Theme.of(context).textTheme.displaySmall,
                      ) 
                    : Text(
                        "Subtotal",
                        style: Theme.of(context).textTheme.displaySmall,
                      ) ,
                  SizedBox(height: 5),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(widget.theater.price * selectedSeats.length),
                    style: Theme.of(context).textTheme.displayLarge,
                  )
                ],
              )
            ),
          ),
          Positioned(
            right: 10,
            bottom: 30,
            child: ElevatedButton(
              onPressed: () {
                if(selectedSeats.isEmpty) return;

                for (var seat in selectedSeats) {
                  var (row, col) = seat();
                  currentSeatsState[row][col] = SeatState.sold;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentPage(
                    movie: widget.movie,
                    theater: widget.theater,
                    selectedDate: widget.selectedDate,
                    selectedTime: widget.availableTime[indexSelectedTime],
                    selectedSeats: selectedSeats,
                    currentSeatsState: currentSeatsState,
                    indexSelectedTime: indexSelectedTime,
                  ))
                );
                // widget.theater.currentSeatsState[widget.movie]![widget.selectedDate]![indexSelectedTime] = currentSeatsState;
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: selectedSeats.isEmpty ? Theme.of(context).colorScheme.secondary : Colors.blue,
                textStyle: Theme.of(context).textTheme.headlineMedium,
                padding: EdgeInsets.all(20),
                minimumSize: Size(200, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  )
                ),
              ),
              child: const Text("CHECKOUT"),
            ),
          )
        ],
      ),
    );
  }
}