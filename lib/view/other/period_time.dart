import 'package:flutter/material.dart';

class PeriodTime extends StatelessWidget {
  const PeriodTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Period Time',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ),
      body: const Center(
        child: Text('Not Available'),
      ),
    );
  }
}
