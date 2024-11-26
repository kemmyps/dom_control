import 'package:flutter/material.dart';
import 'package:dom_control/pages/services/firestore.dart';

import '../../widgets/form_fields.dart';

class AddAlunoScreen extends StatefulWidget {
  final FirestoreService firestoreService;
  final String? studentId;

  const AddAlunoScreen({super.key, required this.firestoreService, this.studentId});

  @override
  State<AddAlunoScreen> createState() => _AddAlunoScreenState();
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
        _selectedBirthDate = aluno.birthDate;
        _selectedStartDate = aluno.startDate;
        _phoneController.text = aluno.phoneNumber;
        _emergencyPhoneController.text = aluno.emergencyPhoneNumber;
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
              buildTextFormField(
                controller: _nameStudentController,
                labelText: 'Nome',
                validatorMessage: 'Por favor, insira o nome do aluno',
              ),
              buildTextFormField(
                controller: _gradeController,
                labelText: 'Faixa',
                validatorMessage: 'Por favor, insira a faixa do aluno',
              ),
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
              buildPhoneNumberFormField(
                controller: _emergencyPhoneController,
                labelText: 'Telefone de Emergência',
                validatorMessage: 'Por favor, insira o número de telefone de emergência',
              ),
              const Text(
                'Data de início das aulas do aluno:',
                style: TextStyle(fontSize: 16),
              ),
              buildDatePickerRow(
                context: context,
                selectedDate: _selectedStartDate,
                dateLabelText: 'Data de início das aulas do aluno',
                onDateSelected: (date) {
                  setState(() {
                    _selectedStartDate = date;
                  });
                },
              ),
              buildPhoneNumberFormField(
                controller: _phoneController,
                labelText: 'Telefone',
                validatorMessage: 'Por favor, insira o número de telefone',
              ),
              buildTextFormField(
                controller: _observacoesMedicasController,
                labelText: 'Observações Médicas',
                validatorMessage: 'Opcional',
              ),
              buildTextFormField(
                controller: _observacoesProfessorController,
                labelText: 'Observações do Professor',
                validatorMessage: 'Opcional',
              ),
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