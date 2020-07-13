
import 'package:the_good_bot/models/contato_model.dart';

import 'database_helper.dart';

class ContatoRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  ContatoRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<ContatoModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "ContatoModel",
      columns: [
        "id",
        "nome",
        "telefone",
      ],
    );

    List<ContatoModel> listaContatos = new List<ContatoModel>();
    for (Map i in result) {
      listaContatos.add(ContatoModel.fromMap(i));
    }

    return listaContatos;
  }

  Future<int> create(ContatoModel contatoModel) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "ContatoModel",
      contatoModel.toMap(),
    );
    return result;
  }

  Future<int> createRaw(ContatoModel contatoModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO ContatoModel ( " +
        "  nome , " +
        "  telefone ) " +
        "VALUES ( " +
        "    '${contatoModel.nome}' , " +
        "    '${contatoModel.telefone}' " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<ContatoModel> get(int id) async {
    var connection = await _databaseHelper.connection;
    List<Map> results = await connection.query(
      "ContatoModel",
      columns: [
        "id",
        "nome",
        "telefone",
      ],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.length > 0) {
      return ContatoModel.fromMap(
        results.first,
      );
    } else {
      return null;
    }
  }

  Future<ContatoModel> getRaw(int id) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = "SELECT * FROM ContatoModel WHERE ID = $id  ";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new ContatoModel.fromMap(results.first);
    } else {
      return null;
    }
  }

  Future<int> update(ContatoModel contatoModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.update(
      "ContatoModel",
      contatoModel.toMap(),
      where: "id = ?",
      whereArgs: [contatoModel.id],
    );
  }

  Future<int> updateRaw(ContatoModel contatoModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " UPDATE ContatoModel SET  " +
        "  nome = '${contatoModel.nome}' , " +
        "  telefone = ${contatoModel.telefone} , " +
        " WHERE id = ${contatoModel.id} ";

    var result = await connection.rawUpdate(sqlCommand);
    return result;
  }

  Future<void> delete(ContatoModel contatoModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.delete(
      "ContatoModel",
      where: "id = ?",
      whereArgs: [contatoModel.id],
    );
  }

  Future<void> deleteRaw(ContatoModel contatoModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand =
        " DELETE FROM ContatoModel   " + " WHERE id = ${contatoModel.id} ";

    var result = await connection.rawDelete(sqlCommand);
    return result;
  }
}