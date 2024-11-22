import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DOM'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Academia Fight'),
                      Text('Olá Professor(a), $username'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              //Barra de pesquisa
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar alunos',
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicione a ação desejada aqui
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}



