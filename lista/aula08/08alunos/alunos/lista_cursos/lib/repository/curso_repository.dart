
import 'package:lista_cursos/models/curso_model.dart';
import 'package:lista_cursos/repository/database.dart';

class CursoRepository{
  List<CursoModel> findAll(){
    return <CursoModel>[]; 
  }

  Future<List<CursoModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();
    
    List<CursoModel> cursos = new List<CursoModel>();

    if (db.created) {
      cursos = new List<CursoModel>();
      cursos.add(
        new CursoModel(
            id: 1,
            nome: 'Java',
            nivel: 'Básico',
            percentualConclusao: 99,
            preco: 1000),
      );

      cursos.add(
        new CursoModel(
            id: 1,
            nome: 'Java',
            nivel: 'Básico',
            percentualConclusao: 99,
            preco: 1000),
      );

      cursos.add(
        new CursoModel(
            id: 1,
            nome: 'Java',
            nivel: 'Básico',
            percentualConclusao: 99,
            preco: 1000),
      );
    }

    return new Future.value(cursos);
  }
  
}
