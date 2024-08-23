import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/table_card.widget.dart';

import 'tables_customer_modal.widget.dart';

class TablesList extends StatefulWidget {
  const TablesList({super.key});

  @override
  State<TablesList> createState() => _TablesListState();
}

class _TablesListState extends State<TablesList> {
  final tables = List.generate(1, (index) => index).toList();
  final TablesStore tablesStore = GetIt.I<TablesStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (context) {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: tablesStore.tables
                    .map(
                      (e) => InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return TablesModal(table: e);
                              },
                            );
                          },
                          child: TableCard(tableEntity: e)),
                    )
                    .toList(),
              );
            }),
          ],
        ));
  }
}
