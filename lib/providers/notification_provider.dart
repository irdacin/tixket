import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  bool _selectedAppNotification = true;
  bool get selectedAppNotification => _selectedAppNotification;

  bool _selectedRecommendedMoviesNotification = true;
  bool get selectedRecomendedNotificationMovies => _selectedRecommendedMoviesNotification;

  bool _selectedUpdatedMoviesNotification = true;
  bool get selectedUpdatedMoviesNotification => _selectedUpdatedMoviesNotification;
  
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
    notifyListeners();
  }

  void changeRecommendedMoviesNotification(bool value) {
    _selectedRecommendedMoviesNotification = value;
    if(_selectedRecommendedMoviesNotification && !_selectedAppNotification) {
      _selectedAppNotification = true;
    }
    else if(!_selectedRecommendedMoviesNotification && !_selectedUpdatedMoviesNotification) {
      _selectedAppNotification = false;
    }
    notifyListeners();
  }

  void changeUpdateMoviesNotification(bool value) {
    _selectedUpdatedMoviesNotification = value;
    if(_selectedUpdatedMoviesNotification && !_selectedAppNotification) {
      _selectedAppNotification = true;
    }
    else if(!_selectedRecommendedMoviesNotification && !_selectedUpdatedMoviesNotification) {
      _selectedAppNotification = false;
    }
    notifyListeners();
  }
}