import 'package:chamada_aluno/model/notaAluno_model.dart';
import 'package:chamada_aluno/repository/database_helper.dart';

class NotaAlunoRepository {
  
  DatabaseHelper _databaseHelper;

  NotaAlunoRepository(){
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<NotaAlunoModel>> findAll() async{
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      //"SELECT AlunoModel.nome,AlunoModel.rm,AlunoModel.sexo,NotaAluno.nota FROM AlunoModel LEFT JOIN NotaAluno on (AlunoModel.rm=NotaAluno.rm);",
      "NotaAluno",
       columns: [
         "id",
         "rm",
         "nota",
       ]
    );

    List<NotaAlunoModel> listaNotaAluno = new List<NotaAlunoModel>();
    for (Map i in result) {
      listaNotaAluno.add(NotaAlunoModel.fromMap(i));
    }
    
    return listaNotaAluno; 
  }

  Future<int> create(NotaAlunoModel notaAlunoModel) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "NotaAluno",
      notaAlunoModel.toMap(),
    );
    return result;  
  }
  
  Future<void> update(NotaAlunoModel notaAlunoModel) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.update(
      "NotaAluno",
      notaAlunoModel.toMap(),
      where: "id = ?",
      whereArgs: [notaAlunoModel.id],
    );
  }

  Future<void> delete(NotaAlunoModel notaAlunoModel) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.delete(
      "NotaAluno",
      where: "id = ?",
      whereArgs: [notaAlunoModel.id],
    );
  }
}