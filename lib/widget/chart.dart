import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:save_money/models/Transaction.dart';
import 'package:save_money/widget/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(
      7,
      (index) {
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
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(
        0.0, (previousValue, element) => previousValue + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  tx['day'].toString().substring(0, 1),
                  tx['amount'],
                  totalSpending != 0.0
                      ? (tx['amount'] as double) / totalSpending
                      : 0.0),
            );
          }).toList(),
        ),
      ),
    );
  }
}
