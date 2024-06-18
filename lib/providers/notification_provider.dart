import 'package:flutter/material.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/update_user_detail.dart';

class NotificationProvider extends ChangeNotifier {
  bool _selectedAppNotification = currentUser!.notification["Selected App Notification"] ?? true;
  bool _selectedRecommendedMoviesNotification = currentUser!.notification["Selected Recommended Movies Notification"] ?? true;
  bool _selectedUpdatedMoviesNotification = currentUser!.notification["Selected Updated Movies Notification"] ?? true; 

  bool get selectedAppNotification => currentUser!.notification["Selected App Notification"] ?? true;
  bool get selectedRecomendedNotificationMovies => currentUser!.notification["Selected Recommended Movies Notification"] ?? true;
  bool get selectedUpdatedMoviesNotification => currentUser!.notification["Selected Updated Movies Notification"] ?? true;

  void changeAppNotification(bool value) {
    _selectedAppNotification = value;
    if(!_selectedAppNotification) {
      _selectedRecommendedMoviesNotification = false;
      _selectedUpdatedMoviesNotification = false;
    }
    else if(_selectedAppNotification && !_selectedRecommendedMoviesNotification && !_selectedUpdatedMoviesNotification) {
      _selectedRecommendedMoviesNotification = true;
      _selectedUpdatedMoviesNotification = true;
    }

    updateNotification();
  }

  void changeRecommendedMoviesNotification(bool value) {
    _selectedRecommendedMoviesNotification = value;
    if(_selectedRecommendedMoviesNotification && !_selectedAppNotification) {
      _selectedAppNotification = true;
    }
    else if(!_selectedRecommendedMoviesNotification && !_selectedUpdatedMoviesNotification) {
      _selectedAppNotification = false;
    }

    updateNotification();
  }

  void changeUpdateMoviesNotification(bool value) {
    _selectedUpdatedMoviesNotification = value;
    if(_selectedUpdatedMoviesNotification && !_selectedAppNotification) {
      _selectedAppNotification = true;
    }
    else if(!_selectedRecommendedMoviesNotification && !_selectedUpdatedMoviesNotification) {
      _selectedAppNotification = false;
    }

    updateNotification();
  }

  void updateNotification() {
    Map<String, bool> currentNotification = Map.from(currentUser!.notification);
    currentNotification["Selected App Notification"] = _selectedAppNotification;
    currentNotification["Selected Recommended Movies Notification"] = _selectedRecommendedMoviesNotification;
    currentNotification["Selected Updated Movies Notification"] = _selectedUpdatedMoviesNotification;

    UpdateUserDetail().updateNotification(currentUser!.username, currentNotification);
    notifyListeners();
  }
}