import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/providers/theme_provider.dart';

class AppearanceSettings extends StatelessWidget {
  const AppearanceSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appearance"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose your appearance",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              child: Column(
                children: [
                  RadioListTile(
                    value: "Device Settings", 
                    groupValue: Provider.of<ThemeProvider>(context).currentTheme, 
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false).setTheme(value!);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Text(
                      "Use your device settings",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      "Customize the display by following the settings on your device.",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    activeColor: Colors.blue,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile(
                    value: "Light Theme", 
                    groupValue: Provider.of<ThemeProvider>(context).currentTheme, 
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false).setTheme(value!);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Text(
                      "Light Theme",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      "Display with bright colors, suitable for use in daytime or bright places.",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    activeColor: Colors.blue,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile(
                    value: "Dark Theme", 
                    groupValue: Provider.of<ThemeProvider>(context).currentTheme, 
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false).setTheme(value!);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Text(
                      "Dark Theme",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      "Display with dark colors, suitable for use at night or dark places.",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    activeColor: Colors.blue,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}