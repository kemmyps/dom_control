import 'package:dom_control/widgets/aluno_list_tile.dart';
import 'package:dom_control/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlunoDetailsScreen extends StatelessWidget {
  final AlunoFirestore aluno;

  AlunoDetailsScreen({required this.aluno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Aluno ${aluno.nameStudent}',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AlunoListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: 'Nome Completo',
              subtitle: aluno.nameStudent,
            ),
            Divider(color: Colors.red),
            AlunoListTile(
              leading: CircleAvatar(
                child: Icon(Icons.auto_graph),
              ),
              title: 'Faixa de graduação',
              subtitle: aluno.grade,
            ),
            Divider(color: Colors.red),
            AlunoListTile(
              leading: CircleAvatar(
                child: Icon(Icons.child_care),
              ),
              title: 'Data de Nascimento',
              subtitle: aluno.birthDate,
              subtitleFormatter: (date) => DateFormat('dd/MM/yyyy').format(date),
            ),
            Divider(color: Colors.red),
            AlunoListTile(
              leading: CircleAvatar(
                child: Icon(Icons.calendar_today),
              ),
              title: 'Data de inicio dos treinos',
              subtitle: aluno.startDate,
              subtitleFormatter: (date) => DateFormat('dd/MM/yyyy').format(date),
            ),
            Divider(color: Colors.red),
            AlunoListTile(
              leading: CircleAvatar(
                child: Icon(Icons.phone_iphone),
              ),
              title: 'Telefone',
              subtitle: aluno.phoneNumber,
              subtitleFormatter: (number) => '(${number.toString().substring(0, 2)}) ${number.toString().substring(2, 6)}-${number.toString().substring(6)}',
            ),
            Divider(color: Colors.red),
            AlunoListTile(
              leading: CircleAvatar(
                child: Icon(Icons.emergency_share),
              ),
              title: 'Telefone de emergencia',
              subtitle: aluno.emergencyPhoneNumber,
              subtitleFormatter: (number) => '(${number.toString().substring(0, 2)}) ${number.toString().substring(2, 6)}-${number.toString().substring(6)}',
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Observações Médicas', style: Theme.of(context).textTheme.titleSmall),
                    Text(aluno.observacoesMedicas, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Observações do Professor', style: Theme.of(context).textTheme.titleSmall),
                    Text(aluno.observacoesProfessor, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

