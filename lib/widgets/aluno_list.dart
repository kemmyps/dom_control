import 'package:flutter/material.dart';
import 'package:dom_control/services/firestore_service.dart';
import '../screens/add_aluno_screen.dart';
import '../screens/aluno_details_screen.dart';


class AlunoList extends StatelessWidget {
  final FirestoreService firestoreService;
  final String searchText;
  final bool showAll;

  const AlunoList({super.key, required this.firestoreService, required this.searchText, required this.showAll});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AlunoFirestore>>(
      stream: firestoreService.getAlunosStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error fetching data'));
        }

        final alunos = snapshot.data;

        if (alunos == null || alunos.isEmpty) {
          return const Center(child: Text('No students found'));
        }

        final filteredAlunos = (showAll || searchText.isEmpty)
            ? alunos
            : alunos.where((aluno) {
          final nameLower = aluno.nameStudent.toLowerCase();
          final searchLower = searchText.toLowerCase();
          return nameLower.contains(searchLower);
        }).toList();

        if (filteredAlunos.isEmpty) {
          return const Center(child: Text('No students found'));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredAlunos.length,
          itemBuilder: (context, index) {
            final aluno = filteredAlunos[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          aluno.nameStudent,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          aluno.grade,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAlunoScreen(
                              firestoreService: firestoreService,
                              studentId: aluno.id,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        bool confirm = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Confirmar Exclusão'),
                            content: Text('Tem certeza que deseja excluir o aluno ${aluno.nameStudent}?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: Text('Excluir'),
                              ),
                            ],
                          ),
                        );
                        if (confirm) {
                          await firestoreService.deleteAluno(aluno.id);
                        }
                      },
                    ),
                  ],
                ),
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/30'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlunoDetailsScreen(aluno: aluno),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}