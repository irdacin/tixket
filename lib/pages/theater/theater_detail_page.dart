import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tixket/data/movie_data.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/models/theater_model.dart';
import 'package:tixket/pages/movie/movie_detail_page.dart';
import 'package:tixket/pages/movie/select_seat_page.dart';

class TheaterDetailPage extends StatefulWidget {
  final Theater theater;
  final bool showBuyList;

  const TheaterDetailPage({
    super.key, 
    required this.theater,
    this.showBuyList = true
  });

  @override
  State<TheaterDetailPage> createState() => _TheaterDetailPageState();
}

class _TheaterDetailPageState extends State<TheaterDetailPage> {
  TextEditingController datePickerController = TextEditingController();
  DateTime? pickedDate;
  bool isLoading = false;
  List<Movie> playingNowMovies = movies.where((element) => element.type == "Playing Now").toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theater's Detail"),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.theater.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(widget.theater.location),
                Text(widget.theater.address),
                const SizedBox(height: 10),
                Text("Phone: ${widget.theater.phone}"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: widget.showBuyList,
            child: Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary)
          ),
          Visibility(
            visible: widget.showBuyList,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Date"),
                  const SizedBox(height: 5),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                    ),
                    child: TextField(
                      controller: datePickerController,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ),
                        prefixIcon: const Icon(Icons.calendar_month),
                        hintText: "Choose Date"
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context, 
                          initialDate: pickedDate ?? DateTime.now(), 
                          firstDate: DateTime.now(), 
                          currentDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          builder: (context, widget){
                            ThemeData theme = Theme.of(context).brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light();
                            return Theme(
                              data: theme.copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: Colors.blue,
                                  surface: Theme.of(context).scaffoldBackgroundColor,
                                  onSurface: Theme.of(context).textTheme.bodyLarge!.color!,
                                ),
                                dividerTheme: DividerThemeData(
                                  color: Theme.of(context).colorScheme.secondary
                                )
                              ), 
                              child: widget!
                            );
                          }
                        );
                        
                        if(selectedDate == null) return;
                        datePickerController.text = DateFormat("dd/MM/yyyy").format(selectedDate);
                        setState(() {
                          pickedDate = selectedDate;
                          isLoading = true;
                        });
                        await Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(pickedDate != null)
            isLoading 
              ? Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: const CircularProgressIndicator(
                  color: Colors.blue,
                )
              )
              : Flexible(
            child: ListView.builder(
              itemCount: playingNowMovies.length,
              itemBuilder: (context, index) {
                Movie movie = playingNowMovies[index];
                return Card(
                  elevation: 5,
                  color: Theme.of(context).cardColor,
                  margin: const EdgeInsets.all(15),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie, showBuyButton: false))
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/${movie.fileName}"),
                                    fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  padding: const EdgeInsets.only(top: 10, left: 10),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              for(int i=0; i<5; i++) 
                                                Icon(
                                                  i < movie.star.toInt() ? Icons.star : i.toDouble() < movie.star ? Icons.star_half : Icons.star_border,
                                                  color: const Color(0xfff7d300),
                                                ),
                                              const SizedBox(width: 5),
                                              Text(
                                                movie.star.toStringAsFixed(1),
                                                style: const TextStyle(
                                                  color: Color(0xfff7d300)
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: Text(
                                          NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0,
                                          ).format(widget.theater.price),
                                          style: Theme.of(context).textTheme.headlineSmall,
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),                        
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          clipBehavior: Clip.hardEdge,
                          children: widget.theater.availableTime.asMap().entries.map((e) {
                            bool isAvailable = DateTime.now().day != pickedDate!.day || DateTime.now().day == pickedDate!.day && DateTime.now().hour * 60 + DateTime.now().minute < e.value.hour * 60 + e.value.minute;
                            return InkWell(
                              onTap: isAvailable ? () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => SelectSeatPage(
                                    movie: movie, 
                                    theater: widget.theater,
                                    selectedDate: pickedDate!,
                                    indexSelectedTime: e.key,
                                    availableTime: widget.theater.availableTime,
                                  ))
                                );
                              } : null,
                              child: Container(
                                width: (MediaQuery.of(context).size.width - 90) / 4 ,
                                padding: const EdgeInsets.all(10),
                                decoration: isAvailable 
                                  ? BoxDecoration(
                                    border: Border.fromBorderSide(
                                      BorderSide(
                                        color: Theme.of(context).colorScheme.primary
                                      )
                                    ),
                                    borderRadius: BorderRadius.circular(8)
                                  )
                                  : BoxDecoration(
                                    color: Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                child: Text(
                                  "${e.value.hour.toString().padLeft(2, '0')}:${e.value.minute.toString().padLeft(2, '0')}",
                                  textAlign: TextAlign.center,
                                  style: isAvailable ? Theme.of(context).textTheme.bodySmall : Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
                                ),
                              )
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}