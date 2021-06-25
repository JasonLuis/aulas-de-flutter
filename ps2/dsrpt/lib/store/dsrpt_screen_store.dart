import 'package:dsrpt/models/robot_model.dart';
import 'package:dsrpt/service/dsrpt_service.dart';
import 'package:mobx/mobx.dart';

part 'dsrpt_screen_store.g.dart';

class DsrptScreenStore = _DsrptScreenStore with _$DsrptScreenStore;

abstract class _DsrptScreenStore with Store {
  final DsrptService _dsrptService = DsrptService();
  List<RobotModel> _listaRobotLocal = <RobotModel>[];

  _DsrptScreenStore() {
    init();
  }

  void init() async {
    isLoading = true;
    _listaRobotLocal = await _dsrptService.findAll();
    listaRobot = _listaRobotLocal.asObservable();
    isLoading = false;
  }

  @observable
  String filtro = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<RobotModel> listaRobot = <RobotModel>[].asObservable();

  @action
  findAllNews() async {
    init();
  }

  @action
  setFiltro(value) {
    filtro = value;
  }

  @action
  deleteItem(RobotModel robotModel) {
    _dsrptService.delete(robotModel);
    init();
  }

  @action
  createItem(RobotModel robotModel) {
    _dsrptService.create(robotModel);
    init();
  }

  @action
  updateItem(RobotModel robotModel) {
    _dsrptService.update(robotModel);
    init();
  }

  @computed
  List<RobotModel> get filtered {
    if (filtro.isEmpty) {
      return listaRobot.toList();
    } else {
      var lista = listaRobot
          .where(
            (c) => c.nome.toLowerCase().contains(
                  filtro.toLowerCase(),
                ),
          )
          .toList();
      return lista;
    }
  }

  @computed
  int get quantidade {
    return listaRobot.length;
  }
}
