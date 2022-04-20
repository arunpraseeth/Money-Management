import 'package:flutter/material.dart';
import 'package:money_management/Views/check_expense.dart';
import 'package:money_management/Views/check_income.dart';
import 'package:money_management/Views/input_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Management App"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
              },
              title: const Text("Input Transaction"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckIncome(),
                  ),
                );
              },
              title: const Text("Check Income"),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckExpense(),
                  ),
                );
              },
              title: const Text("Check Expense"),
            ),
          ),
        ],
      ),
    );
  }
}
