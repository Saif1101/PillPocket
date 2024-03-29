import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final DateTime dateTime;

  const DateCard({
    required this.dateTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
      ),
    );
  }
}
