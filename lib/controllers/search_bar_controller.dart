import 'package:flutter/material.dart';

class SearchBarController extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();

  String get searchText => _searchController.text;

  TextEditingController get searchController => _searchController;

  SearchBarController() {
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    notifyListeners();
  }

  bool get isSearchTextEmpty => _searchController.text.isEmpty;

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
}
