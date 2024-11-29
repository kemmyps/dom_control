import 'package:dom_control/pages/screens/home_page/home_page.dart';
import 'package:dom_control/pages/services/firestore.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  void _login() {
    // Navegar para a tela inicial sem passar o username
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          firestoreService: firestoreService,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38, // Cor de fundo da tela
      body: SafeArea(
        child: Center(
          child: Theme(
            data: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_DOM.png',
                  width: 2000,
                  height: 200,
                ),
                const SizedBox(height: 25),
                const Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),

                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200], // Cor de fundo do campo de texto
                      hintText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red), // Definindo a cor da borda como vermelha
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red), // Borda quando habilitado
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Padding interno
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200], // Cor de fundo do campo de texto
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red), // Definindo a cor da borda como vermelha
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.red), // Borda quando habilitado
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Padding interno
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(20.0),
                    ), // Call the login function when pressed
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // New user section
                GestureDetector(
                  onTap: () {
                    // Navigate to another page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => NewUserScreen(),
                    //   ),
                    // );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'New User?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 5), // Spacing between texts
                      Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}