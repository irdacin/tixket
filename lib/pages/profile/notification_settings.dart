import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/providers/notification_provider.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              child: SwitchListTile(
                value: Provider.of<NotificationProvider>(context).selectedAppNotification,
                onChanged: (value) {
                  Provider.of<NotificationProvider>(context, listen: false).changeAppNotification(value);
                },
                activeColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                title: Text(
                  "In-app notification",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  "Get notification on tixket",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                inactiveThumbColor: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            const Divider(height: 20, thickness: 1,),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    value: Provider.of<NotificationProvider>(context).selectedRecomendedNotificationMovies,
                    onChanged: (value) {
                      Provider.of<NotificationProvider>(context, listen: false).changeRecommendedMoviesNotification(value);
                    },
                    activeColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Text(
                      "Recommended movies",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      "Notify me of movies I might like",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                    inactiveThumbColor: Colors.white,
                  ),
                  SwitchListTile(
                    value: Provider.of<NotificationProvider>(context).selectedUpdatedMoviesNotification,
                    onChanged: (value) {
                      Provider.of<NotificationProvider>(context, listen: false).changeUpdateMoviesNotification(value);
                    },
                    activeColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Text(
                      "Updated movies",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      "Notify me of new movies update and announcement",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}