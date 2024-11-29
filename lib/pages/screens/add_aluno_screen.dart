import 'package:flutter/material.dart';
import 'package:dom_control/pages/services/firestore.dart';
import '../../widgets/form_fields.dart';
import 'package:dom_control/pages/myTheme.dart';

class AddAlunoScreen extends StatefulWidget {
  final FirestoreService firestoreService;
  final String? studentId;

  AddAlunoScreen({required this.firestoreService, this.studentId});

  @override
  _AddAlunoScreenState createState() => _AddAlunoScreenState();
}

class _AddAlunoScreenState extends State<AddAlunoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameStudentController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emergencyPhoneController = TextEditingController();
  DateTime? _selectedBirthDate = DateTime.now();
  DateTime? _selectedStartDate = DateTime.now();
  final TextEditingController _observacoesMedicasController = TextEditingController();
  final TextEditingController _observacoesProfessorController = TextEditingController();
  bool isEdit = false;
  String? studentId;
  static const double paddingValue = 16.0;
  String get appBarTitle => isEdit ? 'Editar Aluno' : 'Adicionar Aluno';

  @override
  void initState() {
    super.initState();
    if (widget.studentId != null && widget.studentId != "") {
      isEdit = true;
      studentId = widget.studentId;
      _loadStudentData(studentId!);
    }
  }

  Future<void> _loadStudentData(String id) async {
    final aluno = await widget.firestoreService.getStudentById(id);
    if (aluno != null) {
      setState(() {
        _nameStudentController.text = aluno.nameStudent;
        _gradeController.text = aluno.grade;
        _phoneController.text = aluno.phoneNumber;
        _emergencyPhoneController.text = aluno.emergencyPhoneNumber;
        _selectedBirthDate = aluno.birthDate;
        _selectedStartDate = aluno.startDate;
        _observacoesMedicasController.text = aluno.observacoesMedicas;
        _observacoesProfessorController.text = aluno.observacoesProfessor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameStudentController,
                decoration: MyTheme.inputDecoration('Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do aluno';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              TextFormField(
                controller: _gradeController,
                decoration: MyTheme.inputDecoration('Faixa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a faixa do aluno';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              const Text(
                'Data de nascimento do aluno:',
                style: TextStyle(fontSize: 16),
              ),
              buildDatePickerRow(
                context: context,
                selectedDate: _selectedBirthDate,
                dateLabelText: 'Data de Nascimento',
                onDateSelected: (date) {
                  setState(() {
                    _selectedBirthDate = date;
                  });
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              TextFormField(
                controller: _emergencyPhoneController,
                decoration: MyTheme.inputDecoration('Telefone de Emergência'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de telefone de emergência';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              const Text(
                'Data de início das aulas do aluno:',
                style: TextStyle(fontSize: 16),
              ),
              buildDatePickerRow(
                context: context,
                selectedDate: _selectedStartDate,
                dateLabelText: 'Data de Início',
                onDateSelected: (date) {
                  setState(() {
                    _selectedStartDate = date;
                  });
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              TextFormField(
                controller: _phoneController,
                decoration: MyTheme.inputDecoration('Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de telefone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              TextFormField(
                controller: _observacoesMedicasController,
                decoration: MyTheme.inputDecoration('Observações Médicas'),
                validator: (value) {
                  return null; // Campo opcional
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              TextFormField(
                controller: _observacoesProfessorController,
                decoration: MyTheme.inputDecoration('Observações do Professor'),
                validator: (value) {
                  return null; // Campo opcional
                },
              ),
              const SizedBox(height: 10), // Espaço entre os campos
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      _selectedBirthDate != null &&
                      _selectedStartDate != null) {
                    final AlunoFirestore aluno = AlunoFirestore(
                      id: studentId ?? '', // Adicione o ID aqui
                      nameStudent: _nameStudentController.text,
                      grade: _gradeController.text,
                      birthDate: _selectedBirthDate!,
                      startDate: _selectedStartDate!,
                      phoneNumber: _phoneController.text,
                      emergencyPhoneNumber: _emergencyPhoneController.text,
                      observacoesMedicas: _observacoesMedicasController.text,
                      observacoesProfessor: _observacoesProfessorController.text,
                    );
                    if (isEdit) {
                      if (studentId != null && studentId!.isNotEmpty) {
                        await widget.firestoreService.updateStudent(studentId!, aluno);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Erro: ID do aluno está vazio'),
                          ),
                        );
                      }
                    } else {
                      await widget.firestoreService.addStudent(aluno);
                    }
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, preencha todos os campos obrigatórios'),
                      ),
                    );
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameStudentController.dispose();
    _gradeController.dispose();
    _phoneController.dispose();
    _emergencyPhoneController.dispose();
    _observacoesMedicasController.dispose();
    _observacoesProfessorController.dispose();
    super.dispose();
  }
}