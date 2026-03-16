import 'package:flutter/material.dart';
import '../models/pond.dart';
import '../screens/pond_detail_screen.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final List<String> ponds = [];

  void addPond() {
    setState(() {
      ponds.add("Pond ${ponds.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 Profile Header
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 236),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nicole Andrea",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        Text("Fish Farmer"),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications, color: const Color.fromARGB(255, 11, 71, 13)),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 🔹 Weather Card
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade200, Colors.blue.shade400],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Weather",
                            style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 8),
                        Text("34°C",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(height: 8),
                        Text("Quezon City, Philippines",
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    Icon(Icons.wb_sunny,
                        size: 50, color: Colors.yellow),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // 🔹 My Fish Ponds
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Fish Ponds",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  Text("See all",
                      style: 
                          TextStyle(color: Colors.green,
                         )),
                ],
              ),

              SizedBox(height: 12),

              Row(
                children: [
                  Chip(
                    label: const Text("Overview"),
                    backgroundColor: Color.fromARGB(255, 57, 43, 63),
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PondDetailScreen(
                            pond: Pond(name: "Pond 1"),
                          ),
                        ),
                      );
                    },
                    child: const Chip(label: Text("Pond 1")),
                  ),

                  const SizedBox(width: 8),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PondDetailScreen(
                            pond: Pond(name: "Pond 2"),
                          ),
                        ),
                      );
                    },
                    child: const Chip(label: Text("Pond 2")),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // 🔹 Sensors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sensors",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  Text("See all sensors",
                      style: TextStyle(color: Colors.green)),
                ],
              ),

              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sensorCard("231", "Online", Colors.green),
                  sensorCard("3", "Offline", Colors.grey),
                  sensorCard("12", "Low Batt", Colors.orange),
                ],
              ),

              SizedBox(height: 24),

              // 🔹 Water Temperature Section
              Text("Water Temperature",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                      color: Colors.white)),

              SizedBox(height: 12),

              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 136, 136, 173),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Chart Placeholder"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Updated Sensor Card
  Widget sensorCard(String number, String label, Color color) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), // light gray background
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: const Color.fromARGB(66, 70, 70, 70), blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(221, 13, 77, 33), // readable on gray
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color.computeLuminance() > 0.5 ? const Color.fromARGB(221, 255, 255, 255) : const Color.fromARGB(255, 9, 94, 23),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}