import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_management/services/students_service.dart';
import 'package:student_management/utils/consts.dart';
import 'package:student_management/view/common/navigation_helper.dart';
import 'package:student_management/view/students/single_student.dart';
import 'package:student_management/view/students/widgets/add_edit_student.dart';

class AllStudents extends StatelessWidget {
  AllStudents({super.key});

  final StudentsService studentsService = StudentsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
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
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ]),
                child: StreamBuilder<QuerySnapshot>(
                    stream: studentsService.fetchStudents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
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
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Something Error'),
                        );
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index];
                            return ListTile(
                              onTap: () {
                                NavigationHelper.push(
                                  context,
                                  SingleStudent(
                                    index: index,
                                  ),
                                );
                              },
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
                              subtitle: Text(
                                'Admission: ${data['admission']}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  customBottomSheet(context, data.id, data);
                                },
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
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

  Future<dynamic> customBottomSheet(
    BuildContext context,
    String docId,
    QueryDocumentSnapshot studentData,
  ) {
    return showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height / 5.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  kHeight10,
                  ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      'Edit Datails',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      NavigationHelper.push(
                        context,
                        AddEditStudent(
                          studentData: studentData,
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.delete,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      'Delete Details',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    onTap: () {
                      studentsService.deleteStudent(docId);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ));
  }
}
