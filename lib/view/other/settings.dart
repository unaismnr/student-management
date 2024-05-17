import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controllers/theme_provider.dart';
import 'package:student_management/utils/consts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Center(
            child: ListTile(
              leading: Icon(
                Icons.color_lens_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Theme',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              trailing: Switch(
                  activeColor: Theme.of(context).iconTheme.color,
                  activeTrackColor: mainColor,
                  inactiveTrackColor: Theme.of(context).iconTheme.color,
                  value: themeProvider.isDark,
                  onChanged: (value) {
                    themeProvider.themeChange();
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
