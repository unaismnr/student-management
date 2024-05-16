import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_management/utils/consts.dart';

class SingleStudent extends StatelessWidget {
  final QueryDocumentSnapshot studentDate;
  const SingleStudent({
    super.key,
    required this.studentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          studentDate['name'],
          style: const TextStyle(
            color: kWhiteColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
