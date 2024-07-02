import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pair/pair.dart';
import 'package:provider/provider.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/models/theater_model.dart';
import 'package:tixket/pages/home/payment_methods_page.dart';
import 'package:tixket/pages/home/payment_success_page.dart';
import 'package:tixket/providers/payment_method_provider.dart';
import 'package:tixket/utils/seat_state.dart';

class PaymentPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/${movie.fileName}",
                      fit: BoxFit.fitHeight,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7 - 60,
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            movie.title,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Flexible(
                          child: Text(
                            theater.name,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 60,
                              child: Text("Date")
                            ),
                            Expanded(
                              child: Text(DateFormat("E, d MMM yyyy").format(selectedDate))
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 60,
                              child: Text("Time"),
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
                            const SizedBox(
                              width: 60,
                              child: Text("Seats")
                            ),
                            Expanded(
                              child: Text(
                                selectedSeats.map((seat) {
                                  var (row, col) = seat();
                                  return "${String.fromCharCode(row + 65)}${col + 1}";
                                }).join(", ").toString(),
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Flexible(
                          child: Text(
                            "${selectedSeats.length.toString()} tickets",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ticket Price"),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(theater.price * selectedSeats.length),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Adm Fee"),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(3000),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payment",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(theater.price * selectedSeats.length + 3000),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 20),
              const Text("Pay with"),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PaymentMethodsPage())
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Provider.of<PaymentMethodProvider>(context).selectedPaymentMethod == null ? const Icon(Icons.payment) : Image.asset("assets/images/${Provider.of<PaymentMethodProvider>(context).selectedPaymentMethod!.fileName}", width: 50),
                title: Text(
                  Provider.of<PaymentMethodProvider>(context).selectedPaymentMethod == null ? "Select payment method" : Provider.of<PaymentMethodProvider>(context).selectedPaymentMethod!.name,
                  style: Provider.of<PaymentMethodProvider>(context).selectedPaymentMethod == null ? Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.red) : Theme.of(context).textTheme.displayLarge,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if(Provider.of<PaymentMethodProvider>(context, listen: false).selectedPaymentMethod == null) return;

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => PaymentSuccessPage(
                      movie: movie,
                      theater: theater,
                      selectedDate: selectedDate,
                      selectedTime: selectedTime,
                      selectedSeats: selectedSeats,
                    ))
                  );
                  theater.currentSeatsState[movie]![selectedDate]![indexSelectedTime] = currentSeatsState;
                }, 
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Provider.of<PaymentMethodProvider>(context).selectedPaymentMethod != null ? Colors.blue : Theme.of(context).colorScheme.secondary,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                child: const Text("PAY"),
              )
            ],
          ),
        ),
      ),
    );
  }
}