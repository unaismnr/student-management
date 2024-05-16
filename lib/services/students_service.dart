import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsService {
  final CollectionReference students = FirebaseFirestore.instance.collection(
    'students',
  );

  Future<void> addStudent(
    double regNo,
    String name,
    double attendance,
  ) {
    return students.add({
      'reg.no': regNo,
      'name': name,
      'attendance': attendance,
      'time': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> fetchStudents() {
    final getStudents = students.orderBy('time').snapshots();
    return getStudents;
  }
}
