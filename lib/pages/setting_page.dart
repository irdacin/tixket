import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notifications",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(
              height: 20, 
              thickness: 1
            ),
            Text(
              "Appearance",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Divider(
              height: 20, 
              thickness: 1
            ),
            SwitchListTile(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              activeColor: Colors.blue,
              title: Text("Dark Mode"),
              inactiveTrackColor: Colors.grey[400],
              inactiveThumbColor: Colors.white,
            )

          ],
        ),
      ),
    );
  }
}