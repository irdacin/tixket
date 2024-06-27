import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tixket/data/theater_data.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/pages/home/select_seat_page.dart';
import 'package:tixket/providers/favorite_movie_provider.dart';

class BuyMoviePage extends StatefulWidget {
  final Movie movie;

  const BuyMoviePage({
    super.key, 
    required this.movie
  });

  @override
  State<BuyMoviePage> createState() => _BuyMoviePageState();
}

class _BuyMoviePageState extends State<BuyMoviePage> {
  TextEditingController datePickerController = TextEditingController();
  DateTime? pickedDate;
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    bool isFavorite = Provider.of<FavoriteMovieProvider>(context).favoriteMovie.any((element) => element == widget.movie);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context, 
                builder: (context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, 
                              icon: const Icon(Icons.close)
                            ),
                            Text(
                              "Share this movie",
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.movie.title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/${widget.movie.fileName}"),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  const CircleAvatar(
                                    child: Icon(Icons.link),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Copy Link",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  const CircleAvatar(
                                    child: Icon(Icons.abc_outlined),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Whatsapp",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  const CircleAvatar(
                                    child: Icon(Icons.abc_outlined),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Whatsapp",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  const CircleAvatar(
                                    child: Icon(Icons.abc_outlined),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Whatsapp",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  const CircleAvatar(
                                    child: Icon(Icons.abc_outlined),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Whatsapp",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            tooltip: "Share",
            icon: const Icon(
              Icons.share_outlined,
              size: 25,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/4.5,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("assets/images/${widget.movie.fileName}"),
                fit: BoxFit.cover,
                opacity: 0.6
              ),
            ),
            child: Hero(
              tag: widget.movie.title,
              child: Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        widget.movie.title,
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: (){
                          if(!isFavorite) {
                            Provider.of<FavoriteMovieProvider>(context, listen: false).addMovie(widget.movie);
                          } else {
                            Provider.of<FavoriteMovieProvider>(context, listen: false).removeMovie(widget.movie);
                          }
                        },
                        tooltip: !isFavorite ? "Add to favorite" : "Remove from favorite",
                        icon: Icon( 
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color: isFavorite ? Colors.red : null,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
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
          const SizedBox(height: 10),
          if(pickedDate != null)
            isLoading 
              ? Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: const CircularProgressIndicator(
                  color: Colors.blue,
                )
              )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: theaters.map((theater) {
                        return Card(
                          color: Theme.of(context).cardColor,
                          elevation: 2,
                          shape: const RoundedRectangleBorder(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      theater.name.toUpperCase(),
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp ',
                                        decimalDigits: 0,
                                      ).format(theater.price)
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  clipBehavior: Clip.hardEdge,
                                  children: theater.availableTime.asMap().entries.map((e) {
                                    bool isAvailable = DateTime.now().day != pickedDate!.day || DateTime.now().day == pickedDate!.day && DateTime.now().hour * 60 + DateTime.now().minute < e.value.hour * 60 + e.value.minute;
                                    return InkWell(
                                      onTap: isAvailable ? () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => SelectSeatPage(
                                            movie: widget.movie, 
                                            theater: theater,
                                            selectedDate: pickedDate!,
                                            indexSelectedTime: e.key,
                                            availableTime: theater.availableTime,
                                          ))
                                        );
                                      } : null,
                                      child: Container(
                                        width: (MediaQuery.of(context).size.width - 70) / 4 ,
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
                      }).toList(),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}