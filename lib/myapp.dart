import 'package:dom_control/screens/login_page.dart';
import 'package:dom_control/themes/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/user_profile_controller.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProfileController('Username', 'Academia')),
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
