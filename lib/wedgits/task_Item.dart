import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String subject;
  final String title;
  final String date;
  final double h;

  const TaskItem({
    super.key,
    required this.subject,
    required this.title,
    required this.date,
    required this.h,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.025), // Adjusted for responsiveness
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF547792),
            ),
          ),
          SizedBox(height: h * 0.005),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: h * 0.005),
          Text(
            'Due: $date',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}