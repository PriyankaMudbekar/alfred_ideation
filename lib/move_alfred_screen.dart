import 'package:flutter/material.dart';
import 'custom_appbar.dart';
import 'save_starting_point_dialog.dart';

class MoveAlfredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(), // Using the updated CustomAppBar
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10), // Moved title up

          // Title
          const Text(
            "Mark Base Point",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),

          // Subtitle
          const Text(
            "Place Alfred at the Base point to start marking",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),

          // Larger Image
          const Center(
            child: Image(
              image: AssetImage("assets/1234.png"),
              height: 320, // Increased size
            ),
          ),
          const SizedBox(height: 50),

          // Button
          SizedBox(
            width: 400,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SaveStartingPointDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
              ),
              child: const Text(
                "I am at the Base Point",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
