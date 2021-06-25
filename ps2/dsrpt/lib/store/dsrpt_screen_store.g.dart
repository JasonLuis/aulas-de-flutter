// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsrpt_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DsrptScreenStore on _DsrptScreenStore, Store {
  Computed<List<RobotModel>> _$filteredComputed;

  @override
  List<RobotModel> get filtered =>
      (_$filteredComputed ??= Computed<List<RobotModel>>(() => super.filtered,
              name: '_DsrptScreenStore.filtered'))
          .value;
  Computed<int> _$quantidadeComputed;

  @override
  int get quantidade =>
      (_$quantidadeComputed ??= Computed<int>(() => super.quantidade,
              name: '_DsrptScreenStore.quantidade'))
          .value;

  final _$filtroAtom = Atom(name: '_DsrptScreenStore.filtro');

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

  final _$isLoadingAtom = Atom(name: '_DsrptScreenStore.isLoading');

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

  final _$listaRobotAtom = Atom(name: '_DsrptScreenStore.listaRobot');

  @override
  ObservableList<RobotModel> get listaRobot {
    _$listaRobotAtom.reportRead();
    return super.listaRobot;
  }

  @override
  set listaRobot(ObservableList<RobotModel> value) {
    _$listaRobotAtom.reportWrite(value, super.listaRobot, () {
      super.listaRobot = value;
    });
  }

  final _$findAllNewsAsyncAction = AsyncAction('_DsrptScreenStore.findAllNews');

  @override
  Future findAllNews() {
    return _$findAllNewsAsyncAction.run(() => super.findAllNews());
  }

  final _$_DsrptScreenStoreActionController =
      ActionController(name: '_DsrptScreenStore');

  @override
  dynamic setFiltro(dynamic value) {
    final _$actionInfo = _$_DsrptScreenStoreActionController.startAction(
        name: '_DsrptScreenStore.setFiltro');
    try {
      return super.setFiltro(value);
    } finally {
      _$_DsrptScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItem(RobotModel robotModel) {
    final _$actionInfo = _$_DsrptScreenStoreActionController.startAction(
        name: '_DsrptScreenStore.deleteItem');
    try {
      return super.deleteItem(robotModel);
    } finally {
      _$_DsrptScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createItem(RobotModel robotModel) {
    final _$actionInfo = _$_DsrptScreenStoreActionController.startAction(
        name: '_DsrptScreenStore.createItem');
    try {
      return super.createItem(robotModel);
    } finally {
      _$_DsrptScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateItem(RobotModel robotModel) {
    final _$actionInfo = _$_DsrptScreenStoreActionController.startAction(
        name: '_DsrptScreenStore.updateItem');
    try {
      return super.updateItem(robotModel);
    } finally {
      _$_DsrptScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtro: ${filtro},
isLoading: ${isLoading},
listaRobot: ${listaRobot},
filtered: ${filtered},
quantidade: ${quantidade}
    ''';
  }
}
