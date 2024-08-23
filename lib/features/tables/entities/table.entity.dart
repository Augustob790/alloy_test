import 'package:teste_flutter/features/customers/entities/customer.entity.dart';

class TableEntity {
  TableEntity({
    required this.id,
    required this.identification,
    required this.customers,
    required this.counterCustomer,
  });

  final int id;
  final String counterCustomer;
  final String identification;
  final List<CustomerEntity> customers;

  TableEntity copyWith({
    String? identification,
    List<CustomerEntity>? customers,
  }) {
    return TableEntity(
      id: id,
      counterCustomer: counterCustomer,
      identification: identification ?? this.identification,
      customers: customers ?? this.customers,
    );
  }
}
