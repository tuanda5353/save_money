import 'package:flutter/material.dart';
import 'package:save_money/widget/list_transaction.dart';
import 'package:save_money/widget/new_transaction.dart';

import 'models/Transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        id: '1', title: 'Mua sach', amount: 2000, dateTime: DateTime.now()),
    Transaction(
        id: '2', title: 'Mua sach', amount: 2000, dateTime: DateTime.now())
  ];

  void _startAddNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _addNewTransaction(String title, double amount) {
    final transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now());
    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Chart"),
              elevation: 5,
            ),
          ),
          NewTransaction(_addNewTransaction),
          ListTransaction(_transactions),
        ],
      ),
    );
  }
}
