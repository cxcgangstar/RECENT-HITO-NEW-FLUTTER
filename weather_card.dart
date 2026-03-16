import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFD7EEFF),
            Color(0xFF5AA9E6),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // LEFT SIDE TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Weather",
                  style: TextStyle(
                    color: Color.fromARGB(179, 0, 0, 0),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "34°C",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 61, 61, 61),
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Quezon City, Philippines",
                      style: TextStyle(
                        color: Color.fromARGB(179, 53, 53, 53),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // RIGHT SIDE ICON
          Stack(
            alignment: Alignment.center,
            children: const [
              Icon(
                Icons.wb_sunny,
                size: 100,
                color: Color(0xFFFFC107),
              ),
              Positioned(
                bottom: 6,
                right: 0,
                child: Icon(
                  Icons.cloud,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
