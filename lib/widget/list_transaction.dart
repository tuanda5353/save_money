import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Transaction.dart';

class ListTransaction extends StatefulWidget {
  final List<Transaction> transactions;

  final Function deleteTx;

  ListTransaction(this.transactions, this.deleteTx);

  @override
  _ListTransactionState createState() => _ListTransactionState();
}

class _ListTransactionState extends State<ListTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: widget.transactions.isEmpty
            ? Column(
                children: [
                  Container(
                      width: double.infinity,
                      child: Text(
                        'Transaction is emty!',
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    height: 150,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                            child:
                                Text('\$${widget.transactions[index].amount}')),
                      ),
                    ),
                    title: Text('${widget.transactions[index].title}'),
                    subtitle: Text(
                        '${DateFormat.yMMMd().format(widget.transactions[index].dateTime)}'),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        widget.deleteTx(widget.transactions[index].id);
                      },
                    ),
                  ),
                ),
                itemCount: widget.transactions.length,
              ));
  }
}
