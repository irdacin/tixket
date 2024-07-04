import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tixket/data/theater_data.dart';
import 'package:tixket/models/theater_model.dart';
import 'package:tixket/pages/home/booking_history_page.dart';
import 'package:tixket/pages/home/favorite_page.dart';
import 'package:tixket/pages/home/offer_page.dart';
import 'package:tixket/pages/theater/theater_detail_page.dart';

class TheaterPage extends StatelessWidget {
  const TheaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theaters"),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              size: 28,
            ),
            offset: const Offset(0, 50),
            elevation: 20,
            shadowColor: Theme.of(context).colorScheme.secondary,
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const FavoritePage())
                    );
                  },
                  leading: const Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Favorite",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const BookingHistoryPage())
                    );
                  },
                  leading: const Icon(
                    Icons.history,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Booking History",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const OfferPage())
                    );
                  },
                  leading: const Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Offer",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),
          itemCount: theaters.length,
          itemBuilder: (context, index) {
            Theater theater = theaters[index];
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TheaterDetailPage(theater: theater))
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(FontAwesomeIcons.t)
              ),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              title: Text(
                theater.name.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
        ),
      )
    );
  }
}