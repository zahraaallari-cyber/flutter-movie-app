import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String movieName;

  BookingScreen({required this.movieName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  List<int> selectedSeats = [];
  List<int> reservedSeats = [1, 5, 7, 12, 15];

  String selectedTime = "";
  String selectedDay = "";

  List<String> times = ["10:00", "1:00", "4:00", "7:00"];
  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF021633),

      appBar: AppBar(
        backgroundColor: Color(0xFF05254A),
        title: Text(widget.movieName,
            style: TextStyle(color: Colors.white)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20),

            
            Text("Choose Seats",
                style: TextStyle(color: Colors.white, fontSize: 18)),

            Wrap(
              spacing: 8,
              children: List.generate(20, (index) {

                bool isReserved = reservedSeats.contains(index);
                bool isSelected = selectedSeats.contains(index);

                Color color;
                if (isReserved) {
                  color = Colors.red;
                } else if (isSelected) {
                  color = Colors.green;
                } else {
                  color = Colors.white;
                }

                return GestureDetector(
                  onTap: () {
                    if (!isReserved) {
                      setState(() {
                        if (isSelected) {
                          selectedSeats.remove(index);
                        } else {
                          selectedSeats.add(index);
                        }
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    width: 30,
                    height: 30,
                    color: color,
                  ),
                );
              }),
            ),

            SizedBox(height: 20),

            ///  Time
            Text("Select Time",
                style: TextStyle(color: Colors.white)),

            Wrap(
              spacing: 10,
              children: times.map((t) {
                bool selected = selectedTime == t;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = t;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: selected ? Colors.green : Colors.white,
                    child: Text(t),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            ///  Days
            Text("Select Day",
                style: TextStyle(color: Colors.white)),

            Wrap(
              spacing: 10,
              children: days.map((d) {
                bool selected = selectedDay == d;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDay = d;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: selected ? Colors.green : Colors.white,
                    child: Text(d),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 30),

            ///  Confirm
            ElevatedButton(
              onPressed: () {
                if (selectedSeats.isNotEmpty &&
                    selectedTime != "" &&
                    selectedDay != "") {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Success"),
                      content: Text("Booking Confirmed"),
                    ),
                  );
                }
              },
              child: Text("Confirm Booking"),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}