import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:save_money/models/Transaction.dart';
import 'package:save_money/widget/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var rt in recentTransactions) {
        if (rt.dateTime.day == weekDay.day &&
            rt.dateTime.month == weekDay.month &&
            rt.dateTime.year == weekDay.year) {
          totalSum += rt.amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupTransactionValues.fold(
        0.0, (previousValue, element) => previousValue + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: groupTransactionValues.map((tx) {
        // return Text('${tx['day']}+ ${tx['amount']}');
        return ChartBar(
            tx['day'], tx['amount'], (tx['amount'] as double) / totalSpending);
      }).toList(),
    );
  }
}
