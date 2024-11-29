import 'package:flutter/material.dart';

class UserProfileController extends ChangeNotifier {
  String _username;
  String _academia;

  UserProfileController(this._username, this._academia);

  String get username => _username;
  String get academia => _academia;

  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }

  void updateAcademia(String newAcademia) {
    _academia = newAcademia;
    notifyListeners();
  }
}