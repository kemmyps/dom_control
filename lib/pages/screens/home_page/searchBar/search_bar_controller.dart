import 'package:flutter/material.dart';

class SearchBarController extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();

  String get searchText => _searchController.text;

  TextEditingController get searchController => _searchController;

  void updateSearchText(String newText) {
    _searchController.text = newText;
    notifyListeners();
  }

  bool get isSearchTextEmpty => _searchController.text.isEmpty;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
