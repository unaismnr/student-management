import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_management/services/students_service.dart';
import 'package:student_management/utils/consts.dart';

class AddEditStudent extends StatefulWidget {
  const AddEditStudent({
    super.key,
    this.studentData,
  });

  final QueryDocumentSnapshot? studentData;

  @override
  State<AddEditStudent> createState() => _AddEditStudentState();
}

class _AddEditStudentState extends State<AddEditStudent> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late TextEditingController admissionController;
  late TextEditingController nameController;
  late TextEditingController attendanceController;
  late TextEditingController leaveController;

  @override
  void initState() {
    super.initState();
    admissionController =
        TextEditingController(text: widget.studentData?['admission'] ?? '');
    nameController =
        TextEditingController(text: widget.studentData?['name'] ?? '');
    attendanceController =
        TextEditingController(text: widget.studentData?['attendance'] ?? '');
    leaveController =
        TextEditingController(text: widget.studentData?['leave'] ?? '');
  }

  @override
  void dispose() {
    admissionController.dispose();
    nameController.dispose();
    attendanceController.dispose();
    leaveController.dispose();
    super.dispose();
  }

  final StudentsService studentsService = StudentsService();

  void addStudent() {
    final admission = admissionController.text.trim();
    final name = nameController.text.trim();
    final attendance = attendanceController.text.trim();
    final leave = leaveController.text.trim();
    studentsService.addStudent(
      admission,
      name,
      attendance,
      leave,
    );
  }

  void editStudent(docId) {
    final admission = admissionController.text.trim();
    final name = nameController.text.trim();
    final attendance = attendanceController.text.trim();
    final leave = leaveController.text.trim();
    studentsService.editStudent(
      docId,
      admission,
      name,
      attendance,
      leave,
    );
    studentsService.students.orderBy('time', descending: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.studentData == null ? 'Add Details' : 'Edit Details',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 0,
                    )
                  ]),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldContainer(
                      textController: admissionController,
                      hintText: 'Addmission No',
                    ),
                    kHeight10,
                    TextFieldContainer(
                      textController: nameController,
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                    ),
                    kHeight10,
                    TextFieldContainer(
                      textController: attendanceController,
                      hintText: 'Attendance',
                    ),
                    kHeight10,
                    TextFieldContainer(
                      textController: leaveController,
                      hintText: 'Leave',
                    ),
                    kHeight20,
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.studentData == null
                              ? addStudent()
                              : editStudent(widget.studentData!.id);
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(0),
                        minimumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height * 0.065),
                        ),
                        shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    required this.textController,
    required this.hintText,
    this.keyboardType = TextInputType.number,
  });

  final TextEditingController textController;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.25),
      ),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter Details';
          }
          return null;
        },
      ),
    );
  }
}
