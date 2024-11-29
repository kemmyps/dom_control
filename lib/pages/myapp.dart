import 'package:dom_control/pages/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user_profile_controller.dart';
import 'login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProfileController('Default Username', 'Academia Fight')),
      ],
        child: MaterialApp(
          title: 'DOM Control',
          theme: myTheme,
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
    );
  }
}
