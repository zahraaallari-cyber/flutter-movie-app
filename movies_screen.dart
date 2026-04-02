import 'package:flutter/material.dart';
import 'booking_screen.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  List<String> movies = [
    "Avatar",
    "Batman",
    "Joker",
    "Spiderman",
    "Titanic",
    "Frozen"
  ];

  String search = "";

  @override
  Widget build(BuildContext context) {

    List<String> filtered = movies
        .where((m) => m.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFF021633),

      appBar: AppBar(
        backgroundColor: Color(0xFF05254A),
        title: Text("Movies", style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search movie...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              itemCount: filtered.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookingScreen(
                          movieName: filtered[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.blueGrey,
                    child: Center(
                      child: Text(filtered[index],
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}