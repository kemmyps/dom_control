import 'package:dom_control/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dom_control/controllers/user_profile_controller.dart';

import '../services/auth_service.dart';

class DrawerContent extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController academiaController;

  const DrawerContent({
    Key? key,
    required this.usernameController,
    required this.academiaController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Nome de Usuário',
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.fitness_center),
          title: TextField(
            controller: academiaController,
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
                  .updateUsername(usernameController.text);
              Provider.of<UserProfileController>(context, listen: false)
                  .updateAcademia(academiaController.text);
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
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () async {
            await AuthService().signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ],
    );
  }
}