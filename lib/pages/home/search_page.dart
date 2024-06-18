import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search Film');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'type in film name...',
                        hintStyle: TextStyle(
                          color: Color(0xff858484),
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      // style: TextStyle(
                      //   color: Colors.black,
                      // ),
                    ),
                  );
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Result: ",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Popular in Tixket: "),
              SizedBox(
                height: 15,
              ),
              InputChip(
                label: Text("Avengers: Endgame"),
              ),
              SizedBox(
                height: 10,
              ),
              InputChip(label: Text("Starwars: The rise of skywalker")),
              SizedBox(
                height: 10,
              ),
              InputChip(label: Text("Godzilla: King of the Monster")),
            ],  
          )
        ],
      ),
    );
  }
}