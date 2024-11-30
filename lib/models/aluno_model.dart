import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

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

  // Escuta a coleção 'alunos' e, sempre que houver alterações, retorna uma lista atualizada de objetos
  Stream<List<AlunoFirestore>> getAlunosStream() {
    return _db.collection('alunos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AlunoFirestore.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Deletar aluno
  Future<void> deleteAluno(String id) async {
    await _db.collection('alunos').doc(id).delete();
  }
}