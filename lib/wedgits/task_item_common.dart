import 'package:flutter/material.dart';

class TaskItemCommon extends StatelessWidget {
  final String subject;
  final String title;
  final String date;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;

   TaskItemCommon({
    super.key,
    required this.subject,
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject, style:  TextStyle(fontSize: 14, color: Color(0xFF547792))),
                 SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 4),
                Text('Due: $date', style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
          Checkbox(
            value: isCompleted,
            onChanged: onChanged,
            activeColor:  Color(0xFF547792),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ],
      ),
    );
  }
}