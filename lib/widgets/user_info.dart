import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String username;
  final String academia;

  const UserInfo({super.key, required this.username, required this.academia});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openEndDrawer();
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            radius: 30,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(academia),
              Text(
                'Olá Professor(a), $username',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}