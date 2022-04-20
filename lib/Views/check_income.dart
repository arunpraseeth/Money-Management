import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class CheckIncome extends StatelessWidget {
  CheckIncome({Key? key}) : super(key: key);
  Box<String> incomeStorage = Hive.box<String>("income");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Income"),
      ),
      body: ListView.builder(
        itemCount: incomeStorage.keys.toList().length,
        itemBuilder: (context, index) {
          final key = incomeStorage.keys.toList()[index];
          final value = incomeStorage.get(key);
          return Card(
            child: ListTile(
              leading: Text("$key"),
              title: Text("$value"),
              trailing: IconButton(
                onPressed: () {
                  incomeStorage.delete(key);
                  
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
