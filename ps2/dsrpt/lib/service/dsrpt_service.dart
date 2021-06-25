import 'package:dio/dio.dart';
import 'package:dsrpt/models/robot_model.dart';
import 'package:dsrpt/service/service_config.dart';

class DsrptService {
  static final String _endpoint =
      "https://5fac3d7e03a60500167e7b05.mockapi.io/";

  static final String _resource = 'dsrpt';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<RobotModel>> findAll() async {
    await Future.delayed(Duration(seconds: 2));
    List<RobotModel> list = new List<RobotModel>();
    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            list.add(
              RobotModel.fromMap(value),
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

  Future<int> create(RobotModel robotModel) async {
    try {
      robotModel.id = 0;
      Response response = await service.create().post(
            _resource,
            data: robotModel.toMap(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<int> update(RobotModel robotModel) async {
    try {
      String endpoint = _resource + "/" + robotModel.id.toString();

      Response response = await service.create().put(
            endpoint,
            data: robotModel.toMap(),
          );

      var retorno = (response.data["id"] is String)
          ? int.parse(response.data["id"])
          : response.data["id"];
      return retorno;
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<void> delete(RobotModel robotModel) async {
    try {
      String endpoint = _resource + "/" + robotModel.id.toString();

      Response response = await service.create().delete(
            endpoint,
          );

      if (response.statusCode != 200) {
        throw Exception("Não foi possível excluir o recurso!");
      }
    } catch (error) {
      throw error;
    }
  }
}
