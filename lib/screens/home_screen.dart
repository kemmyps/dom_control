import 'package:dom_control/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dom_control/controllers/search_bar_controller.dart';
import 'package:dom_control/controllers/user_profile_controller.dart';
import 'package:dom_control/widgets/custom_search_bar.dart';
import 'package:dom_control/widgets/user_info.dart';
import 'package:dom_control/widgets/add_aluno_button.dart';
import 'package:dom_control/widgets/aluno_list.dart';
import '../services/auth_service.dart';
import '../widgets/drawer_content.dart';
import '../services/firestore_service.dart';

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
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await AuthService().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
        endDrawer: Drawer(
          child: DrawerContent(
            usernameController: _usernameController,
            academiaController: _academiaController,
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
        floatingActionButton: AddAlunoButton(firestoreService: widget.firestoreService),
      ),
    );
  }
}

