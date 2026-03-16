import 'package:flutter/material.dart';
import '../models/pond.dart';
import '../screens/pond_detail_screen.dart';

class PondCard extends StatelessWidget {
  final Pond pond;

  const PondCard({super.key, required this.pond});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PondDetailScreen(pond: pond),
          ),
        );
      },
      child: Container(
        // 🔵 YOUR EXISTING DESIGN HERE
      ),
    );
  }
}
