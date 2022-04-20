import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class CheckExpense extends StatelessWidget {
  CheckExpense({Key? key}) : super(key: key);
  Box<String> expenseStorage = Hive.box<String>("expense");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Expense"),
      ),
      body: ListView.builder(
        itemCount: expenseStorage.keys.toList().length,
        itemBuilder: (context, index) {
          final key = expenseStorage.keys.toList()[index];
          final value = expenseStorage.get(key);
          return Card(
            child: ListTile(
              leading: Text("$key"),
              title: Text("$value"),
              trailing: IconButton(
                onPressed: () {
                  expenseStorage.delete(key);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
