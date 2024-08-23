// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TablesStore on _TablesStoreBase, Store {
  late final _$tablesAtom =
      Atom(name: '_TablesStoreBase.tables', context: context);

  @override
  ObservableList<TableEntity> get tables {
    _$tablesAtom.reportRead();
    return super.tables;
  }

  @override
  set tables(ObservableList<TableEntity> value) {
    _$tablesAtom.reportWrite(value, super.tables, () {
      super.tables = value;
    });
  }

  late final _$customersListAtom =
      Atom(name: '_TablesStoreBase.customersList', context: context);

  @override
  ObservableList<CustomerEntity> get customersList {
    _$customersListAtom.reportRead();
    return super.customersList;
  }

  @override
  set customersList(ObservableList<CustomerEntity> value) {
    _$customersListAtom.reportWrite(value, super.customersList, () {
      super.customersList = value;
    });
  }

  late final _$counterAtom =
      Atom(name: '_TablesStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_TablesStoreBaseActionController =
      ActionController(name: '_TablesStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTable(TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.addTable');
    try {
      return super.addTable(table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCustomer(CustomerEntity customer) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.addCustomer');
    try {
      return super.addCustomer(customer);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCustomer() {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.removeCustomer');
    try {
      return super.removeCustomer();
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTable(TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.removeTable');
    try {
      return super.removeTable(table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTable(TableEntity table) {
    final _$actionInfo = _$_TablesStoreBaseActionController.startAction(
        name: '_TablesStoreBase.updateTable');
    try {
      return super.updateTable(table);
    } finally {
      _$_TablesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tables: ${tables},
customersList: ${customersList},
counter: ${counter}
    ''';
  }
}
