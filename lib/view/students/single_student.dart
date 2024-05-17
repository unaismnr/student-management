import 'package:flutter/material.dart';
import 'package:student_management/services/students_service.dart';
import 'package:student_management/utils/consts.dart';

class SingleStudent extends StatelessWidget {
  final int index;
  SingleStudent({super.key, required this.index});

  final StudentsService studentsService = StudentsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
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
              child: StreamBuilder(
                  stream: studentsService.fetchStudents(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final studentData = snapshot.data!.docs[index];
                      return Column(
                        children: [
                          DetailsContainer(
                              title: '', data: studentData['admission']),
                          kHeight10,
                          DetailsContainer(
                              title: '', data: studentData['name']),
                          kHeight10,
                          DetailsContainer(
                              title: 'Attendance:',
                              data: studentData['attendance']),
                          kHeight10,
                          DetailsContainer(
                              title: 'Leave:', data: studentData['leave']),
                          kHeight10,
                        ],
                      );
                    } else if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('No Data'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  final customBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: mainColor),
  );
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key, required this.data, required this.title});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Center(
          child: Text(
            '$title $data',
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}

class EditDeleteButtons extends StatelessWidget {
  const EditDeleteButtons({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: const TextStyle(fontSize: 17),
      ),
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        minimumSize: MaterialStatePropertyAll(
          Size(MediaQuery.of(context).size.width * 0.060,
              MediaQuery.of(context).size.height * 0.060),
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.red,
        ),
      ),
    );
  }
}
