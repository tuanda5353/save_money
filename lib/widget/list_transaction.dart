import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Transaction.dart';

class ListTransaction extends StatefulWidget {
  final List<Transaction> transactions;

//  Transaction(
//  id: '1', title: 'Mua sach', amount: 2000, dateTime: DateTime.now()),
//  Transaction(
//  id: '2', title: 'Mua sach', amount: 2000, dateTime: DateTime.now())

  ListTransaction(this.transactions);

  @override
  _ListTransactionState createState() => _ListTransactionState();
}

class _ListTransactionState extends State<ListTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: widget.transactions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      "A: ${widget.transactions[index].amount}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.transactions[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat()
                            .add_yMMMEd()
                            .format(widget.transactions[index].dateTime),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
