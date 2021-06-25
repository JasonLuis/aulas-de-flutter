import 'package:dio/dio.dart';
import 'package:nac_mobx/model/cursos_model.dart';
import 'package:nac_mobx/service/service_config.dart';

class CursosService {
  static final String _endpoint =
      "https://5f6ce87d60cf97001641a6c4.mockapi.io/api/v1";

  static final String _resource = 'cursos';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<CursosModel>> findAll() async {
    await Future.delayed(Duration(seconds: 2));
    List<CursosModel> list = new List<CursosModel>();
    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            list.add(
              CursosModel.fromMap(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    return list;
  }

  Future<void> delete(CursosModel cursoModel) async {
    try {
      String endpoint = _resource + "/" + cursoModel.id.toString();

      Response response = await service.create().delete(
            endpoint,
          );

      if (response.statusCode != 200) {
        throw Exception("Não foi possível excluir!");
      }
    } catch (error) {
      throw error;
    }
  }
}
