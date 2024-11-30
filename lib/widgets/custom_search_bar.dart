import 'package:flutter/material.dart';
import '../controllers/search_bar_controller.dart';

class CustomSearchBar extends StatelessWidget {
  final SearchBarController searchBarController;

  const CustomSearchBar({super.key, required this.searchBarController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: searchBarController.searchController,
        decoration: InputDecoration(
          hintText: 'Pesquisar alunos',
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.red,
          ),
          filled: true,
          fillColor: Colors.white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      ),
    );
  }
}