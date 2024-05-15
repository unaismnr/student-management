import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/utils/consts.dart';

class DeleteStudentsList extends StatelessWidget {
  const DeleteStudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Delete Students',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            kHeight20,
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: CupertinoSearchTextField(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
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
                ),
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
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
                          'Unais Unu',
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        ),
                        trailing: Icon(
                          Icons.delete,
                          size: 25,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      );
                    },
                    itemCount: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
