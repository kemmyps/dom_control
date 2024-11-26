import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String username;

  const UserInfo({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return
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
            Text('Olá Professor(a), $username',
              style: TextStyle(fontSize: 15.0, color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}