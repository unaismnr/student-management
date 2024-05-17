import 'package:flutter/material.dart';

class Marks extends StatelessWidget {
  const Marks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marks',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ),
      body: const Center(
        child: Text('No Data'),
      ),
    );
  }
}
