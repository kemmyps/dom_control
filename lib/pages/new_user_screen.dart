// import 'package:flutter/material.dart';
//
// //TODO: CONFIGURAR FIREBASE AUTENTICATION, PASSAR NOME DE USUARIO PARA TELA HOME APOS AUTENTICAR,
// // EM VEZ DE ECUTAR DIRETAMENTE DO CAMPO NAME DO LOGIN
//
//
// class NewUserScreen extends StatefulWidget {
//   @override
//   _NewUserScreenState createState() => _NewUserScreenState();
// }
//
// class _NewUserScreenState extends State<NewUserScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   Future<void> _createUser() async {
//     // Validação dos dados
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Criação do usuário no Firebase
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//         // Navegação para a tela de login ou outra tela
//         Navigator.pushReplacementNamed(context, '/login');
//       } on FirebaseAuthException catch (e) {
//         // Tratar erros de autenticação
//         print(e.message);
//         // Mostrar mensagem de erro ao usuário
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Criar nova conta'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Campos de texto para email e senha
//               // Botão para criar a conta
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }