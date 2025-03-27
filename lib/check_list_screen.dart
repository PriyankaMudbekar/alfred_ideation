import 'package:flutter/material.dart';
import '../custom_appbar.dart';
import 'move_alfred_screen.dart';

class ChecklistScreen extends StatefulWidget {
  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  bool _task1Completed = false;
  bool _task2Completed = false;
  bool _task3Completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Setup Alfred",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Please complete the checks before marking the tables with Alfred",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),

            // Task Card (Blue Outline)
            _buildChecklistCard(
              title: "Take Alfred to the Start point",
              value: _task1Completed,
              onChanged: (val) {
                setState(() {
                  _task1Completed = val;
                });
              },
              isBlueBorder: true,
            ),

            // Task Card (White Background)
            _buildChecklistCard(
              title: "Remove all wires or cables from the path",
              value: _task2Completed,
              onChanged: (val) {
                setState(() {
                  _task2Completed = val;
                });
              },
            ),

            // Task Card (White Background)
            _buildChecklistCard(
              title: "Take Alfred to the Start point",
              value: _task3Completed,
              onChanged: (val) {
                setState(() {
                  _task3Completed = val;
                });
              },
            ),

            Spacer(),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: (_task1Completed && _task2Completed && _task3Completed)
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoveAlfredScreen()),
                  );
                }
                    : null, // Disabled if tasks are not completed
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Checklist Item
  Widget _buildChecklistCard({
    required String title,
    required bool value,
    required Function(bool) onChanged,
    bool isBlueBorder = false,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isBlueBorder ? Colors.white : Colors.transparent, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (val) => onChanged(val!),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                activeColor: Colors.black,
              ),
              SizedBox(width: 8),
              Text(title, style: TextStyle(fontSize: 16)),
            ],
          ),
          Image.asset("assets/12.png", height: 40), // Replace with the actual Alfred icon
        ],
      ),
    );
  }
}
