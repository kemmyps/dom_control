import 'package:flutter/material.dart';
import '../add_aluno_screen.dart';
import '../../services/firestore.dart';


class AddAlunoButton extends StatelessWidget {
  final FirestoreService firestoreService;

  const AddAlunoButton({super.key, required this.firestoreService});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddAlunoScreen(firestoreService: firestoreService, studentId: '',),
        ),
        );
      },
      backgroundColor: Colors.red,
      child: const Icon(Icons.add),
    );
  }
}