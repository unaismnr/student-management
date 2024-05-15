import 'package:flutter/material.dart';

ValueNotifier selectedIndexNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (context, newIndex, _) {
          return NavigationBar(
            selectedIndex: newIndex,
            onDestinationSelected: (value) =>
                selectedIndexNotifier.value = value,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.timer),
                label: 'Time',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        });
  }
}
