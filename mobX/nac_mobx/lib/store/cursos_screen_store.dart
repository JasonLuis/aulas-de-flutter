import 'package:mobx/mobx.dart';
import 'package:nac_mobx/model/cursos_model.dart';
import 'package:nac_mobx/service/cursos_service.dart';
part 'cursos_screen_store.g.dart';

class CursosScreenStore = _CursosScreenStore with _$CursosScreenStore;

abstract class _CursosScreenStore with Store {
  final CursosService _cursosService = CursosService();
  List<CursosModel> _listaCursoLocal = <CursosModel>[];

  _CursosScreenStore() {
    init();
  }

  void init() async {
    isLoading = true;
    _listaCursoLocal = await _cursosService.findAll();
    listaCursos = _listaCursoLocal.asObservable();
    isLoading = false;
  }

  @observable
  String filtro = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<CursosModel> listaCursos = <CursosModel>[].asObservable();

  @action
  findAllCourses() async {
    init();
  }

  @action
  setFiltro(value) {
    filtro = value;
  }

  @action
  deleteItem(CursosModel curso) {
    _cursosService.delete(curso);
    init();
  }

  @computed
  List<CursosModel> get filtered {
    if (filtro.isEmpty) {
      return listaCursos.toList();
    } else {
      var lista = listaCursos
          .where(
            (c) => c.name.toLowerCase().contains(
                  filtro.toLowerCase(),
                ),
          )
          .toList();
      return lista;
    }
  }

  @computed
  int get quantidade {
    return listaCursos.length;
  }
}
