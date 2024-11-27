import 'package:dom_control/pages/myTheme.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DOM Control',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}