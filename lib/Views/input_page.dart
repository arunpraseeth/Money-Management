import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management/Controller/choose_radio.dart';
import 'package:money_management/Controller/increment_unit.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InputPage extends StatelessWidget {
  InputPage({Key? key}) : super(key: key);
  Box<String> incomeStorage = Hive.box<String>("income");
  Box<String> expenseStorage = Hive.box<String>("expense");
  TextEditingController amount = TextEditingController();
  int incomeUnit = 0;
  int expenseUnit = 0;

  @override
  Widget build(BuildContext context) {
    int chosenValue = Provider.of<ChooseRadio>(context).chosenValue;
    int incomeValue = Provider.of<IncrementUnit>(context).incomeIncrementValue;
    int expenseValue =
        Provider.of<IncrementUnit>(context).expenseIncrementValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              value: 1,
              groupValue: chosenValue,
              onChanged: (value) {
                Provider.of<ChooseRadio>(context, listen: false)
                    .choose(value: 1);
              },
              title: const Text("Income"),
            ),
            RadioListTile(
              value: 2,
              groupValue: chosenValue,
              onChanged: (value) {
                Provider.of<ChooseRadio>(context, listen: false)
                    .choose(value: 2);
              },
              title: const Text("Expense"),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: amount,
              ),
            ),
            TextButton(
              onPressed: () {
                if (chosenValue == 1) {
                  Provider.of<IncrementUnit>(context, listen: false)
                      .incomeIncrement(value: incomeUnit++);

                  incomeStorage.put(
                    incomeValue,
                    amount.text.trim(),
                  );
                } else {
                  Provider.of<IncrementUnit>(context, listen: false)
                      .expenseIncrement(value: expenseUnit++);

                  expenseStorage.put(
                    expenseValue,
                    amount.text.trim(),
                  );
                }
                amount.clear();
              },
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
