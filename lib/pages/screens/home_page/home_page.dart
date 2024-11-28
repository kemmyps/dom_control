import 'package:dom_control/pages/myTheme.dart';
import 'package:dom_control/pages/screens/home_page/user_info.dart';
import 'package:flutter/material.dart';
import 'package:dom_control/pages/services/firestore.dart';
import 'add_aluno_button.dart';
import 'aluno_list.dart';


class HomePage extends StatefulWidget {
  final String username;
  final FirestoreService firestoreService;

  HomePage({super.key, required this.username, required this.firestoreService});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DOM.' ,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfo(username: widget.username),
              const SizedBox(height: 5.0),
              buildSearchBar(),
              const SizedBox(height: 10.0),
              AlunoList(firestoreService: widget.firestoreService),
            ],
          ),
        ),
      ),
      floatingActionButton: AddAlunoButton(firestoreService: widget.firestoreService),
    );
  }
}