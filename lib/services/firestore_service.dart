import 'package:cloud_firestore/cloud_firestore.dart';

class AlunoFirestore {
  final String id;
  final String nameStudent;
  final String grade;
  final DateTime? birthDate;
  final DateTime? startDate;
  final String phoneNumber;
  final String emergencyPhoneNumber;
  final String observacoesMedicas;
  final String observacoesProfessor;

  AlunoFirestore({
    required this.id,
    required this.nameStudent,
    required this.grade,
    this.birthDate,
    this.startDate,
    required this.phoneNumber,
    required this.emergencyPhoneNumber,
    required this.observacoesMedicas,
    required this.observacoesProfessor,
  });

  factory AlunoFirestore.fromMap(Map<String, dynamic> data, String documentId) {
    return AlunoFirestore(
      id: documentId,
      nameStudent: data['nameStudent'],
      grade: data['grade'],
      birthDate: data['birthDate'] != null ? DateTime.parse(data['birthDate']) : null,
      startDate: data['startDate'] != null ? DateTime.parse(data['startDate']) : null,
      phoneNumber: data['phoneNumber'],
      emergencyPhoneNumber: data['emergencyPhoneNumber'],
      observacoesMedicas: data['observacoesMedicas'] ?? 'Não informado',
      observacoesProfessor: data['observacoesProfessor'] ?? 'Não informado',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameStudent': nameStudent,
      'grade': grade,
      'birthDate': birthDate?.toIso8601String(),
      'startDate': startDate?.toIso8601String(),
      'phoneNumber': phoneNumber,
      'emergencyPhoneNumber': emergencyPhoneNumber,
      'observacoesMedicas': observacoesMedicas,
      'observacoesProfessor': observacoesProfessor,
    };
  }
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
// Adicionar aluno
  Future<void> addStudent(AlunoFirestore aluno) async {
    await _db.collection('alunos').add(aluno.toMap());
  }
// Atualizar aluno
  Future<void> updateStudent(String id, AlunoFirestore aluno) async {
    if (id.isNotEmpty) {
      await _db.collection('alunos').doc(id).update(aluno.toMap());
    } else {
      throw ArgumentError('O ID do aluno não pode estar vazio');
    }
  }

// Obter um aluno pelo ID
  Future<AlunoFirestore?> getStudentById(String id) async {
    try {
      var doc = await _db.collection('alunos').doc(id).get();
      if (doc.exists) {
        return AlunoFirestore.fromMap(doc.data()!, doc.id);
      }
    } catch (e) {
      print('Error getting student: $e');
    }
    return null;
  }
//escuta a coleção 'alunos' e, sempre que houver alterações, retorna uma lista atualizada de objetos .
  Stream<List<AlunoFirestore>> getAlunosStream() {
    return _db.collection('alunos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AlunoFirestore.fromMap(doc.data()!, doc.id);
      }).toList();
    });
  }
// Deletar aluno
  Future<void> deleteAluno(String id) async {
    await _db.collection('alunos').doc(id).delete();
  }
}