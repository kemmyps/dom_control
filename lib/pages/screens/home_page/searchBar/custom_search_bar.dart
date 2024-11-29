import 'package:dom_control/pages/screens/home_page/searchBar/search_bar_controller.dart';
import 'package:flutter/material.dart';

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
          hintText: 'Pesquisar alunos', // Texto de dica
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.red, // Cor do ícone de pesquisa
          ),
          filled: true,
          fillColor: Colors.white70, // Cor de fundo do campo de texto
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)), // Bordas arredondadas
            borderSide: BorderSide.none, // Remove a borda padrão
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red, width: 2.0), // Borda quando habilitado
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red, width: 2.0), // Borda quando focado
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Padding interno
        ),
      ),
    );
  }
}