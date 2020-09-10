import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:save_money/models/Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum;
      // for (var i = 0; i < recentTransactions.length; i++) {
      //   if(recentTransactio)
      //   totalSum += recentTransactions[i].amount;
      // }
      for (var rt in recentTransactions) {
        if (rt.dateTime.day == weekDay.day &&
            rt.dateTime.month == weekDay.month &&
            rt.dateTime.year == weekDay.year) {
          totalSum += rt.amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': 100000};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: groupTransactionValues.map((tx) {
        return Text('${tx['day']}+ ${tx['amount']}');
      }).toList(),
    );
  }
}
