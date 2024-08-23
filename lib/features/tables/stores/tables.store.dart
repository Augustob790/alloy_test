// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';

import '../entities/table.entity.dart';

part 'tables.store.g.dart';

class TablesStore = _TablesStoreBase with _$TablesStore;

abstract class _TablesStoreBase with Store {
  @observable
  ObservableList<TableEntity> tables = ObservableList<TableEntity>();

  @observable
  ObservableList<CustomerEntity> customersList = ObservableList<CustomerEntity>();

  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }

  @action
  void decrement() {
    if (counter > 0) {
      counter--;
    }
  }

  @action
  void addTable(TableEntity table) {
    tables.add(table);
  }

  @action
  void addCustomer(CustomerEntity customer) {
    customersList.add(customer);
  }


  @action
  void removeCustomer() {
    if(customersList.isNotEmpty){
      customersList.removeLast();
    }
  }

  @action
  void removeTable(TableEntity table) {
    tables.remove(table);
  }

  @action
  void updateTable(TableEntity table) {
    final index = tables.indexWhere((element) => element.id == table.id);
    tables[index] = table;
  }
}
