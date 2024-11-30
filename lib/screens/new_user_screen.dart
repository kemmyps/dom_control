import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importando o Firebase Auth
import 'login_page.dart';
import '../controllers/new_user_controller.dart'; // Importando o controlador
import '../services/auth_service.dart'; // Importando o AuthService

class NewUserScreen extends StatefulWidget {
  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final NewUserController _controller = NewUserController();
  final AuthService _authService = AuthService();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final email = _controller.emailController.text;
      final password = _passwordController.text;
      final confirmPassword = _controller.confirmPasswordController.text;

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('As senhas não coincidem!')),
        );
        return;
      }

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('E-mail e senha não podem estar vazios!')),
        );
        return;
      }

      try {
        User? user = await _authService.registerWithEmailAndPassword(email, password);
        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Usuário cadastrado com sucesso!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao cadastrar usuário')),
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar usuário: ${e.message}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38, // Cor de fundo da tela
      appBar: AppBar(
        title: const Text('Cadastrar Novo Usuário'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Theme(
            data: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formKey,
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
                        'Create your account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // email textfield
                      TextFormField(
                        controller: _controller.emailController,
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
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o e-mail';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      // password textfield
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200], // Cor de fundo do campo de texto
                          hintText: 'Senha',
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      // confirm password textfield
                      TextFormField(
                        controller: _controller.confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200], // Cor de fundo do campo de texto
                          hintText: 'Confirmar Senha',
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, confirme a senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // register button
                      ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.all(20.0),
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}