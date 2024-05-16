import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsService {
  final CollectionReference students = FirebaseFirestore.instance.collection(
    'students',
  );

  Future<void> addStudent(
    String addmissionNo,
    String name,
    String attendance,
    String leave,
  ) {
    return students.add({
      'reg.no': addmissionNo,
      'name': name,
      'attendance': attendance,
      'leave': leave,
      'time': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> fetchStudents() {
    final getStudents = students.orderBy('time', descending: true).snapshots();
    return getStudents;
  }

  void editStudent(
    String docId,
    String addmissionNo,
    String name,
    String attendance,
    String leave,
  ) {
    students.doc(docId).update({
      'reg.no': addmissionNo,
      'name': name,
      'attendance': attendance,
      'leave': leave,
      'time': Timestamp.now(),
    });
  }
}
