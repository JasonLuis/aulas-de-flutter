import 'package:lista_cursos/models/curso_model.dart';
import 'package:lista_cursos/repository/database_helper.dart';



class CursoRepository {
  DatabaseHelper _databaseHelper;

  CursoRepository(){
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<CursoModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
    "CursoModel",
     columns: [
      "id",
      "nome",
      "nivel",
      "percentualConclusao",
      "preco",
      "conteudo"
      ],
    );
    
    // Converte a lista de Maps para Lista de Cursos
    List<CursoModel> listaCursos = new List<CursoModel>();
    for (Map i in result) {
      listaCursos.add(CursoModel.fromMap(i));
    }

    return listaCursos;
  }

  Future<int> create(CursoModel cursoModel) async{
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "CursoModel",
      cursoModel.toMap(),
    );
    return result;
  }

  Future<void> update(CursoModel cursoModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      "CursoModel",
      cursoModel.toMap(),
      where: "id = ?",
      whereArgs: [cursoModel.id],
    );
  }

  Future<void> delete(CursoModel cursoModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.delete(
      "CursoModel",
      where: "id = ?",
      whereArgs: [cursoModel.id],
    );
  }

  Future<CursoModel> get(int id){
    return null;
  }
}
