import 'package:flutter/material.dart';

class StudentsList extends StatelessWidget {
  final bool iconChange;
  const StudentsList({
    super.key,
    required this.iconChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                backgroundColor: Theme.of(context).colorScheme.background,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              title: Text(
                'Unais Unu',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              trailing: Icon(
                iconChange
                    ? Icons.arrow_forward_ios_rounded
                    : Icons.delete_rounded,
                size: 20,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            );
          },
          itemCount: 20),
    );
  }
}
