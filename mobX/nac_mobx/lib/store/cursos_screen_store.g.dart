// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursos_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CursosScreenStore on _CursosScreenStore, Store {
  Computed<List<CursosModel>> _$filteredComputed;

  @override
  List<CursosModel> get filtered =>
      (_$filteredComputed ??= Computed<List<CursosModel>>(() => super.filtered,
              name: '_CursosScreenStore.filtered'))
          .value;
  Computed<int> _$quantidadeComputed;

  @override
  int get quantidade =>
      (_$quantidadeComputed ??= Computed<int>(() => super.quantidade,
              name: '_CursosScreenStore.quantidade'))
          .value;

  final _$filtroAtom = Atom(name: '_CursosScreenStore.filtro');

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CursosScreenStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$listaCursosAtom = Atom(name: '_CursosScreenStore.listaCursos');

  @override
  ObservableList<CursosModel> get listaCursos {
    _$listaCursosAtom.reportRead();
    return super.listaCursos;
  }

  @override
  set listaCursos(ObservableList<CursosModel> value) {
    _$listaCursosAtom.reportWrite(value, super.listaCursos, () {
      super.listaCursos = value;
    });
  }

  final _$findAllCoursesAsyncAction =
      AsyncAction('_CursosScreenStore.findAllCourses');

  @override
  Future findAllCourses() {
    return _$findAllCoursesAsyncAction.run(() => super.findAllCourses());
  }

  final _$_CursosScreenStoreActionController =
      ActionController(name: '_CursosScreenStore');

  @override
  dynamic setFiltro(dynamic value) {
    final _$actionInfo = _$_CursosScreenStoreActionController.startAction(
        name: '_CursosScreenStore.setFiltro');
    try {
      return super.setFiltro(value);
    } finally {
      _$_CursosScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItem(CursosModel curso) {
    final _$actionInfo = _$_CursosScreenStoreActionController.startAction(
        name: '_CursosScreenStore.deleteItem');
    try {
      return super.deleteItem(curso);
    } finally {
      _$_CursosScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtro: ${filtro},
isLoading: ${isLoading},
listaCursos: ${listaCursos},
filtered: ${filtered},
quantidade: ${quantidade}
    ''';
  }
}
