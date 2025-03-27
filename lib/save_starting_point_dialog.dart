import 'package:flutter/material.dart';

class SaveStartingPointDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.white, width: 2), // Blue border
      ),
      title: const Text(
        "Save your Base Point",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Divider(color: Colors.grey), // Adds a subtle divider line
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 16),
          ),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Base Point saved successfully!")),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Black button
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
