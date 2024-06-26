import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controllers/time_provider.dart';
import 'package:student_management/utils/consts.dart';
import 'package:student_management/view/common/navigation_helper.dart';
import 'package:student_management/view/other/alerts.dart';
import 'package:student_management/view/other/exams.dart';
import 'package:student_management/view/other/marks.dart';
import 'package:student_management/view/students/widgets/add_edit_student.dart';
import 'package:student_management/view/students/all_students.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final timeProvider = Provider.of<TimeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height / 3.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                height: size.height / 5,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: size.height * 0.18,
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, 10),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time, size: 65),
                    kWidth10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getGreeting(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          DateFormat.jm().format(timeProvider.currentTime),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: HomeGridView()),
        ],
      ),
    );
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 20) {
      return 'Good Evening';
    }
    return 'Good Night';
  }
}

class HomeGridView extends StatelessWidget {
  HomeGridView({super.key});

  final List gridviewList = [
    {
      'icon': Icons.groups_2_outlined,
      'title': 'Students',
    },
    {
      'icon': Icons.person_add_outlined,
      'title': 'Add',
    },
    {
      'icon': Icons.fact_check_outlined,
      'title': 'Marks',
    },
    {
      'icon': Icons.how_to_reg_outlined,
      'title': 'Attendance',
    },
    {
      'icon': Icons.logout,
      'title': 'Leave',
    },
    {
      'icon': Icons.campaign_outlined,
      'title': 'Alerts',
    },
    {
      'icon': Icons.edit_note,
      'title': 'Edit',
    },
    {
      'icon': Icons.delete_outline,
      'title': 'Delete',
    },
    {
      'icon': Icons.edit_square,
      'title': 'Exams',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: gridviewList.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final items = gridviewList[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 10),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).cardColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  if (items['title'] == 'Students') {
                    NavigationHelper.push(
                      context,
                      AllStudents(),
                    );
                  } else if (items['title'] == 'Add') {
                    NavigationHelper.push(
                      context,
                      const AddEditStudent(),
                    );
                  } else if (items['title'] == 'Marks') {
                    NavigationHelper.push(
                      context,
                      const Marks(),
                    );
                  } else if (items['title'] == 'Attendance') {
                    NavigationHelper.push(
                      context,
                      AllStudents(),
                    );
                  } else if (items['title'] == 'Leave') {
                    NavigationHelper.push(
                      context,
                      AllStudents(),
                    );
                  } else if (items['title'] == 'Alerts') {
                    NavigationHelper.push(
                      context,
                      const Alerts(),
                    );
                  } else if (items['title'] == 'Edit') {
                    NavigationHelper.push(
                      context,
                      AllStudents(),
                    );
                  } else if (items['title'] == 'Delete') {
                    NavigationHelper.push(
                      context,
                      AllStudents(),
                    );
                  } else if (items['title'] == 'Exams') {
                    NavigationHelper.push(
                      context,
                      const Exams(),
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      items['icon'],
                      size: 35,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    Text(
                      items['title'],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
