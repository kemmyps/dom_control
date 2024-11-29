import 'package:dom_control/pages/screens/home_page/searchBar/custom_search_bar.dart';
import 'package:dom_control/pages/screens/home_page/searchBar/search_bar_controller.dart';
import 'package:dom_control/pages/screens/home_page/user_info.dart';
import 'package:dom_control/pages/services/firestore.dart';
import 'package:dom_control/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_aluno_button.dart';
import 'aluno_list.dart';

class HomePage extends StatefulWidget {
  final FirestoreService firestoreService;

  HomePage({super.key, required this.firestoreService});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _academiaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = ' '; // Valor inicial do nome de usuário
    _academiaController.text = ' '; // Valor inicial da academia
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _academiaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchBarController(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'DOM.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                      radius: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Editar Perfil',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nome de Usuário',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: TextField(
                  controller: _academiaController,
                  decoration: InputDecoration(
                    labelText: 'Academia',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Atualizar o nome de usuário e o nome da academia no UserProfileController
                    Provider.of<UserProfileController>(context, listen: false)
                        .updateUsername(_usernameController.text);
                    Provider.of<UserProfileController>(context, listen: false)
                        .updateAcademia(_academiaController.text);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.all(20.0),
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<UserProfileController>(
                  builder: (context, userProfileController, child) {
                    return UserInfo(
                      username: userProfileController.username,
                      academia: userProfileController.academia,
                    );
                  },
                ),
                const SizedBox(height: 5.0),
                Consumer<SearchBarController>(
                  builder: (context, searchBarController, child) {
                    return CustomSearchBar(searchBarController: searchBarController);
                  },
                ),
                const SizedBox(height: 10.0),
                Consumer<SearchBarController>(
                  builder: (context, searchBarController, child) {
                    return AlunoList(
                      firestoreService: widget.firestoreService,
                      searchText: searchBarController.searchText,
                      showAll: searchBarController.isSearchTextEmpty,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton:
        AddAlunoButton(firestoreService: widget.firestoreService),
      ),
    );
  }
}