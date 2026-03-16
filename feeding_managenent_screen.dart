import 'package:flutter/material.dart';

class FishFeederScreen extends StatefulWidget {
  const FishFeederScreen({super.key});

  @override
  State<FishFeederScreen> createState() => _FishFeederScreenState();
}

class _FishFeederScreenState extends State<FishFeederScreen> {
  bool feederEnabled = false; // 👈 ADD THIS


  double feedWeight = 5; // grams
  TimeOfDay feedingTime = const TimeOfDay(hour: 8, minute: 0);

  Future<void> _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: feedingTime,
    );

    if (time != null) {
      setState(() {
        feedingTime = time;
      });
    }
  }

  void _feedNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Feeding started 🐟")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: const Text("Fish Feeding Management"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feeder Toggle
            SwitchListTile(
              title: const Text("Enable Automated Feeder"),
              value: feederEnabled,
              onChanged: (value) {
                setState(() {
                  feederEnabled = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Feed Weight
            Text(
              "Feed Weight: ${feedWeight.toInt()} g",
              style: const TextStyle(fontSize: 16),
            ),
            Slider(
              value: feedWeight,
              min: 1,
              max: 50,
              divisions: 49,
              label: "${feedWeight.toInt()} g",
              onChanged: (value) {
                setState(() {
                  feedWeight = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Feeding Time
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text("Feeding Time"),
              subtitle: Text(feedingTime.format(context)),
              trailing: const Icon(Icons.edit),
              onTap: _pickTime,
            ),

            const SizedBox(height: 30),

            // Feed Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.restaurant),
                label: const Text("Feed Now"),
                onPressed: feederEnabled ? _feedNow : null,
              ),
            ),

            const SizedBox(height: 16),

            // Status
            Text(
              feederEnabled
                  ? "Status: Automated feeding is ON"
                  : "Status: Feeder is OFF",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: feederEnabled ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
