import 'package:flutter/material.dart';
import 'package:tixket/models/user_model.dart';
import 'package:tixket/providers/user_provider.dart';

class NotificationProvider extends ChangeNotifier {
  final UserProvider _userProvider;

  NotificationProvider(this._userProvider);

  User? get currentUser => _userProvider.currentUser;

  bool get selectedAppNotification => currentUser?.notification?["Selected App Notification"] ?? true;
  bool get selectedRecommendedNotificationMovies => currentUser?.notification?["Selected Recommended Movies Notification"] ?? true;
  bool get selectedUpdatedMoviesNotification => currentUser?.notification?["Selected Updated Movies Notification"] ?? true;

  void changeAppNotification(bool value) {
    currentUser!.notification ??= {};
    currentUser!.notification = Map<String, bool>.from(currentUser!.notification!);
    currentUser!.notification!["Selected App Notification"] = value;

    if (!(currentUser!.notification!["Selected App Notification"] ?? true)) {
      currentUser!.notification!["Selected Recommended Movies Notification"] = false;
      currentUser!.notification!["Selected Updated Movies Notification"] = false;
    } else if (currentUser!.notification!["Selected App Notification"]! &&
        !(currentUser!.notification!["Selected Recommended Movies Notification"] ?? true) &&
        !(currentUser!.notification!["Selected Updated Movies Notification"] ?? true)) {
      currentUser!.notification!["Selected Recommended Movies Notification"] = true;
      currentUser!.notification!["Selected Updated Movies Notification"] = true;
    }

    notifyListeners();
  }

  void changeRecommendedMoviesNotification(bool value) {
    currentUser!.notification ??= {};
    currentUser!.notification = Map<String, bool>.from(currentUser!.notification!);
    currentUser!.notification!["Selected Recommended Movies Notification"] = value;

    if ((currentUser!.notification!["Selected Recommended Movies Notification"] ?? true) &&
        !(currentUser!.notification!["Selected App Notification"] ?? true)) {
      currentUser!.notification!["Selected App Notification"] = true;
    } else if (!(currentUser!.notification!["Selected Recommended Movies Notification"] ?? true) &&
        !(currentUser!.notification!["Selected Updated Movies Notification"] ?? true)) {
      currentUser!.notification!["Selected App Notification"] = false;
    }

    notifyListeners();
  }

  void changeUpdateMoviesNotification(bool value) {
    currentUser!.notification ??= {};
    currentUser!.notification = Map<String, bool>.from(currentUser!.notification!);
    currentUser!.notification!["Selected Updated Movies Notification"] = value;

    if ((currentUser!.notification!["Selected Updated Movies Notification"] ?? true) &&
        !(currentUser!.notification!["Selected App Notification"] ?? true)) {
      currentUser!.notification!["Selected App Notification"] = true;
    } else if (!(currentUser!.notification!["Selected Recommended Movies Notification"] ?? true) &&
        !(currentUser!.notification!["Selected Updated Movies Notification"] ?? true)) {
      currentUser!.notification!["Selected App Notification"] = false;
    }

    notifyListeners();
  }
}