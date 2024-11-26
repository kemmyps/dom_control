import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Pesquisar alunos', // Portuguese for "Search students"
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.red,
          ), // Ensure visibility by avoiding nested const constructors
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}