import 'package:chamada_aluno/model/aluno_model.dart';
import 'package:chamada_aluno/repository/database_helper.dart';

class AlunoRepository{
  
  DatabaseHelper _databaseHelper;

  AlunoRepository(){
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<AlunoModel>> findAll() async{
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
    "AlunoModel",
     columns: [
      "nome",
      "rm",
      "presenca",
     ],
     orderBy: "nome ASC",
    );

    List<AlunoModel> listaAlunos = new List<AlunoModel>();
    for (Map i in result) {
      listaAlunos.add(AlunoModel.fromMap(i));
    }

    return listaAlunos;
  }
  
  Future<int> create(AlunoModel alunoModel) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "AlunoModel",
      alunoModel.toMap(),
    );
    return result;
  }

  Future<void> update(AlunoModel alunoModel, int rm) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.update(
      "AlunoModel",
      alunoModel.toMap(),
      where: "rm = ?",
      whereArgs: [rm],
    );
  }

  Future<void> delete(AlunoModel alunoModel) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.delete(
      "AlunoModel",
      where: "rm = ?",
      whereArgs: [alunoModel.rm],
    );
  }
}