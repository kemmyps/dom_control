import 'package:flutter/material.dart';

class SearchBarController extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  String _searchText = ' ';

  SearchBarController() {
    searchController.addListener(() {
      _searchText = searchController.text;
      notifyListeners();
    });
  }

  String get searchText => _searchText;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}