import 'package:curso/models/curso_model.dart';
import 'package:curso/services/curso_service.dart';
import 'package:mobx/mobx.dart';
part 'curso_screen_store.g.dart';

class CursoScreenStore = _CursoScreenStore with _$CursoScreenStore;

abstract class _CursoScreenStore with Store {
  final CursoService _cursoService = CursoService();
  List<CursoModel> _listaCursoLocal = <CursoModel>[];

  _CursoScreenStore() {
    init();
  }

  void init() async {
    isLoading = true;
    _listaCursoLocal = await _cursoService.findAll();
    listaCursos = _listaCursoLocal.asObservable();
    isLoading = false;
  }

  @observable
  String filtro = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<CursoModel> listaCursos = <CursoModel>[].asObservable();

  @action
  findAllCourses() async {
    init();
  }

  @action
  setFiltro(value) {
    filtro = value;
  }

  @computed
  List<CursoModel> get filtered {
    if (filtro.isEmpty) {
      return listaCursos.toList();
    } else {
      var lista = listaCursos
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
    return listaCursos.length;
  }
}
