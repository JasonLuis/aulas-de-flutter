import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  //Instancia do SQFLite Database
  static Database _database;

  //Instancia da classe Helper “Singleton”
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  //Fábrica da classe Helper “construtor”
  factory DatabaseHelper() {
    return _instance;
  }
  
  // Construtor nomeado
  DatabaseHelper._internal();

  //Abre conexão com o banco
  Future<Database> get connection async {
    if (_database == null) {
      _database = await _createDatabase();
    }
    return _database;
  }

  Future<Database> _createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'alunos.db');
    var database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createTables,
    );

    return database;
  }

  void _createTables(Database database, int version) async {
    // Criando a tabela de Cursos
    await database.execute('CREATE TABLE AlunoModel(nome TEXT,rm INTEGER PRIMARY KEY,presenca TEXT)');
    await database.execute('CREATE TABLE ChamadaAluno(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,data TEXT,presenca INTEGER,rm INTEGER, FOREIGN KEY (rm)REFERENCES AlunoModel(rm))');
    await database.execute('CREATE TABLE NotaAluno(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,rm INTEGER,nota REAL, FOREIGN KEY(rm) REFERENCES AlunoModel(rm))');
    await database.execute('CREATE TRIGGER update_aluno AFTER UPDATE ON AlunoModel WHEN old.rm <> new.rm BEGIN UPDATE NotaAluno SET rm=new.rm where rm = old.rm; END');
    await database.execute('CREATE TRIGGER delete_aluno BEFORE DELETE ON AlunoModel BEGIN DELETE FROM NotaAluno WHERE rm=old.rm; END;');
  }
}
