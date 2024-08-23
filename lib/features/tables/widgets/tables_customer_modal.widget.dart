import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/shared/widgets/modal.widget.dart';
import 'package:teste_flutter/shared/widgets/primary_button.widget.dart';
import 'package:teste_flutter/shared/widgets/secondary_button.widget.dart';

import '../entities/table.entity.dart';

class TablesModal extends StatefulWidget {
  const TablesModal({super.key, this.table});

  final TableEntity? table;

  @override
  State<TablesModal> createState() => _TablesModalState();
}

class _TablesModalState extends State<TablesModal> {
  TableEntity? get tables => widget.table;
  final TextEditingController identificationController = TextEditingController();
  final TextEditingController counterController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TablesStore tablesStore = GetIt.I<TablesStore>();

  @override
  void initState() {
    super.initState();
    identificationController.text = tables?.identification ?? '';
    tablesStore.counter = 0;
    if (tables == null) {
      tablesStore.counter = 0;
      tablesStore.customersList.clear();
      counterText();
    } else {
      counterController.text = tables?.counterCustomer ?? "0";
      tablesStore.counter = int.tryParse(tables!.counterCustomer)!;
    }
  }

  void handleSave() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final newTable = TableEntity(
      id: tables?.id ?? DateTime.now().millisecondsSinceEpoch,
      identification: identificationController.text,
      counterCustomer: counterController.text,
      customers: tablesStore.customersList,
    );

    if (tables == null) {
      tablesStore.addTable(newTable);
    } else {
      tablesStore.updateTable(newTable);
    }

    Navigator.of(context).pop();
  }

  String? inputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  void counterText() {
    counterController.text = tablesStore.counter.toString();
  }

  void addCustomer() {
    tablesStore.addCustomer(CustomerEntity(
        id: DateTime.now().millisecondsSinceEpoch,
        name: 'Nome do Cliente',
        phone: 'Telefone do Cliente'));
    counterText();
  }

  void removeCustomer() {
    tablesStore.removeCustomer();
    counterText();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Modal(
        width: 450,
        title: tables == null
            ? 'Nova Mesa'
            : 'Editar Informações da Mesa ${tables?.id}',
        content: [
          TextFormField(
            controller: identificationController,
            decoration:
                const InputDecoration(labelText: 'Identificação da mesa'),
            validator: inputValidator,
            autofocus: true,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Informação temporária para ajudar na identificação do cliente.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text(
                "Clientes nesta Conta",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  letterSpacing: 0.25,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Associe os clientes aos pedidos para salvar o pedido no histórico\ndo cliente, pontuar no fidelidade e fazer pagamentos no fiado.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    letterSpacing: 0.25,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: counterController,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade de pessoas',
                  ),
                  validator: inputValidator,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50,
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Color.fromARGB(88, 0, 0, 0),
                    ),
                    onPressed: () {
                      tablesStore.decrement();
                      counterText();
                      removeCustomer();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(88, 0, 0, 0),
                    ),
                    onPressed: () {
                      tablesStore.increment();
                      counterText();
                      addCustomer();
                    },
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Divider(height: 10),
          ),
          Observer(builder: (context) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tablesStore.customersList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(28, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.person_outlined, color: Color.fromARGB(88, 0, 0, 0)),
                        trailing:  index == 0 ? const Icon(Icons.link_off_rounded, color: Color.fromARGB(88, 0, 0, 0)) : const Icon(Icons.search, color: Color.fromARGB(88, 0, 0, 0)),
                        title: Text(
                          index == 0 ?  '[Nome]' : 'Cliente $index',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 0.25,
                            height: 1.5,
                          ),
                        ),
                        subtitle: Text(
                           index == 0 ?  '[telefone]' : 'Não Informado',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            letterSpacing: 0.25,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          SecondaryButton(
            onPressed: () => Navigator.of(context).pop(),
            text: 'Voltar',
          ),
          PrimaryButton(onPressed: handleSave, text: 'Salvar'),
        ],
      ),
    );
  }
}
