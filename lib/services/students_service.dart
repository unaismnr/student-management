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
      'admission': addmissionNo,
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

  Future<void> editStudent(
    String docId,
    String addmissionNo,
    String name,
    String attendance,
    String leave,
  ) async {
    await students.doc(docId).update({
      'admission': addmissionNo,
      'name': name,
      'attendance': attendance,
      'leave': leave,
      'editedTime': Timestamp.now(),
    });
  }

  Future<void> deleteStudent(String docId) async {
    await students.doc(docId).delete();
  }
}
