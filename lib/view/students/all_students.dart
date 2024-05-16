import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_management/services/students_service.dart';
import 'package:student_management/utils/consts.dart';

class AllStudents extends StatelessWidget {
  AllStudents({super.key});

  final StudentsService studentsService = StudentsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Students',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ]),
                child: StreamBuilder<QuerySnapshot>(
                    stream: studentsService.fetchStudents(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index];
                            return ListTile(
                              onTap: () {},
                              leading: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                                child: Icon(
                                  Icons.person,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              title: Text(
                                data['name'],
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
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
            )
          ],
        ),
      ),
    );
  }
}
